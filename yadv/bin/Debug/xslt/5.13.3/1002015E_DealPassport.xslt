<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes=" cat_ru dep" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dep="urn:customs.ru:Information:CommercialFinanceDocuments:DealPassport:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="dep:DealPassport">
      <html>
         <head>
            <title>Паспорт сделки</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
                body {
                    text-align: center;
                    background: #cccccc;
                }
                    
                div.page {
                    width: 297mm;
                    margin: auto;
                    padding: 5mm 10mm 5mm 10mm;
                    background: white;
                    border: solid 1px black;
                    page-break-after: always;
                    margin-top: 20px;
                }
                /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                @media print {
                    div.page {border: none; margin: 0; padding: 0;}
                }

                .bordered {
                    border: solid 1pt #000000;
                }
                    
                .bordered3 {
                    border-left: solid 1pt #000000;
                    border-right: solid 1pt #000000;
                    border-bottom: solid 1pt #000000;
                }
                    
                .underlined {
                    border-bottom: solid 0.8pt #000000;
                }
                    
                p.NumberDate {
                    font-weight: bold;
                }
                .graph {
                    font-family: Arial;
                    font-size: 7pt;
                }
                .graphMain {
                    font-family: Arial;
                    font-size: 9pt;
                    font-weight: bold;
                }
                .graphNo {
                    font-size: 10pt;
                    font-weight: bold;
                }
                h2 {
                    font-family: Arial;
                    font-size: 9pt;
                    font-weight: bold;
                    text-align: left;
                    margin-top:6pt;
                    margin-bottom:6pt;
                }
                td {
                    font-family: Courier;
                    padding: 1px;
                }
                </style>
         </head>
         <body>
            <div class="page">
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td align="center" class="bordered" colspan="2">
                           <xsl:value-of select="dep:BankName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="2" valign="top">
                           <span class="graph">(Наименование уполномоченного банка)<br/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td align="right" style="width:55mm;">
                           <span class="graphMain">Паспорт сделки №</span>
                        </td>
                        <td class="bordered" style="width:125mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:DPNumber/dep:Part1"/>/<xsl:value-of select="dep:DPNumber/dep:Part2"/>/<xsl:value-of select="dep:DPNumber/dep:Part3"/>/<xsl:value-of select="dep:DPNumber/dep:Part4"/>/<xsl:value-of select="dep:DPNumber/dep:Part5"/>
                           <xsl:if test="dep:DPNumber/dep:IssueDate">
                              <xsl:text> от </xsl:text>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="dep:DPNumber/dep:IssueDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <h2>1. Cведения о резиденте</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td colspan="2">
                           <span class="graph" style="width:55mm;">1.1. Наименование</span>
                        </td>
                        <td class="bordered" colspan="5" style="width:125mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:Resident/cat_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="7" valign="top">
                           <span class="graph">
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph" style="width:25mm;">1.2. Адрес</span>
                        </td>
                        <td colspan="2">
                           <span class="graph">Субъект Российской федерации</span>
                        </td>
                        <td class="bordered" colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:Resident/dep:ResidentAddress/cat_ru:Region"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph"/>
                        </td>
                        <td colspan="2">
                           <span class="graph">Район</span>
                        </td>
                        <td class="bordered3" colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph"/>
                        </td>
                        <td colspan="2">
                           <span class="graph">Город</span>
                        </td>
                        <td class="bordered3" colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:Resident/dep:ResidentAddress/cat_ru:City"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph"/>
                        </td>
                        <td colspan="2">
                           <span class="graph">Населенный пункт</span>
                        </td>
                        <td class="bordered3" colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph"/>
                        </td>
                        <td colspan="2">
                           <span class="graph">Улица (проспект, переулок и т. д.)</span>
                        </td>
                        <td class="bordered3" colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:Resident/dep:ResidentAddress/cat_ru:StreetHouse"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph" style="width:25mm;"/>
                        </td>
                        <td>
                           <span class="graph" style="width:30mm;">Номер дома (владение)</span>
                        </td>
                        <td class="bordered" style="width:25mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <span class="graph" style="width:25mm;">Корпус (строение)</span>
                        </td>
                        <td class="bordered3" style="width:25mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td>
                           <span class="graph" style="width:25mm;">Офис (квартира)</span>
                        </td>
                        <td class="bordered3" style="width:25mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="7" valign="top">
                           <span class="graph">
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <span class="graph">1.3. Основной государственный регистрационный номер</span>
                        </td>
                        <td class="bordered" colspan="3">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:Resident/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="7" valign="top">
                           <span class="graph">
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5">
                           <span class="graph">1.4. Дата внесения записи в государственный реестр</span>
                        </td>
                        <td class="bordered" colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dep:Resident/dep:RegDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="7" valign="top">
                           <span class="graph">
                              <br/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="3">
                           <span class="graph">1.5. ИНН/КПП</span>
                        </td>
                        <td class="bordered" colspan="4">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:Resident/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/<xsl:value-of select="dep:Resident/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <h2>2. Реквизиты иностранного агента</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr align="center">
                        <td class="graph" rowspan="2">Наименование</td>
                        <td class="graph" colspan="2">Страна</td>
                     </tr>
                     <tr align="center">
                        <td class="graph">Наименование</td>
                        <td class="graph">Код</td>
                     </tr>
                     <tr align="center">
                        <td class="graph" style="width:110mm;">1</td>
                        <td class="graph" style="width:35mm;">2</td>
                        <td class="graph" style="width:35mm;">3</td>
                     </tr>
                     <tr valign="top">
                        <td>
                           <xsl:value-of select="dep:ForeignContractor/dep:Name"/>
                        </td>
                        <td>
                           <xsl:value-of select="dep:ForeignContractor/dep:CountryName"/>
                        </td>
                        <td>
                           <xsl:value-of select="dep:ForeignContractor/dep:CountryCode"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <h2>3. Общие сведения о контракте</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr align="center">
                        <td class="graph" rowspan="2">Номер</td>
                        <td class="graph" rowspan="2">Дата подписания</td>
                        <td class="graph" colspan="2">Валюта цены</td>
                        <td class="graph" rowspan="2">Сумма</td>
                        <td class="graph" rowspan="2">Дата завершения исполнения обязательств по контракту</td>
                        <td class="graph" colspan="4">Особые условия</td>
                     </tr>
                     <tr align="center">
                        <td class="graph">Наименование</td>
                        <td class="graph">Код</td>
                        <td class="graph">зачисление на счета за рубежом</td>
                        <td class="graph">валютная оговорка</td>
                        <td class="graph">ввоз/вывоз товаров, указанных в разделах XVI, XVII и XIX Товарной номенклатуры внешнеэконо- мической деятельности</td>
                        <td class="graph">Проведение строительных и подрядных работ за пределами территории Российской Федерации</td>
                     </tr>
                     <tr align="center">
                        <td class="graph">1</td>
                        <td class="graph">2</td>
                        <td class="graph">3</td>
                        <td class="graph">4</td>
                        <td class="graph">5</td>
                        <td class="graph">6</td>
                        <td class="graph">7</td>
                        <td class="graph">8</td>
                        <td class="graph">9</td>
                        <td class="graph">10</td>
                     </tr>
                     <xsl:for-each select="dep:ContractTerms | dep:AddContractTerms">
                        <xsl:call-template name="ContractTerms"/>
                     </xsl:for-each>
                  </tbody>
               </table>
               <h2>4. Информация о разрешениях</h2>
               <table border="1" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr align="center">
                        <td class="graph">Номер</td>
                        <td class="graph">Дата подписания</td>
                        <td class="graph">Сумма</td>
                        <td class="graph">Срок окончания действия разрешения</td>
                     </tr>
                     <tr align="center">
                        <td class="graph">1</td>
                        <td class="graph">2</td>
                        <td class="graph">3</td>
                        <td class="graph">4</td>
                     </tr>
                     <xsl:choose>
                        <xsl:when test="dep:Permissions">
                           <xsl:for-each select="dep:Permissions">
                              <tr valign="top">
                                 <td>
                                    <xsl:value-of select="dep:DocumentNumber"/>
                                 </td>
                                 <td>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="dep:IssueDate"/>
                                    </xsl:call-template>
                                 </td>
                                 <td>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="dep:Summa"/>
                                 </td>
                                 <td>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="dep:PermitEndDate"/>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                           </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                           <tr valign="top">
                              <td>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                           </tr>
                        </xsl:otherwise>
                     </xsl:choose>
                  </tbody>
               </table>
               <h2>5. Справочная информация</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td>
                           <span class="graph" style="width:55mm;">Номер паспорта сделки, оформленного до 18 июня 2004 года</span>
                        </td>
                        <td class="bordered" colspan="4" style="width:125mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="dep:DPoldNumber">
                              <xsl:value-of select="dep:DPoldNumber/dep:TypeOfDP"/>/<xsl:value-of select="dep:DPoldNumber/dep:BankOKPO"/>/
                                    <xsl:value-of select="dep:DPoldNumber/dep:OldReNumber"/>/<xsl:value-of select="dep:DPoldNumber/dep:OldPart4"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph" style="width:55mm;">Номер паспорта сделки, оформленного в другом уполномоченном банке</span>
                        </td>
                        <td class="bordered3" colspan="4" style="width:125mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:AnotherBankDPNumber/dep:Part1"/>/<xsl:value-of select="dep:AnotherBankDPNumber/dep:Part2"/>/<xsl:value-of select="dep:AnotherBankDPNumber/dep:Part3"/>/<xsl:value-of select="dep:AnotherBankDPNumber/dep:Part4"/>/<xsl:value-of select="dep:AnotherBankDPNumber/dep:Part5"/>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="5">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="graph" style="width:60mm;">Номер и дата переоформления паспорта сделки</span>
                        </td>
                        <td align="right">
                           <span class="graph" style="width:10mm;">№</span>
                        </td>
                        <td class="bordered" style="width:10mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:DPReMade/dep:DocumentNumber"/>
                        </td>
                        <td align="right">
                           <span class="graph" style="width:50mm;">Дата</span>
                        </td>
                        <td class="bordered" style="width:50mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dep:DPReMade/dep:Date"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div class="page">
               <h2>6. Специальные сведения о контракте </h2>
               <table border="0" width="100%">
                  <tbody>
                     <tr>
                        <td>6.1. Условия о сроках и порядке расчетов по контракту</td>
                     </tr>
                     <tr>
                        <td class="bordered">
                           <xsl:for-each select="dep:SpecialInformation/dep:ContractTerms">
                              <xsl:value-of select="."/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td align="right">Лист 2</td>
                     </tr>
                     <tr>
                        <td>
                                6.2. Срок от даты выпуска (условного выпуска) товаров таможенными органами при экспорте товаров до даты зачисления денежных средств от нерезидента на банковский счет резидента (отсрочка платежа), срок от даты оплаты резидентом ввозимых на таможенную территорию Российской Федерации товаров до даты ввоза товаров на таможенную территорию Российской Федерации при импорте товаров (предварительная оплата):
                                </td>
                     </tr>
                     <tr>
                        <td>
                           <table border="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td width="80%"/>
                                    <td align="center" class="bordered" width="20%;">
                                       <xsl:value-of select="dep:SpecialInformation/dep:Term"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <table border="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td width="80%">6.3 Дата оформления листа 2:</td>
                                    <td align="center" class="bordered" width="20%">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="dep:SpecialInformation/dep:List2IssueDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <h2>подписи сторон:</h2>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td>
                           <xsl:value-of select="dep:BankSignature/cat_ru:PersonPost"/>
                        </td>
                        <td>
                           <xsl:value-of select="dep:ResidentSignature/cat_ru:PersonPost"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:value-of select="dep:BankSignature/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:BankSignature/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:BankSignature/cat_ru:PersonMiddleName"/>
                        </td>
                        <td>
                           <xsl:value-of select="dep:ResidentSignature/cat_ru:PersonSurname"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:ResidentSignature/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="dep:ResidentSignature/cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dep:BankSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                        </td>
                        <td>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="dep:ResidentSignature/cat_ru:IssueDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <hr/>
               <h2>информация о закрытии паспорта сделки</h2>
               <table align="left" border="1" cellpadding="3" cellspacing="0">
                  <tr align="center">
                     <td class="graph">Дата</td>
                     <td class="graph">Основание</td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="dep:DPEnd/dep:Date"/>
                        </xsl:call-template>
                     </td>
                     <td>
                        <xsl:value-of select="dep:DPEnd/dep:Reason"/>
                     </td>
                  </tr>
               </table>
               <div style="clear: both;"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="ContractTerms">
      <tr valign="top">
         <td nowrap="yes">
            <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </td>
         <td nowrap="yes">
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </td>
         <td>
              <xsl:if test="dep:CurrencyName">
                 <xsl:value-of select="dep:CurrencyName"/>
              </xsl:if>
              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </td>
         <td>
            <xsl:value-of select="dep:CurrencyCode"/>
         </td>
         <td>
            <xsl:choose>
               <xsl:when test="dep:Amount=0">БС</xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="dep:Amount"/>
               </xsl:otherwise>
            </xsl:choose>
         </td>
         <td nowrap="yes">
            <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="dep:ContractEndDate"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="dep:SpecialTerms1"/>
         </td>
         <td>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="dep:SpecialTerms2"/>
         </td>
         <td>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="dep:SpecialTerms3"/>
         </td>
         <td>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="dep:SpecialTerms4"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
