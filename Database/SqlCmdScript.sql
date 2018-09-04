use master;
GO
create database [dncmt.jobs];
GO
use [dncmt.jobs];

CREATE TABLE [dbo].[JobApplicants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[ApplicantId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_JobApplicants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Jobs](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[PostedDate] [datetime] NULL,
	[Location] [nvarchar](max) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[JobApplicants]  WITH CHECK ADD  CONSTRAINT [FK_JobApplicants_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([JobId])
GO
ALTER TABLE [dbo].[JobApplicants] CHECK CONSTRAINT [FK_JobApplicants_Jobs]
GO

--data 
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Senior Software Engineer','We are seeking a Senior Software Engineer to implement ease-of-use functionality for our integrated IT Risk Management Platform built on .Net, SQL and Angular JS.','HyperSec',getutcdate(),'Toronto, ON')
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Developer (.Net)','Design, implement, debug web-based applications using the appropriate tools and adhering to our coding standards Review project requirements, assess and estimate the necessary time-to-completion Contribute to and lead architecture and design activities Create unit test plans and scenarios for development unit testing Interact with other development teams to carry out code reviews and to ensure a consistent approach to software development Deploy all integration artifacts to a testing and production environment Assist other developers in resolving software development issues Perform additional duties as needed','HyperSec',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('C#/.NET Developer','Help schools and parents in a meaningful way by using your talent as a developer to create real world solutions for their needs. We are looking for a strong C# / .NET Developer to join our product development team responsible for designing then developing new products, as well as improving our current suite of desktop, web, and mobile applications. Some of the technologies we work with are ASP.NET Core / React / Redux, WPF using the MVVM pattern, SOAP / REST based services, and MS-SQL.','Progressive Soft',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Full-Stack Web Developer (ASP.NET Core / React.js / C#)','Help schools and parents in a meaningful way by using your talent as a developer to create real world solutions for their needs. We are looking for a strong Full-Stack Web Developer to join our product development team responsible for designing then developing new products, as well as improving our current suite of application using modern web technologies such as ASP.NET Core 2.0 / Node.js / React / Redux / Bootstrap using C# and TypeScript.  Our intelligent software manages student fees, bills parents, collect payments, synchronizes and transforms data from many different sources, and includes reporting and visualization features. Contribute to project requirements, system architecture, and brainstorm product ideas. Then, build and execute on these as part of a Scrum team using a high-end computer and large screens!','Progressive Soft',getutcdate(),'Vancouver, BC');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Snr full stack C#.NET Developer','We''re currently looking for a talented Senior Back-End .Net Developer to join our team on a permanent full time position. The ideal candidate will have the opportunity to work for one of the highest grossing E-Tailers in North America.  What you''ll do: Maintain existing CRM, and Web-based applications in VB.NET/ASP.NET. Create user-friendly and process-efficient interfaces and tools for internal staff to access data relevant to our business. Interact with staff to track down bugs, feature requests, and potential improvements to internal applications Assist in IT related activities.','CyMax',getutcdate(),'Vancouver, BC');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Software Developer/Consultant','Collaborate in small teams to design, build, and deploy quality software solutions for our enterprise customers Help shape our long-term technical roadmap as we scale our infrastructure and build new products Solve complex problems related to development and provide accurate estimates and scope for team deliverables Work independently and be able to effectively communicate verbally and in writing with both our customers and internal teams Perform other job-related duties as assigned, we are a small and growing organization where we are all continuously improving our daily activities to be more productive Needs to be available for occasional travel (BC, Alberta, Washington) Needs to be able to multitask, we are looking for a keen individual ready to learn and adapt to a high paced customer facing position','DMS Group',getutcdate(),'Vancouver, BC');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Lead Software Developer','Based in Vancouver, the Lead Software Developer will be responsible for bringing creative solutions to complex software requirements as part of a small team of software developers. This individual must understand modern/agile software development lifecycle processes, and enjoy working in a challenging environment to develop web applications, as well as building state of the art software with complex requirements. The successful candidate must have a very good knowledge of C# programming and be an independent, highly-motivated, results-driven individual who has a positive attitude and a willingness to learn.','ComWave',getutcdate(),'Calgary, AB');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Front End Web Developer','MarTec Investigations is seeking a front end web developer with 5+ years of JavaScript development who is proficient in ES6/ES2015 and newer language features. Extensive experience with the React/Redux framework is required. The candidate should also have considerable experience with a Microsoft .Net full stack (ASP.NET MVC/ C# / SQL Server).  The successful candidate will work with the MarTec Data Services team developing geo-spatial visualization applications, reporting and operations management tools and interfaces for access from PC and mobile devices. This is an ideal position for a self-starter who is able to produce results with limited supervision.','MarTec Investigations',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Software Applications, Developer (with .Net Experience)','Analysis, Design, and Development of Software Applications using various software languages and tools like Dot Net and Developing Dot Net Web-based Applications.  Analyze users’ needs by researching through the available documentation and then design, test, and develop the features of the product.  Also perform necessary integration support to the basic product.  Evaluate & recommend software upgrades for existing and prospective customers.  Design each unit at a modular level and plan for unit wise integration of the pieces to ensure that final product works in one single piece.','Marvel Technologies',getutcdate(),'Toronto, ON');
INSERT INTO Jobs([Title],[Description],[Company],[PostedDate],[Location]) VALUES('Sr. Software Developer','Transform business and system requirements into functional code Contributes to creation of standard approaches and techniques Assist with code quality checks and peer reviews Provide technical software support, including investigating and qualifying bugs, interpreting procedure manuals, and maintaining accurate documentation Out of the box thinking, to identify and work around process design Understand, learn and develop on different robotics tools Involvement in full development life cycle; design, coding, test, build, QA, deployment and maintenance','SmartLink',getutcdate(),'Ottawa, ON');
