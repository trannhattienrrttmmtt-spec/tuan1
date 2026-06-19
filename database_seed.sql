SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetRoles] WHERE [Id] = N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5')
BEGIN
    INSERT INTO [AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
    VALUES (N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5', N'Admin', N'ADMIN', NULL);
END;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetRoles] WHERE [Id] = N'4b5e26b7-f74a-4246-bbd4-632b7d0799dc')
BEGIN
    INSERT INTO [AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
    VALUES (N'4b5e26b7-f74a-4246-bbd4-632b7d0799dc', N'Customer', N'CUSTOMER', NULL);
END;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetRoles] WHERE [Id] = N'94e39f4f-e834-4524-adc6-d5fb3e348251')
BEGIN
    INSERT INTO [AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
    VALUES (N'94e39f4f-e834-4524-adc6-d5fb3e348251', N'Company', N'COMPANY', NULL);
END;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetRoles] WHERE [Id] = N'c00ca617-9247-48a6-bd2f-05da179e9b08')
BEGIN
    INSERT INTO [AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
    VALUES (N'c00ca617-9247-48a6-bd2f-05da179e9b08', N'Employee', N'EMPLOYEE', NULL);
END;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [Id] = N'23190fb4-d3ea-4590-9746-10873e0787ce')
BEGIN
    INSERT INTO [AspNetUsers] (
        [Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName],
        [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp],
        [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled],
        [LockoutEnd], [LockoutEnabled], [AccessFailedCount]
    )
    VALUES (
        N'23190fb4-d3ea-4590-9746-10873e0787ce', N'Trần Nhật Tiến', N'36 trương văn thành', N'21',
        N'trannhattien981@gmail.com', N'TRANNHATTIEN981@GMAIL.COM',
        N'trannhattien981@gmail.com', N'TRANNHATTIEN981@GMAIL.COM', 0,
        N'AQAAAAIAAYagAAAAEOYBeAcLcSUUDx6VM4MBQDpMJn+Y2kRoPxn93DEGiqrxu2YtMg0Qfzlw9LTRFuSjYQ==',
        N'AUPAC5VYSASQIAQSDKZ7QVHSQC7FWL7R',
        N'47b0dd67-bb11-4ded-a4ff-3397cb70c619',
        NULL, 0, 0, NULL, 1, 0
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [Id] = N'3dd820b9-b9d9-41c5-92ec-f7ee507e1f6c')
BEGIN
    INSERT INTO [AspNetUsers] (
        [Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName],
        [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp],
        [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled],
        [LockoutEnd], [LockoutEnabled], [AccessFailedCount]
    )
    VALUES (
        N'3dd820b9-b9d9-41c5-92ec-f7ee507e1f6c', N'Trần Nhật Tiến', N'36 trương văn thành', N'21',
        N'trannhattien9801@gmail.com', N'TRANNHATTIEN9801@GMAIL.COM',
        N'trannhattien9801@gmail.com', N'TRANNHATTIEN9801@GMAIL.COM', 0,
        N'AQAAAAIAAYagAAAAEITJgK3oBd0FwQriHJTqRw4ClF8XR1daYA3xB3paEh1we8S0NX752GhCjILU0EGm+g==',
        N'S5K5VXZGXU7LEBIPTG36LGTLU2SMFI5B',
        N'2c5226e0-042d-4d00-9d9e-35ff873565fd',
        NULL, 0, 0, NULL, 1, 0
    );
END;
GO

IF NOT EXISTS (SELECT 1 FROM [AspNetUsers] WHERE [Id] = N'959209be-d315-4064-965f-96a422cfd3fb')
BEGIN
    INSERT INTO [AspNetUsers] (
        [Id], [FullName], [Address], [Age], [UserName], [NormalizedUserName],
        [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp],
        [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled],
        [LockoutEnd], [LockoutEnabled], [AccessFailedCount]
    )
    VALUES (
        N'959209be-d315-4064-965f-96a422cfd3fb', NULL, NULL, NULL,
        N'trannhattienrrttmmtt@gmail.com', N'TRANNHATTIENRRTTMMTT@GMAIL.COM',
        N'trannhattienrrttmmtt@gmail.com', N'TRANNHATTIENRRTTMMTT@GMAIL.COM', 0,
        N'AQAAAAIAAYagAAAAEOLcyBRl0fqa4nsuI794rRTzxicXxGEWIgCa+iVZmn7GFghscq4jWfUUp0ELrHLfQQ==',
        N'GVUNW662UHUUYZ3YGOESPOK44EFTX4E5',
        N'02b1b884-5e70-4606-bc76-811d9c0a87dd',
        NULL, 0, 0, NULL, 1, 0
    );
END;
GO

IF NOT EXISTS (
    SELECT 1 FROM [AspNetUserRoles]
    WHERE [UserId] = N'23190fb4-d3ea-4590-9746-10873e0787ce'
      AND [RoleId] = N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5'
)
BEGIN
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (N'23190fb4-d3ea-4590-9746-10873e0787ce', N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5');
END;
GO

IF NOT EXISTS (
    SELECT 1 FROM [AspNetUserRoles]
    WHERE [UserId] = N'3dd820b9-b9d9-41c5-92ec-f7ee507e1f6c'
      AND [RoleId] = N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5'
)
BEGIN
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (N'3dd820b9-b9d9-41c5-92ec-f7ee507e1f6c', N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5');
END;
GO

IF NOT EXISTS (
    SELECT 1 FROM [AspNetUserRoles]
    WHERE [UserId] = N'959209be-d315-4064-965f-96a422cfd3fb'
      AND [RoleId] = N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5'
)
BEGIN
    INSERT INTO [AspNetUserRoles] ([UserId], [RoleId])
    VALUES (N'959209be-d315-4064-965f-96a422cfd3fb', N'3bf2d2da-5a32-4b28-85d0-06fa25de5fc5');
END;
GO

IF NOT EXISTS (SELECT 1 FROM [Categories] WHERE [Name] = N'Điện thoại')
BEGIN
    INSERT INTO [Categories] ([Name]) VALUES (N'Điện thoại');
END;
GO

IF NOT EXISTS (SELECT 1 FROM [Categories] WHERE [Name] = N'Laptop')
BEGIN
    INSERT INTO [Categories] ([Name]) VALUES (N'Laptop');
END;
GO

IF NOT EXISTS (SELECT 1 FROM [Categories] WHERE [Name] = N'Phụ kiện')
BEGIN
    INSERT INTO [Categories] ([Name]) VALUES (N'Phụ kiện');
END;
GO
