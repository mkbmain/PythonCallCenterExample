from SqlModels import callcenter_session as session, CommunicationLog, CommunicationType, Agent, Lead, Extension


def start_point(name):
    lead = session.query(Lead).filter(Lead.agent_id != None).first()  # will just get the first one
    ext = session.query(Extension).first()
    ct = session.query(CommunicationType).all()  # this will get all
    cl = session.query(CommunicationLog).join(Agent).join(CommunicationType).filter(
        CommunicationType.name == 'MobileSms').filter(Agent.last_name == 'Smith').first()

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
