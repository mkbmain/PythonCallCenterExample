from SqlModels import callcenter_session as session, CommunicationLog, CommunicationType, Agent, Lead, Extension


def start_point(name):
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
        filter(Agent.last_name == 'Smith').first()

    # with this record we can then see the extension the agent used to make that call from CommunicationLog
    ext = cl.agent.extension.extension
    print(
        F"{cl.lead.first_name} {cl.lead.last_name} was called on there home phone {cl.lead.home_phone} on {cl.started_at}" +
        F"\nby {cl.agent.first_name} {cl.agent.last_name} on extension {ext}")

    result = session.query(Agent).filter(Agent.extension_id == 39)  # builds a query
    for row in result:  ## will iterate through a open connection
        print("ID:", row.id, F"Name: {row.first_name} - {row.last_name}", "extensionid:", row.extension_id)
        removed = session.query(Lead).filter(
            Lead.agent_id == row.id and Lead.convertedat != None)  # a query with in a query with lot better filters
        for remove in removed:
            print(F"\t {remove.first_name}")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    start_point('PyCharm')
