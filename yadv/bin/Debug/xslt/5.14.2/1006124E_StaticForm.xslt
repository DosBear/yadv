<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:statf="urn:customs.ru:Information:CustomsDocuments:StaticForm:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)"/>
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date2">
      <xsl:param name="dateIn2"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn2,5,1)='-' and substring($dateIn2,8,1)='-'">
            <xsl:value-of select="substring($dateIn2,9,2)"/>
            <xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn2,6,2)"/>
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn2,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn2"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="gtd_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="statf:DTNumber">
	   <xsl:value-of select="cat_ru:CustomsCode"/>
	   <xsl:text>/</xsl:text>
	   <xsl:call-template name="gtd_date">
		   <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
	   </xsl:call-template>
	   <xsl:text>/</xsl:text>
	   <xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   
   <xsl:template match="statf:StaticForm">
      <html>
         <head>
            <title>Статическая форма учета перемещения товаров</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 210mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    div.goods {background: white;}
                    .bordered {
                        border: solid 1px black;
                        padding-top: 1pt;
                        padding-bottom: 1pt;
                        font-family: Arial;
                        font-size: 10pt;
                        font-weight: normal;
                    }
                    .normal3{font-family:Arial;  font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext;}
                    .mini{font-family:Arial;  font-size: 9pt;}
                    .underlined {border-bottom: solid 0.8pt black;}
                    p.NumberDate {font-weight: bold;}
                    .graph {font-family: Arial; font-size: 10pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
                    .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
                    .graphMain {font-family: Arial; font-size: 10pt; font-weight: bold; }
                    .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
                    .graphNo {font-size: 7pt; font-weight: bold;}
                    h1{font-size: 12pt;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .br {border-right: 1px solid black;}
                    .bl {border-left: 1px solid black;}
                    .bb {border-bottom: 1px solid black;}
                    .bt {border-top: 1px solid black;}
                    .brbb{border-right: 1px solid black;border-bottom: 1px solid black;}
                    .blbt{border-left: 1px solid black;border-top: 1px solid black;}
                    .bbbrbt{border-right: 1px solid black;border-bottom: 1px solid black;border-top: 1px solid black;}
                    .brbbbl{border-right: 1px solid black;border-bottom: 1px solid black;border-left: 1px solid black;}
                    .db {border-bottom: 1px dashed black;}
                    .dl {border-left: 1px dashed black;}
                    .number {
                        text-align: center;
                        color: black;
                        font-size: 11pt;
                        font-weight: bold;
                        vertical-align: middle;
                    }
                </style>
         </head>
         <body>
            <div class="page">
               <!--Шапка-->
               <table align="center" style="width:160mm" cellpadding="0" cellspacing="0" >
                  <tbody>
                     <tr>
                        <td align="center" colspan="3">СТАТИСТИЧЕСКАЯ ФОРМА<br/>учета перемещения товаров</td>
                     </tr>
                     <tr>
                        <td class="bordered" style="width:53mm" valign="top">
							<span class="graphMain">Регистрационный номер</span>
                           <br/>
                           <!--xsl:value-of select="statf:NSF"/-->
                        </td>
                        <td class="bordered" style="width:53mm" valign="top">
							<span class="graphMain">Номер аннулируемой ститистической формы</span>
                           <br/>
                           <xsl:value-of select="statf:PreviousRegNumberDoc"/>
                        </td>
                        <td class="bordered" style="width:53mm" valign="top">
                           <span class="graphMain">Системный номер</span>
                           <br/>
                           <xsl:value-of select="statf:NSF"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <br/>
               <!--Основная часть-->
               <table align="center" cellpadding="0" cellspacing="0" class="bordered" style="width:160mm">
                  <tbody>
                     <tr>
                        <td class="brbb" style="width:60mm">
                           <span class="graphMain">1. Продавец </span>
                           <xsl:value-of select="statf:Consignor/cat_ru:OrganizationName"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:ShortName"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:Address/cat_ru:PostalCode"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:Address/cat_ru:CountryCode"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:Address/cat_ru:CounryName"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:Address/cat_ru:Region"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:Address/cat_ru:City"/> 
									<xsl:value-of select="statf:Consignor/cat_ru:Address/cat_ru:StreetHouse"/> 
									
                           <!--xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardCode"/>
									<xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardName"/>
									<xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
									<xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
									<xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:RBIdentificationNumber"/>
									<xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:IdentityCardDate"/>
									<xsl:value-of select="statf:Consignor/cat_ru:IdentityCard/cat_ru:OrganizationName"/-->
												,<span class="graphMain">N</span>
                           <xsl:if test="statf:Consignor/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="statf:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/
										<xsl:value-of select="statf:Consignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                           <xsl:if test="statf:Consignor/cat_ru:RBOrganizationFeatures">
                              <xsl:value-of select="statf:Consignor/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>/
                           </xsl:if>
                           <xsl:if test="statf:Consignor/cat_ru:RKOrganizationFeatures">
                              <xsl:value-of select="statf:Consignor/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>/
                           </xsl:if>
                        </td>
                        <td class="brbb" style="width:50mm" valign="top">
                           <span class="graphMain">4. Направление перемещения</span>
                           <br/>
                           <br/>
                           <xsl:value-of select="statf:CustomsProcedure"/>
                        </td>
                        <td style="width:50mm" valign="top">
                           <span class="graphMain">7. Код валюты и общая стоимость товаров<br/> товара</span>
                           <br/>
                           <br/>
                              <span style="border-right:1px solid"><xsl:value-of select="statf:CustCostCurrencyCode"/></span>
                              <xsl:value-of select="statf:CustCostTotalAmount"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="brbb" rowspan="2" style="width:60mm">
                           <span class="graphMain" style="width:60mm">2. Покупатель </span>
                           <xsl:value-of select="statf:Consignee/cat_ru:OrganizationName"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:ShortName"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:Address/cat_ru:PostalCode"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:Address/cat_ru:CountryCode"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:Address/cat_ru:CounryName"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:Address/cat_ru:Region"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:Address/cat_ru:City"/> 
									<xsl:value-of select="statf:Consignee/cat_ru:Address/cat_ru:StreetHouse"/> 
									
                           <!--xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:IdentityCardCode"/>
										<xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:IdentityCardName"/>
											<xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
											<xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
									<xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:RBIdentificationNumber"/>
										<xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:IdentityCardDate"/>
											<xsl:value-of select="statf:Consignee/cat_ru:IdentityCard/cat_ru:OrganizationName"/-->
									,<span class="graphMain"> N</span>
                           <xsl:if test="statf:Consignee/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="statf:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/
										<xsl:value-of select="statf:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                           <xsl:if test="statf:Consignee/cat_ru:RBOrganizationFeatures">
                              <xsl:value-of select="statf:Consignee/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>/
                           </xsl:if>
                           <xsl:if test="statf:Consignee/cat_ru:RKOrganizationFeatures">
                              <xsl:value-of select="statf:Consignee/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>/
                           </xsl:if>
                        </td>
                        <td class="bb" style="width:50mm" valign="bottom">
                           <table cellpadding="0" cellspacing="0">
                              <tbody>
                                 <tr>
                                    <td colspan="2">
                                       <span class="graphMain">5. Торгующая страна</span>
                                       <br/>
                                       <br/>
                                       <br/>
                                    </td>
                                    <td/>
                                 </tr>
                                 <tr>
                                    <td style="width:40mm">
                                       <xsl:value-of select="statf:TradeCountry/statf:CountryName"/>
                                    </td>
                                    <td class="bl" style="width:10mm">
                                       <xsl:value-of select="statf:TradeCountry/statf:CountryCode"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td class="blbt" style="width:50mm" valign="bottom">
                           <table cellpadding="0" cellspacing="0">
                              <tbody>
                                 <tr>
                                    <td colspan="2">
                                       <span class="graphMain">8. Страна отправления</span>
                                       <br/>
                                       <br/>
                                       <br/>
                                    </td>
                                    <td/>
                                 </tr>
                                 <tr>
                                    <td style="width:40mm">
                                       <xsl:value-of select="statf:DispatchCountry/statf:CountryName"/>
                                    </td>
                                    <td class="bl" style="width:10mm">
                                       <xsl:value-of select="statf:DispatchCountry/statf:CountryCode"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <!--td class="br" style="width:60mm" valign="top">
                           <span class="graphMain">3. Лицо, ответственное за финансовое урегулирование</span>
                           <br/>
                        </td-->
                        <td style="width:50mm">
                           <table cellpadding="0" cellspacing="0">
                              <tbody>
                                 <tr>
                                    <td colspan="2" valign="top">
                                       <span class="graphMain">6. Страна назначения</span>
                                       <br/>
                                       <br/>
                                       <br/>
                                    </td>
                                    <td/>
                                 </tr>
                                 <tr>
                                    <td style="width:40mm" valign="bottom">
                                       <xsl:value-of select="statf:DestinationCountry/statf:CountryName"/>
                                    </td>
                                    <td class="bl" style="width:10mm" valign="bottom">
                                       <xsl:value-of select="statf:DestinationCountry/statf:CountryCode"/>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                        <td class="blbt" valign="top">
                           <span class="graphMain">9 Вид транспорта на границе</span>
                           <br/>
                           <br/>
                           <xsl:value-of select="statf:TransportModeCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="br">
							<span class="graphMain">3. Лицо, ответственное за финансовое урегулирование</span>
                           <br/>
                           <xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:OrganizationName"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:ShortName"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:PostalCode"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:CountryCode"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:CounryName"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:Region"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:City"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:StreetHouse"/> 
									
                           <!--Данные по документу, удостоверяющему личность-->
                           <xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardCode"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardName"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardSeries"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
									<xsl:if test="statf:FinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:RBIdentificationNumber">
										<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:RBIdentificationNumber"/>
									</xsl:if>	 
									<xsl:call-template name="russian_date2">
                              <xsl:with-param name="dateIn2" select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardDate"/>
                           </xsl:call-template> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:OrganizationName"/> 
									
                           <!--Обособленное подразделение-->
                           <xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:OrganizationName"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:CountryCode"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:CounryName"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:Region"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:City"/> 
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/> 
													, <span class="graphMain">N</span>
                           <xsl:if test="statf:FinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures">
                              <xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/
										<xsl:value-of select="statf:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                           </xsl:if>
                           <xsl:if test="statf:Consignee/cat_ru:RBOrganizationFeatures">
                              <xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>/
                           </xsl:if>
                           <xsl:if test="statf:FinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures">
                              <xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>/
                           </xsl:if>
                        </td>
                        <td class="bt" colspan="2">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <!--tr>
								<td class="br" style="width:60mm">
								<span class="graphMain">3. Лицо ответсвенное за финансовое урегулирование</span>
								</td>
								<td style="width:100mm">
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:OrganizationName"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:ShortName"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:PostalCode"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:CountryCode"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:CounryName"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:Region"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:City"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:Address/cat_ru:StreetHouse"/>&#160;
									
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardCode"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardName"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardSeries"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardNumber"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:RBIdentificationNumber"/>&#160;
									<xsl:call-template name="russian_date2">
										<xsl:with-param name="dateIn2" select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:IdentityCardDate"/></xsl:call-template>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:IdentityCard/cat_ru:OrganizationName"/>&#160;
									
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:OrganizationName"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:CountryCode"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:CounryName"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:Region"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:City"/>&#160;
									<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/statf:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/>&#160;
													, <span class="graphMain">N</span>
												
									<xsl:if test="statf:FinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures">
										<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>/
										<xsl:value-of select="statf:Consignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<xsl:if test="statf:Consignee/cat_ru:RBOrganizationFeatures">
										<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:INN"/>/
										<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
									<xsl:if test="statf:FinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures">
										<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:INN"/>/
										<xsl:value-of select="statf:FinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:KPP"/>
									</xsl:if>
								</td>
							</tr-->
                  </tbody>
               </table>
               <!--Документы-->
               <table align="center" style="width:160mm">
                  <tbody>
                     <tr>
                        <td>
                           <span class="graphMain">10. Документы </span>
                           <xsl:for-each select="statf:Documents">
                              <xsl:value-of select="cat_ru:PrDocumentName"/> 
										<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
										<xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn2" select="cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                              <xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <!--Товары-->
               <xsl:for-each select="statf:GoodsInfo">
                  <table align="center" cellpadding="0" cellspacing="0" class="bt" style="width:160mm">
                     <tbody>
                        <tr>
                           <td class="brbbbl" style="width:40mm" valign="top" align="center">
                              <table cellpadding="0" cellspacing="0">
                                 <tbody>
                                    <tr>
                                       <td colspan="2" style="width:55mm">
                                          <span class="graphMain">11. Код товара</span>
                                          <br/>
                                          <br/>
                                       </td>
                                       <td/>
                                    </tr>
                                    <tr>
                                       <td style="width:45mm">
                                          <xsl:value-of select="statf:GoodsTNVEDCode"/>
                                       </td>
                                       <td align="left" class="bl" style="width:10mm">
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                           <td class="brbb" style="width:40mm" valign="top">
                              <span class="graphMain"> 12. Описание товара </span>
                              <br/>
                              <xsl:for-each select="statf:GoodsDescription">
								<xsl:value-of select="."/>
								<xsl:if test="following-sibling::statf:GoodsDescription"><br/></xsl:if>
                              </xsl:for-each>
                           </td>
                           <td class="brbb" style="width:40mm" valign="top">
                              <span class="graphMain">13. Стоимость товара </span>
                              <br/>
                              <xsl:value-of select="statf:InvoicedCost"/>
                           </td>
                           <td class="brbb" style="width:40mm" valign="top">
							   <span class="graphMain">14. Статистическая стоимость(в долларах США)</span>
                              <br/>
                              <xsl:value-of select="statf:StatisticalCostUSD"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="brbbbl" style="width:40mm" valign="top">
                              <table cellpadding="0" cellspacing="0">
                                 <tbody>
                                    <tr>
                                       <td colspan="2" style="width:55mm">
                                          <span class="graphMain">15. Страна происхождения</span>
                                          <br/>
                                          <br/>
                                       </td>
                                       <td/>
                                    </tr>
                                    <tr>
                                       <td style="width:45mm">
                                          <xsl:value-of select="statf:OriginCountry/statf:CountryName"/>
                                       </td>
                                       <td align="left" class="bl" style="width:10mm">
                                          <xsl:value-of select="statf:OriginCountry/statf:CountryCode"/>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                           <td class="brbb" style="width:40mm" valign="top">
                              <span class="graphMain">16. Вес нетто (кг)</span>
                              <br/>
                              <xsl:value-of select="statf:NetWeightQuantity"/>
                           </td>
                           <td class="brbb" style="width:40mm" valign="top">
                              <span class="graphMain">17. Статистическая стоимость(в рублях)</span>
                              <br/>
                              <xsl:value-of select="statf:StatisticalCostRUB"/>
                           </td>
                           <td class="brbb" style="width:40mm" valign="top">
                              <xsl:for-each select="statf:SupplementaryQuantity">
                                 <table cellpadding="0" cellspacing="0">
                                    <tbody>
                                       <tr>
                                          <td colspan="2">
                                             <span class="graphMain">18. Дополнительные единицы</span>
                                             <br/>
                                          </td>
                                          <td/>
                                       </tr>
                                       <tr>
                                          <td>
                                             <xsl:value-of select="cat_ru:GoodsQuantity"/>
                                          </td>
                                          <td align="left" class="bl" style="width:10mm">
                                             <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
                                          </td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="brbbbl" style="width:80mm" valign="top" colspan="2">
                              <span class="graphMain"> 19. Дополнительные сведения </span>
                              <br/>
								<xsl:choose>
									<xsl:when test="statf:AdditionalInformationCode='01'">переработка на таможенной территории</xsl:when>
									<xsl:when test="statf:AdditionalInformationCode='02'">переработка вне таможенной территории</xsl:when>
									<xsl:when test="statf:AdditionalInformationCode='03'">продукты переработки</xsl:when>
									<xsl:when test="statf:AdditionalInformationCode='04'">товары, перемещаемые по договору финансовой аренды (лизинга)</xsl:when>
									<xsl:otherwise><xsl:value-of select="statf:AdditionalInformationCode"/></xsl:otherwise>
								</xsl:choose>
                              <br/>
							  <xsl:value-of select="statf:AdditionalInformation"/>
                           </td>
                           <td class="brbb" style="width:80mm" valign="bottom" colspan="2">
							   <table cellpadding="0" cellspacing="0">
                                 <tbody>
                                    <tr>
                                       <td colspan="2" style="width:55mm">
                                          <span class="graphMain">20. Декларация на товары</span>
                                          <br/>
                                          <br/>
                                       </td>
                                       <td/>
                                    </tr>
                                    <xsl:choose>
										<xsl:when test="statf:DTInfo">
											<xsl:for-each select="statf:DTInfo">
												<tr>
													<td style="width:45mm">
														<xsl:apply-templates select="statf:DTNumber"/>
													</td>
													<td align="left" class="bl" style="width:10mm">
														<xsl:value-of select="statf:GoodsNumeric"/>
													</td>
												</tr>  
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<tr>
												<td style="width:45mm"></td>
												<td align="left" class="bl" style="width:10mm"></td>
											</tr> 
										</xsl:otherwise>
									</xsl:choose>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:for-each>
               <table align="center" style="width:160mm">
                  <tbody>
                     <tr>
                        <td style="width:53mm">
                           <span class="bordered" style="front-weight:bold">Дата заполнения документа</span>
                        </td>
                        <td style="width:53mm" align="center">
							<xsl:variable name="execDate">
							   <xsl:call-template name="russian_date">
								  <xsl:with-param name="dateIn" select="statf:ProvidePerson/statf:ExecutionDate"/>
							   </xsl:call-template>
                           </xsl:variable>
                           <!--xsl:value-of select="$execDate"/-->
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,1,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,2,1)"/></span>
                           <span style="font-family:'Courier New';"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,4,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,5,1)"/></span>
                           <span style="font-family:'Courier New';"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,7,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,8,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,9,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring($execDate,10,1)"/></span>
                        </td>
                        <td style="width:53mm" align="center">
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring(statf:ReportingDate,6,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring(statf:ReportingDate,7,1)"/></span>
                           <span style="font-family:'Courier New';"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring(statf:ReportingDate,1,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring(statf:ReportingDate,2,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring(statf:ReportingDate,3,1)"/></span>
                           <span class="bordered" style="font-family:'Courier New';"><xsl:value-of select="substring(statf:ReportingDate,4,1)"/></span>
                        </td>
                     </tr>
                     <tr>
						<td></td>
                        <td align="center" valign="top">(число) (месяц) (год)</td>
                        <td align="center" valign="top">(месяц) (год)<br/>отчетный период</td>
                     </tr>
                  </tbody>
               </table>
               <table align="center" style="width:160mm">
                  <tbody>
                     <tr>
                        <td style="width:55mm">
                           <span class="mini">Заявитель либо лицо, должным образом уполномоченное представлять статистическую форму от имени заявителя</span>
                        </td>
                        <td valign="bottom">
                           <span class="normal3">
                              <xsl:value-of select="statf:ProvidePerson/cat_ru:PersonPost"/>
                           </span>
                        </td>
                        <td valign="bottom">
                           <span class="normal3">
                              <xsl:value-of select="statf:ProvidePerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="statf:ProvidePerson/cat_ru:PersonName"/> 
									<xsl:value-of select="statf:ProvidePerson/cat_ru:PersonMiddleName"/>
                           </span>
                        </td>
                        <td valign="bottom">
                           <span class="normal3">
                              <xsl:value-of select="statf:ProvidePerson/cat_ru:PersonPost"/>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td/>
                        <td>(должность)
								</td>
                        <td>(Ф.И.О.)
								</td>
                        <td>(подпись)
								</td>
                     </tr>
                     <tr>
						<td></td>
                        <td>
                           <span class="normal3">
                              <xsl:value-of select="statf:ProvidePerson/statf:ContactPhone"/>
                           </span>
						</td>
						<td>
							<span style="normal3">
								<xsl:value-of select="statf:ProvidePerson/statf:Email"/>
							</span>
						</td>
						<td></td>
                     </tr>
                     <tr>
						<td></td>
                        <td>(номер<br/>контактного телефона)</td>
                        <td>(электронная<br/>почта)</td>
                        <td>МП</td>
                     </tr>
                     <tr>
							<td></td>
							<td colspan="3">
								<table>
									<tbody>
										<tr>
											<td width="50%">
												<span style="normal3">
													<xsl:value-of select="statf:ProvidePerson/statf:OrganizationName"/>
												</span>
											</td>
											<td>
												<span style="normal3">
													<xsl:if test="statf:ProvidePerson/statf:RFOrganizationFeatures/cat_ru:INN">
														<xsl:text>ИНН </xsl:text>
														<xsl:value-of select="statf:ProvidePerson/statf:RFOrganizationFeatures/cat_ru:INN"/>
														<br/>
													</xsl:if>
													<xsl:if test="statf:ProvidePerson/statf:RFOrganizationFeatures/cat_ru:KPP">
														<xsl:text>КПП </xsl:text>
														<xsl:value-of select="statf:ProvidePerson/statf:RFOrganizationFeatures/cat_ru:KPP"/>
														<br/>
													</xsl:if>
													<xsl:if test="statf:ProvidePerson/statf:RFOrganizationFeatures/cat_ru:OGRN">
														<xsl:text>ОГРН </xsl:text>
														<xsl:value-of select="statf:ProvidePerson/statf:RFOrganizationFeatures/cat_ru:OGRN"/>
													</xsl:if>
												</span>
											</td>
										</tr>
										<tr>
											<td align="center">
												(полное или сокращенное наименование)
											</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<xsl:text>Адрес: </xsl:text>
								<xsl:for-each select="statf:ProvidePerson/statf:Address/*">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
