from SqlModels import callcenter_session as session, CommunicationLog, CommunicationType, Agent, Lead, Extension
from sqlalchemy import func


def start_point():
    lead_query = session.query(Lead).filter(Lead.agent_id != None)  # query
    lead = lead_query.first()  # will just get the first one but this will execute the query
    ext = session.query(Extension).first()
    ct = session.query(CommunicationType).all()  # this will get all

    # nice complex join here get us communication log
    # where the agent that did it last_name was smith
    # and called 'HomePhone'
    cl = session.query(CommunicationLog). \
        join(Agent). \
        join(CommunicationType). \
        filter(CommunicationType.name == 'HomePhone'). \
        filter(Agent.last_name == 'Smith'). \
        first()

    part1 = session.query(Agent).order_by(Agent.start_date).first()
    part2 = session.query(CommunicationLog).order_by(CommunicationLog.started_at).first()
    part3 = session.query(Extension).outerjoin(Agent).filter(Agent.id == None).all()
    part4 = session.query(Agent.extension_id, func.count(Agent.extension_id)).group_by(Agent.extension_id).order_by(
        func.count(Agent.extension_id).desc()).first()

    part5 = session.query(CommunicationLog). \
        join(CommunicationType). \
        filter(CommunicationType.name == 'Email'). \
        join(Lead). \
        order_by(CommunicationLog.started_at). \
        first()

    # nicer syntax at the end but less performant
    part5Comples = {
        part5.lead.first_name,
        part5.lead.last_name,
        part5.communication_type.name,
        part5.started_at,
        part5.ended_at
    }

    part5_performant = session.query(CommunicationLog.started_at, CommunicationLog.ended_at, CommunicationType.name,
                                     Lead.first_name, Lead.last_name). \
        join(CommunicationType, CommunicationLog.communication_type_id == CommunicationType.id). \
        join(Lead, CommunicationLog.lead_id == Lead.id). \
        filter(CommunicationType.name == 'Email'). \
        order_by(CommunicationLog.started_at). \
        first()

    part6 = session.query(Lead.removed_at,Agent.first_name, Agent.last_name,CommunicationLog.started_at) \
        .filter(Lead.removed_at != None). \
        join(CommunicationLog, Lead.id == CommunicationLog.lead_id). \
        filter(CommunicationLog.started_at > Lead.removed_at). \
        join(Agent, Agent.id== CommunicationLog.agent_id). \
        all()

    part7 = session.query(Agent.id,Agent.first_name,Agent.last_name,func.count(Agent.id)).\
        join(Lead,Lead.agent_id == Agent.id).\
        filter(Lead.removed_at != None).\
        group_by(Agent.id).\
        order_by(func.count(Agent.id).desc()).all()

    # with this record we can then see the extension the agent used to make that call from CommunicationLog
    ext = cl.agent.extension.extension
    print(
        F"{cl.lead.first_name} {cl.lead.last_name} was called on there home phone {cl.lead.home_phone} on {cl.started_at}"
        + F"\nby {cl.agent.first_name} {cl.agent.last_name} on extension {ext}")

    result = session.query(Agent).filter(Agent.extension_id == 39)  # builds a query
    for row in result:  # will iterate through a open connection
        print("ID:", row.id, F"Name: {row.first_name} - {row.last_name}", "extensionid:", row.extension_id)
        removed = session.query(Lead).filter(
            Lead.agent_id == row.id and Lead.convertedat != None)  # a query with in a query with lot better filters
        for remove in removed:
            print(F"\t {remove.first_name}")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    start_point()
