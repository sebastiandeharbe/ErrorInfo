codeunit 50100 "Error Codeunit"
{
    trigger OnRun()
    begin
    end;

    [Obsolete]
    procedure TestError(e: ErrorInfo)
    var
        Customer: Record Customer;
        CustomerCard: Page "Customer Card";
    begin
        // Message('Hola terricola!');
        // Customer.Get(e.RecordId);
        // CustomerCard.SetRecord(Customer);
        // CustomerCard.Run();
        Message(e.Callstack);
    end;
}