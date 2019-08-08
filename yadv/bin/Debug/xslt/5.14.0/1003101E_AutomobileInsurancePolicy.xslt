<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:aip="urn:customs.ru:Information:TransportDocuments:Car:AutomobileInsurancePolicy:5.12.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="aip:AutomobileInsurancePolicy">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Страховой полис</title>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 12pt;}
                    div.page {
                        width: 210mm;
                        margin: auto;
                        padding: 5mm 10mm 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                        margin-top: 20px;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    h1 {text-align: center; font-size: 12pt; margin-top: 10px;}
                    table {border: 0; cellpadding: 3; cellspacing: 0; width:100%; border-collapse: collapse;}
                    td.fieldName {white-space: nowrap; width: 1%; vertical-align: top; padding-right: 5px;}
                    td.graph {white-space: nowrap; vertical-align: top; font-size: 8pt; text-align: center;}
                    .value {font-family: Courier;}
                    td.border-bottom {border: none; border-bottom: 1px solid black; }
                    .value {font-size: 10pt; font-family: Courier; }
                    p {margin: 8px 0;}
            </style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="border-bottom value">
                        <xsl:apply-templates select="aip:InsurerName"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph">(наименование страховщика (страховщиков))</td>
                  </tr>
               </table>
               <h1>
                        СТРАХОВОЙ ПОЛИС серия <xsl:apply-templates select="aip:Registration/aip:SeriesCode"/> № <xsl:apply-templates select="aip:Registration/aip:PolNumber"/>
                  <br/>обязательного страхования гражданской ответственности<br/>владельца транспортного средства
                    </h1>
               <table style="margin-top: 5px; width: auto;">
                  <tr>
                     <td class="fieldName" rowspan="2">Срок страхования:</td>
                     <td class="fieldName">с</td>
                     <td class="value">
                        <xsl:apply-templates select="aip:InsuranceTermBegin"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="fieldName">по</td>
                     <td class="value">
                        <xsl:apply-templates select="aip:InsuranceTermEnd"/>
                     </td>
                  </tr>
               </table>
               <p>Страхование распространяется на страховые случаи,
                    произошедшие в период использования транспортного средства в течение срока действия
                    договора <xsl:apply-templates select="aip:UseTransportTerm"/>
               </p>
               <table style="width: 100%;">
                  <tr>
                     <td class="fieldName" rowspan="2">1. Страхователь </td>
                     <td class="border-bottom value">
                        <xsl:apply-templates select="aip:Insurer/aip:Name"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph">(полное наименование юридического лица или фамилия, имя, отчество гражданина)</td>
                  </tr>
               </table>
               <table style="margin: 10px 0; width: 100%;">
                  <tr>
                     <td class="fieldName" rowspan="2">Собственник транспортного средства</td>
                     <td class="border-bottom value">
                        <xsl:apply-templates select="aip:AutomobileOwner/aip:Name"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph">(полное наименование юридического лица или фамилия, имя, отчество гражданина)</td>
                  </tr>
                  <tr>
                     <td class="border-bottom" colspan="2" style="min-height: 10px;"/>
                  </tr>
               </table>
               <p>2. Транспортное средство (ТС)</p>
               <table>
                  <tr>
                     <td class="fieldName" style="width: 1%;">Марка, модель транспортного средства</td>
                     <td class="border-bottom value">
                        <xsl:apply-templates select="aip:AIPTransportMeans/aip:Model"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="aip:AIPTransportMeans/aip:Mark"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="aip:AIPTransportMeans/aip:MarkCode"/>
                     </td>
                  </tr>
               </table>
               <table style="margin: 5px 0;">
                  <tr>
                     <td class="fieldName">Идентификационный номер транспортного средства</td>
                     <td class="border-bottom value">
                        <xsl:if test="aip:AIPTransportMeans/aip:VINID">
                           <xsl:apply-templates select="aip:AIPTransportMeans/aip:VINID"/>
                        </xsl:if>
                     </td>
                  </tr>
               </table>
               <table style="margin: 5px 0;">
                  <tr>
                     <td class="fieldName">Паспорт транспортного средства, свидетельство о регистрации транспортного  средства, <br/>
                            технический  паспорт,  технический талон (либо аналогичный документ):</td>
                  </tr>
                  <tr>
                     <td class="border-bottom">
                        <span class="value">
                           <xsl:apply-templates select="aip:AIPTransportMeans/aip:AIPTransportMeansPassport/cat_ru:Series"/>,<xsl:apply-templates select="aip:AIPTransportMeans/aip:AIPTransportMeansPassport/cat_ru:PTSNumber"/>,<xsl:apply-templates select="aip:AIPTransportMeans/aip:AIPTransportMeansPassport/cat_ru:RegionCode"/>
                           <xsl:for-each select="aip:AutomobileDoc">
                              <xsl:text> </xsl:text>
                              <xsl:if test="cat_ru:PrDocumentName">
                                 <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                              </xsl:if>
                              <xsl:if test="cat_ru:PrDocumentNumber">
                                 <xsl:text>  №</xsl:text>
                                 <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                              <xsl:if test="cat_ru:PrDocumentDate">
                                 <xsl:text> </xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>,
                                </xsl:for-each>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph">(вид документа, серия, номер)</td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="fieldName">Государственный регистрационный знак транспортного средства</td>
                     <td class="border-bottom value">
                        <xsl:apply-templates select="aip:AIPTransportMeans/aip:TransportStateSignID"/>
                     </td>
                  </tr>
               </table>
               <p>3. Договор заключен в отношении:</p>
               <table style="width: 1%; margin: 5px 0;">
                  <tr>
                     <td class="fieldName">неограниченного количества лиц, допущенных к управлению транспортным средством</td>
                     <td align="center" style="min-width:15px; min-height: 15px; border: solid 1px black;" valign="middle">
                        <xsl:if test="count(aip:AllowedPersonsInformation) = 0"> X </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" style="height: 5px;"/>
                  </tr>
                  <tr>
                     <td class="fieldName">лиц, допущенных к управлению транспортным средством</td>
                     <td align="center" style="min-width:15px; min-height: 15px; border: solid 1px black;" valign="middle">
                        <xsl:if test="count(aip:AllowedPersonsInformation) > 0"> X </xsl:if>
                     </td>
                  </tr>
               </table>
               <xsl:if test="aip:AllowedPersonsInformation">
                  <table style="border-collapse: collapse; border: none">
                     <tr>
                        <td align="center" class="fieldName" style="border: 1px solid black; width: 1%; vertical-align: middle;">№</td>
                        <td align="center" class="fieldName" style="border: 1px solid black; vertical-align: middle;">
                                Лица, допущенные к управлению транспортным средством (фамилия, имя, отчество)
                            </td>
                        <td align="center" class="fieldName" style="border: 1px solid black; vertical-align: middle">Водительское удостoверение<br/>(серия, номер)</td>
                     </tr>
                     <xsl:for-each select="aip:AllowedPersonsInformation">
                        <tr>
                           <td align="center" class="value" style="border: 1px solid black">
                              <xsl:apply-templates select="aip:PersNumeric"/>
                           </td>
                           <td align="center" class="value" style="border: 1px solid black">
                              <xsl:apply-templates select="aip:Name"/>
                           </td>
                           <td align="center" class="value" style="border: 1px solid black">
                              <xsl:apply-templates select="aip:DrivingLicenceSeriesCode"/>
                              <xsl:apply-templates select="aip:DrivingLicenceNumeric"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </table>
               </xsl:if>
               <p>
                        4. Страховая сумма, в пределах которой страховщик при наступлении каждого
                        страхового случая (независимо от количества страховых случаев в течение срока действия
                        договора обязательного страхования) обязуется возместить потерпевшим причиненный вред, составляет:<br/>
                        в части возмещения вреда, причиненного жизни или здоровью каждого потерпевшего, - не более 160 тыс. рублей;<br/>
                        в части возмещения вреда, причиненного имуществу нескольких потерпевших, - не более 160 тыс. рублей;<br/>
                        в части возмещения вреда, причиненного имуществу одного потерпевшего, - не более 120 тыс. рублей.
                        <xsl:if test="aip:SumInsured">
                     <br/>5. Страховая сумма – <xsl:apply-templates select="aip:SumInsured"/>
                  </xsl:if>
                  <br/>6. Страховой полис действует на территории Российской Федерации.
                        <xsl:if test="aip:InsurancePremium">
                     <br/>7. Страховая премия <xsl:apply-templates select="aip:InsurancePremium"/> рублей.</xsl:if>
                  <br/>
                        8. Особые отметки
                        <xsl:for-each select="aip:SpecialComments">
                     <br/>
                     <span class="value">
                        <xsl:apply-templates select="."/>
                     </span>
                  </xsl:for-each>
                  <br/>Дата заключения договора:
                        <span class="value">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="aip:Registration/aip:InsurContractDate"/>
                     </xsl:call-template>
                  </span>
                  <br/>Страхователю выданы Правила обязательного страхования гражданской ответственности
                        владельцев транспортных средств, перечень представителей страховщика в субъектах Российской
                        Федерации согласно приложению и 2 бланка извещения о дорожно-транспортном происшествии.
                    </p>
               <table style="margin: 5px 0;">
                  <tr>
                     <td align="left" class="fieldName">Страхователь:</td>
                     <td align="right" class="fieldName">Страховщик/представитель страховщика:</td>
                  </tr>
                  <tr>
                     <td align="left" class="value">
                        <xsl:apply-templates select="aip:InsuranceAgent/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="aip:InsuranceAgent/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="aip:InsuranceAgent/cat_ru:PersonMiddleName"/>
                     </td>
                     <td align="right" class="value">
                        <xsl:apply-templates select="aip:InsurerSign/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="aip:InsurerSign/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="aip:InsurerSign/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td align="right" class="value">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="aip:Registration/aip:IssueDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="text-align: right;">(дата выдачи полиса)</td>
                  </tr>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="aip:InsuranceTermBegin | aip:InsuranceTermEnd">
      <xsl:value-of select="format-number(substring(substring-before(., ':'), string-length(substring-before(., ':')) - 1), '00')"/>
      <xsl:text>:</xsl:text>
      <xsl:value-of select="format-number(substring-before(substring-after(., ':'), ':'), '00')"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
   </xsl:template>
   <xsl:template match="aip:UseTransportTerm">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
        c
        <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="aip:BeginUseTransportDate"/>
      </xsl:call-template>
      <xsl:if test="aip:EndUseTransportDate">
        по
        <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="aip:EndUseTransportDate"/>
         </xsl:call-template>
      </xsl:if>,
    </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn, 5, 1) = '-' and substring($dateIn, 8, 1) = '-'">
            <xsl:value-of select="substring($dateIn, 9, 2)"/>.<xsl:value-of select="substring($dateIn, 6, 2)"/>.<xsl:value-of select="substring($dateIn, 1, 4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
