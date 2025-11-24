BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Session] ADD [accountOwner] BIT CONSTRAINT [Session_accountOwner_df] DEFAULT 0,
[collaborator] BIT CONSTRAINT [Session_collaborator_df] DEFAULT 0,
[email] NVARCHAR(1000),
[emailVerified] BIT CONSTRAINT [Session_emailVerified_df] DEFAULT 0,
[expires] DATETIME2,
[firstName] NVARCHAR(1000),
[isOnline] BIT NOT NULL CONSTRAINT [Session_isOnline_df] DEFAULT 0,
[lastName] NVARCHAR(1000),
[locale] NVARCHAR(1000),
[state] NVARCHAR(1000),
[userId] NVARCHAR(1000);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
