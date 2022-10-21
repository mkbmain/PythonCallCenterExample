from sqlalchemy import create_engine, Column, Integer, String, DateTime, MetaData, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship

engine = create_engine(
    "postgresql+psycopg2://postgres:A1234567a@localhost/callcenter")  ## change this to your postgres server
meta = MetaData(schema='dbo')
Base = declarative_base(metadata=meta)
Session = sessionmaker(bind=engine)
callcenter_session = Session()


# meta.create_all(engine)


class Agent(Base):
    __tablename__ = 'agents'
    id = Column(Integer, primary_key=True)
    first_name = Column(String, name="firstname", nullable=False)
    last_name = Column(String, name="lastname", nullable=False)
    extension_id = Column(Integer, ForeignKey('extensions.id'), name="extensionid", nullable=False)
    start_date = Column(DateTime, name="startdate")
    end_date = Column(DateTime, name="enddate", nullable=True)
    leads = relationship('Lead', lazy='select', back_populates="agent")
    communication_logs = relationship('CommunicationLog', lazy='select', back_populates="agent")
    extension = relationship('Extension', lazy='select', back_populates="agents")


class CommunicationType(Base):
    __tablename__ = 'communication_types'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    communication_logs = relationship('CommunicationLog', lazy='select', back_populates="communication_type")


class CommunicationLog(Base):
    __tablename__ = 'communication_logs'
    id = Column(Integer, primary_key=True)
    lead_id = Column(Integer, ForeignKey("leads.id"), name='leadid', nullable=False)
    communication_type_id = Column(Integer, ForeignKey("communication_types.id"), name="communicationtypeid",
                                   nullable=False)
    agent_id = Column(Integer, ForeignKey("agents.id"), name="agentid", nullable=False)
    started_at = Column(DateTime, name="startedat", nullable=False)
    ended_at = Column(DateTime, name="endedat", nullable=False)
    communication_type = relationship('CommunicationType', lazy='select', back_populates="communication_logs")
    agent = relationship('Agent', lazy='select', back_populates="communication_logs")
    lead = relationship('Lead', lazy='select', back_populates="communication_logs")


class Extension(Base):
    __tablename__ = 'extensions'
    id = Column(Integer, primary_key=True)
    extension = Column(String, name="ext")
    agents = relationship('Agent', lazy='select', back_populates="extension")


class Lead(Base):
    __tablename__ = 'leads'
    id = Column(Integer, primary_key=True)
    first_name = Column(String, name="firstname")
    last_name = Column(String, name="lastname")
    mobile = Column(String)
    email = Column(String)
    home_phone = Column(String, name="homephone")
    converted_at = Column(DateTime, name="convertedat", nullable=True)
    removed_at = Column(DateTime, name="removedat", nullable=True)
    agent_id = Column(Integer, ForeignKey('agents.id'), name="agentid", nullable=True)
    agent = relationship('Agent', lazy='select', back_populates="leads")
    communication_logs = relationship('CommunicationLog', lazy='select', back_populates="lead")
