object FormRequiredFields: TFormRequiredFields
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = ' Campos Requeridos!'
  ClientHeight = 396
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 268
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      268
      62)
    object imgHeader: TImage
      Left = 216
      Top = 4
      Width = 48
      Height = 54
      Align = alRight
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
        000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
        097048597300000EC400000EC401952B0E1B000002FE494441545847ED553D68
        5351144ED5DAA12EAE25D0A92190964812280949B198CD21E020946A85BCA6D8
        C92E9241149AA91571B6259BAE6A4A1B5E694A4203BAA588D025249B5B2787A0
        08F5F39CFBEE4BDE7BB9D5971FEBE2071FEFBE734ECEF9EEB9E7E57A0078AE6B
        FAD55EC8BF1916B9F827227AE4892A593F6401678EE46E39AA4AD82B59802AB9
        1B5E5625EC95FD0AF8491C232A6744F29AC2D6353F8374A04F16EB0E0145DE8D
        22F06FB178661390D656E87971C86432B8AB3DBA444B43001B2E125C4FD3B47F
        2EE00A2DFF2C60737313A15008333333585F5F97D6C1E05A40329984DFEF4738
        1C160C040288C562D26BC7DADA1A161616CE25FB4DB81250AD56313535854824
        62A3CFE743A1509051FDC195808D8D0D4C4F4F7709E0A3C866B332AA83A17760
        7B7B5B29806D3C1783C09500C6C4C484387BB338AFD9D66AB5644407960EFC20
        BE22CE12C78923E416852447A8DEB8D576AE805AAD86C9C94931884CAFD78B72
        B92CBD4A3C277A50BD358AF2DC320E12AFA1278E518C9F12CFC4538F1F639FEC
        A5B91554E7C7385E29A0542AC91550A9546C850F0F0FE5AA0379C61E14A38FA9
        105C732FFAAC4B402E97133BE78173828F817D3CA40A7870741BD8B94189E973
        551534C9FE9D10B09F844D40BD5E1705F8CC59C0D2D292F400E974BA3D981CD3
        6834A4C7D20146E3A591FC5D0028D0260A4143143FF9FD2DD9D9DF7821C26D02
        565757110C06DB83C7051717178510EB57C1311CEB001DC12CF0B5737CC029F0
        BD66D8F8C9EF265A47C06ED42E201A8DDA26DF2C6615C534634CB43BA0537B79
        B762F7B4CB0FF780CF4F8CDD9E3C053E3EA0A261A30B05E3A86C02B89053808A
        1CC3B10E908084FD9CF7A823BB24948B8A27BD3BE6C326209FCFB707902F212E
        64A5793171CCD6D696FC95B50316012E6913C068369BE2E64BA55262B77C0931
        79CD36F65907D082E1081800FF05F42F60189402BEA98AFC86ADF6AD34141E24
        EE2B8A9C4F3DFE509D6810EE2752CA624EEAF1658E572719068FE6EFD0B5FB86
        0435C53FA49EF8421D7A8FCA4DBE60641C3CBF00941B9FA0C9AACC4800000000
        49454E44AE426082}
    end
    object lblHeaderTitle: TcxLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Caption = 'Table Name'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.SkinName = 'Office2013DarkGray'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleFocused.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleHot.LookAndFeel.SkinName = 'Office2013DarkGray'
      Transparent = True
    end
    object lblHeaderDescription: TcxLabel
      AlignWithMargins = True
      Left = 28
      Top = 28
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #201' obrigat'#243'rio o preeenchimento dos campos relacionados abaixo.'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.SkinName = 'Office2013DarkGray'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleFocused.LookAndFeel.SkinName = 'Office2013DarkGray'
      StyleHot.LookAndFeel.SkinName = 'Office2013DarkGray'
      Properties.ShowEndEllipsis = True
      Properties.WordWrap = True
      Transparent = True
      Height = 34
      Width = 182
    end
  end
  object ltbCampos: TcxMCListBox
    AlignWithMargins = True
    Left = 3
    Top = 65
    Width = 262
    Height = 328
    TabStop = False
    Align = alClient
    Delimiter = '|'
    HeaderSections = <
      item
        Alignment = taCenter
        AllowResize = False
        BiDiMode = bdLeftToRight
        ImageIndex = 14
        ParentBiDiMode = False
        Width = 30
      end
      item
        MinWidth = 150
        Text = 'Descri'#231#227'o do(s) campo(s)'
        Width = 300
      end>
    Images = DtmRecursos.imgOffice2013
    Items.Strings = (
      '1|Teste 1'
      '2|Teste 2'
      '4|Teste 4'
      '5|Teste 5')
    Style.BorderColor = clHotLight
    TabOrder = 1
    ExplicitLeft = 48
    ExplicitTop = 112
    ExplicitWidth = 169
    ExplicitHeight = 201
  end
end
