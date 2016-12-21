@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  restful-service startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and RESTFUL_SERVICE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\restful-service.jar;%APP_HOME%\lib\spring-context-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-data-jpa-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-data-mongodb-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-hateoas-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-jersey-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-web-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-test-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-1.2.6.RELEASE.jar;%APP_HOME%\lib\h2-1.4.188.jar;%APP_HOME%\lib\spring-aop-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-beans-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-core-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-expression-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-aop-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-jdbc-1.2.6.RELEASE.jar;%APP_HOME%\lib\hibernate-entitymanager-4.3.11.Final.jar;%APP_HOME%\lib\javax.transaction-api-1.2.jar;%APP_HOME%\lib\spring-orm-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-data-jpa-1.7.3.RELEASE.jar;%APP_HOME%\lib\spring-aspects-4.1.7.RELEASE.jar;%APP_HOME%\lib\mongo-java-driver-2.12.5.jar;%APP_HOME%\lib\spring-tx-4.1.7.RELEASE.jar;%APP_HOME%\lib\spring-data-mongodb-1.6.3.RELEASE.jar;%APP_HOME%\lib\spring-hateoas-0.16.0.RELEASE.jar;%APP_HOME%\lib\spring-plugin-core-1.1.0.RELEASE.jar;%APP_HOME%\lib\jackson-databind-2.4.6.jar;%APP_HOME%\lib\hibernate-validator-5.1.3.Final.jar;%APP_HOME%\lib\spring-web-4.1.7.RELEASE.jar;%APP_HOME%\lib\jersey-server-2.14.jar;%APP_HOME%\lib\jersey-container-servlet-core-2.14.jar;%APP_HOME%\lib\jersey-container-servlet-2.14.jar;%APP_HOME%\lib\jersey-bean-validation-2.14.jar;%APP_HOME%\lib\jersey-spring3-2.14.jar;%APP_HOME%\lib\jersey-media-json-jackson-2.14.jar;%APP_HOME%\lib\spring-webmvc-4.1.7.RELEASE.jar;%APP_HOME%\lib\junit-4.12.jar;%APP_HOME%\lib\mockito-core-1.10.19.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\hamcrest-library-1.3.jar;%APP_HOME%\lib\spring-test-4.1.7.RELEASE.jar;%APP_HOME%\lib\tomcat-embed-core-8.0.26.jar;%APP_HOME%\lib\tomcat-embed-el-8.0.26.jar;%APP_HOME%\lib\tomcat-embed-logging-juli-8.0.26.jar;%APP_HOME%\lib\tomcat-embed-websocket-8.0.26.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\spring-boot-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-autoconfigure-1.2.6.RELEASE.jar;%APP_HOME%\lib\spring-boot-starter-logging-1.2.6.RELEASE.jar;%APP_HOME%\lib\snakeyaml-1.14.jar;%APP_HOME%\lib\aspectjrt-1.8.6.jar;%APP_HOME%\lib\aspectjweaver-1.8.6.jar;%APP_HOME%\lib\spring-jdbc-4.1.7.RELEASE.jar;%APP_HOME%\lib\tomcat-jdbc-8.0.26.jar;%APP_HOME%\lib\jboss-logging-3.1.3.GA.jar;%APP_HOME%\lib\jboss-logging-annotations-1.2.0.Beta1.jar;%APP_HOME%\lib\hibernate-core-4.3.11.Final.jar;%APP_HOME%\lib\dom4j-1.6.1.jar;%APP_HOME%\lib\hibernate-commons-annotations-4.0.5.Final.jar;%APP_HOME%\lib\hibernate-jpa-2.1-api-1.0.0.Final.jar;%APP_HOME%\lib\javassist-3.18.1-GA.jar;%APP_HOME%\lib\spring-data-commons-1.9.3.RELEASE.jar;%APP_HOME%\lib\slf4j-api-1.7.12.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.12.jar;%APP_HOME%\lib\objenesis-2.1.jar;%APP_HOME%\lib\jackson-annotations-2.4.0.jar;%APP_HOME%\lib\jackson-core-2.4.6.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar;%APP_HOME%\lib\classmate-1.0.0.jar;%APP_HOME%\lib\jersey-common-2.14.jar;%APP_HOME%\lib\jersey-client-2.14.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\hk2-api-2.4.0-b06.jar;%APP_HOME%\lib\javax.inject-2.4.0-b06.jar;%APP_HOME%\lib\hk2-locator-2.4.0-b06.jar;%APP_HOME%\lib\hk2-2.4.0-b06.jar;%APP_HOME%\lib\spring-bridge-2.4.0-b06.jar;%APP_HOME%\lib\jackson-jaxrs-base-2.3.2.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.3.2.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.12.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.12.jar;%APP_HOME%\lib\logback-classic-1.1.3.jar;%APP_HOME%\lib\tomcat-juli-8.0.26.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jandex-1.1.0.Final.jar;%APP_HOME%\lib\xml-apis-1.0.b2.jar;%APP_HOME%\lib\jersey-guava-2.14.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.1.jar;%APP_HOME%\lib\hk2-utils-2.4.0-b06.jar;%APP_HOME%\lib\aopalliance-repackaged-2.4.0-b06.jar;%APP_HOME%\lib\config-types-2.4.0-b06.jar;%APP_HOME%\lib\core-2.4.0-b06.jar;%APP_HOME%\lib\hk2-config-2.4.0-b06.jar;%APP_HOME%\lib\hk2-runlevel-2.4.0-b06.jar;%APP_HOME%\lib\class-model-2.4.0-b06.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.3.2.jar;%APP_HOME%\lib\logback-core-1.1.3.jar;%APP_HOME%\lib\tiger-types-1.4.jar;%APP_HOME%\lib\bean-validator-2.4.0-b06.jar;%APP_HOME%\lib\asm-all-repackaged-2.4.0-b06.jar

@rem Execute restful-service
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %RESTFUL_SERVICE_OPTS%  -classpath "%CLASSPATH%" restful.app.ServicioRestful %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable RESTFUL_SERVICE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%RESTFUL_SERVICE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
