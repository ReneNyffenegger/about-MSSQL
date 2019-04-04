set nocount on

set    language english
--     Changed language setting to us_english.

select datename(dw, '2019-04-05')
--     Friday

set    language german
--     Die Spracheneinstellung wurde in Deutsch geändert.

select datename(dw, '2019-04-05')
--     Freitag
