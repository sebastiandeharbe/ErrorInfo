// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("Test 1")
            {
                Caption = 'TEST BUTTON Client Error';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ErrInfo1: ErrorInfo;
                begin
                    ErrInfo1.Title := 'Se rompió todo';
                    ErrInfo1.Message := 'Este es un error!';
                    ErrInfo1.DetailedMessage := 'Lo sentimos, no pudimos procesar su solicitud debido a un error en el nombre del cliente. El nombre ingresado' + Rec.Name + '. Por favor, intente nuevamente y asegúrese de ingresar el nombre del cliente correctamente. Si sigue teniendo problemas, comuníquese con nuestro servicio de atención al cliente para obtener asistencia adicional.';
                    // ErrInfo1.Verbosity(Verbosity::Normal);
                    ErrInfo1.TableId(Database::Customer);
                    ErrInfo1.RecordId(Rec.RecordId);
                    ErrInfo1.AddAction('Abrir Registro por Accion', Codeunit::"Error Codeunit", 'TestError');
                    ErrInfo1.AddNavigationAction('Abrir Registro Navegando');
                    ErrInfo1.ErrorType(ErrorType::Client);
                    ErrInfo1.Verbosity(Verbosity::Error);
                    Error(ErrInfo1);
                end;
            }

            action("Test 2")
            {
                Caption = 'TEST BUTTON Internal Error';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ErrInfo1: ErrorInfo;
                begin
                    ErrInfo1.Title := 'Se rompió todo';
                    ErrInfo1.Message := 'Este es un grave error!';
                    ErrInfo1.DetailedMessage := 'Lo sentimos, no pudimos procesar su solicitud debido a un error en el nombre del cliente. El nombre ingresado' + Rec.Name + '. Por favor, intente nuevamente y asegúrese de ingresar el nombre del cliente correctamente. Si sigue teniendo problemas, comuníquese con nuestro servicio de atención al cliente para obtener asistencia adicional.';
                    ErrInfo1.Verbosity(Verbosity::Warning);
                    ErrInfo1.TableId(Database::Customer);
                    ErrInfo1.RecordId(Rec.RecordId);
                    // ErrInfo1.PageNo(Page::Currencies);
                    // ErrInfo1.AddAction('Abrir Registro por Accion', Codeunit::"Error Codeunit", 'TestError');
                    // ErrInfo1.AddNavigationAction('Abrir Registro Navegando');
                    ErrInfo1.ErrorType(ErrorType::Internal);
                    Error(ErrInfo1);
                    Page.Run(Page::"Company Information");
                end;
            }
        }
    }

    local procedure ProcedimientoError()
    var
        ErrInfo: ErrorInfo;
    begin
        ErrInfo.Title := 'Se rompió todo!';
        ErrInfo.Message := 'Este es un grave error';
        ErrInfo.DetailedMessage := 'Lo sentimos, no pudimos procesar su solicitud debido a un error en el nombre del cliente. El nombre ingresado' + Rec.Name + '. Por favor, intente nuevamente y asegúrese de ingresar el nombre del cliente correctamente. Si sigue teniendo problemas, comuníquese con nuestro servicio de atención al cliente para obtener asistencia adicional.';
        Error(ErrInfo);
    end;



}