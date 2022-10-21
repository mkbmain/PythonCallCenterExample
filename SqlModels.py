from sqlalchemy import create_engine, Column, Integer, String, DateTime, MetaData, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

engine = create_engine("postgresql+psycopg2://postgres:A1234567a@localhost/callcenter")  ## change this to your postgres server
meta = MetaData(schema='dbo')
Base = declarative_base(metadata=meta)
Session = sessionmaker(bind=engine)
callcenter_session = Session()

meta.create_all(engine)


class Agent(Base):
    __tablename__ = 'agents'
    id = Column(Integer, primary_key=True)
    first_name = Column(String, name="firstname")
    last_name = Column(String, name="lastname")
    extension_id = Column(Integer, ForeignKey('extensions.id'), name="extensionid")
    start_date = Column(DateTime, name="startdate")
    end_date = Column(DateTime, name="enddate")
    leads = relationship('Lead', load_on_pending=True)
    communication_logs = relationship('CommunicationLog', load_on_pending=True)
    extension = relationship('Extension', load_on_pending=True)


class CommunicationType(Base):
    __tablename__ = 'communicationtype'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    communication_logs = relationship('CommunicationLog', load_on_pending=True)


class CommunicationLog(Base):
    __tablename__ = 'communicationlog'
    id = Column(Integer, primary_key=True)
    lead_id = Column(Integer, ForeignKey("leads.id"), name='leadid')
    communication_type_id = Column(Integer, ForeignKey("communicationtype.id"), name="communicationtypeid")
    agent_id = Column(Integer, ForeignKey("agents.id"), name="agentid")
    started_at = Column(DateTime, name="startedat")
    ended_at = Column(DateTime, name="endedat")
    communication_type = relationship('CommunicationType', load_on_pending=True)
    agent = relationship('Agent', load_on_pending=True)
    lead = relationship('Lead', load_on_pending=True)


class Extension(Base):
    __tablename__ = 'extensions'
    id = Column(Integer, primary_key=True)
    extension = Column(String, name="ext")
    agents = relationship('Agent', load_on_pending=True)


class Lead(Base):
    __tablename__ = 'leads'
    id = Column(Integer, primary_key=True)
    first_name = Column(String, name="firstname")
    last_name = Column(String, name="lastname")
    mobile = Column(String)
    email = Column(String)
    home_phone = Column(String, name="homephone")
    converted_at = Column(DateTime, name="convertedat")
    removed_at = Column(DateTime, name="removedat")
    agent_id = Column(Integer, ForeignKey('agents.id'), name="agentid", nullable=True)
    agent = relationship('Agent', load_on_pending=True)
    communication_logs = relationship('CommunicationLog', load_on_pending=True)
