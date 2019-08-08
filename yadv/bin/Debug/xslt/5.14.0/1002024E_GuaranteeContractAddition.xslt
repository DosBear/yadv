<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="gcadd cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:gcadd="urn:customs.ru:Information:CommercialFinanceDocuments:GuaranteeContractAddition:5.11.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 1.4 от 18.12.2008. - для альбома 4.7.0  -->
   <!-- Для  xmlns=urn:customs.ru:Information:RegistrationDocuments:TaxOrganRegistrationCertificate:4.7.0  -->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template match="gcadd:GuaranteeContractAddition">
      <html>
         <head>
            <title>Дополнение к договору поручительства</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 297mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 8pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>Дополнение к договору поручительства</h2>
               <br/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:45%">
                           <xsl:text>Сумма обеспечения таможенных пошлин и налогов</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="gcadd:DutyAmount"/> <xsl:value-of select="gcadd:CurrencyCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;">
                           <xsl:text>(код валюты обеспечения)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Cрок, до истечения которого возможно использование дополнения в целях обеспечения уплаты таможенных пошлин, налогов при таможенном транзите товаров</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.8pt #000000;">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="gcadd:ValidityDate"/>
                           </xsl:call-template>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Сведения о поручителе:</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:value-of select="gcadd:Guarantor/cat_ru:OrganizationName"/>
                           <xsl:if test="not(gcadd:Guarantor/cat_ru:OrganizationName) and gcadd:Guarantor/cat_ru:ShortName">
							   <xsl:value-of select="gcadd:Guarantor/cat_ru:ShortName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(полное наименование в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Сведения об организации:</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:for-each select="gcadd:Guarantor">
                              <xsl:choose>
                                 <xsl:when test="cat_ru:RFOrganizationFeatures">
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                                 <xsl:when test="cat_ru:RKOrganizationFeatures">
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                                 <xsl:when test="cat_ru:RBOrganizationFeatures">
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(ОГРН/ОГРНИП - Основной государственный регистрационный  номер., ИНН - Индивидуальный номер налогоплательщика, КПП - Код причины постановки на учет)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Местонахождение</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:for-each select="gcadd:Guarantor/gcadd:Address">
                              <xsl:if test="cat_ru:CountryCode">
                                 <xsl:value-of select="cat_ru:CountryCode"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:CounryName">
                                 <xsl:value-of select="cat_ru:CounryName"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:PostalCode">
                                 <xsl:value-of select="cat_ru:PostalCode"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:Region">
                                 <xsl:value-of select="cat_ru:Region"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:City">
                                 <xsl:value-of select="cat_ru:City"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:StreetHouse">
                                 <xsl:value-of select="cat_ru:StreetHouse"/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(адрес места нахождения в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="gcadd:Guarantor/gcadd:IdentityCard">
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text>Документ, удостоверяющий личность</xsl:text>
                           </td>
                           <td align="center" class="graph" colspan="2" style="width:55%;">
                              <xsl:for-each select="gcadd:Guarantor/gcadd:IdentityCard">
                                 <xsl:if test="cat_ru:IdentityCardName">
                                    <xsl:value-of select="cat_ru:IdentityCardName"/>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"> </xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
                                    <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                                    </span>
		 
	</xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:OrganizationName"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                              <xsl:text> </xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Сведения о лице, предоставившем обеспечение уплаты таможенных пошлин, налогов:</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:value-of select="gcadd:PaymentProvider/cat_ru:OrganizationName"/>
                           <xsl:if test="not(gcadd:PaymentProvider/cat_ru:OrganizationName) and gcadd:PaymentProvider/cat_ru:ShortName">
							   <xsl:value-of select="gcadd:PaymentProvider/cat_ru:ShortName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(полное наименование в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Сведения об организации:</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:for-each select="gcadd:PaymentProvider">
                              <xsl:choose>
                                 <xsl:when test="cat_ru:RFOrganizationFeatures">
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                                 <xsl:when test="cat_ru:RKOrganizationFeatures">
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                                 <xsl:when test="cat_ru:RBOrganizationFeatures">
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(ОГРН/ОГРНИП - Основной государственный регистрационный  номер., ИНН - Индивидуальный номер налогоплательщика, КПП - Код причины постановки на учет)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:200mm;">
                           <xsl:text>Местонахождение</xsl:text>(адрес места нахождения в соответствии с учредительными документами)
								</td>
                        <td align="center" class="graph" colspan="2" style="width:145mm;">
                           <xsl:for-each select="gcadd:PaymentProvider/gcadd:Address">
                              <xsl:if test="cat_ru:CountryCode">
                                 <xsl:value-of select="cat_ru:CountryCode"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:CounryName">
                                 <xsl:value-of select="cat_ru:CounryName"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:PostalCode">
                                 <xsl:value-of select="cat_ru:PostalCode"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:Region">
                                 <xsl:value-of select="cat_ru:Region"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:City">
                                 <xsl:value-of select="cat_ru:City"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:StreetHouse">
                                 <xsl:value-of select="cat_ru:StreetHouse"/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(адрес места нахождения в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="gcadd:PaymentProvider/gcadd:IdentityCard">
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text>Документ, удостоверяющий личность</xsl:text>
                           </td>
                           <td align="center" class="graph" colspan="2" style="width:55%;">
                              <xsl:for-each select="gcadd:PaymentProvider/gcadd:IdentityCard">
                                 <xsl:if test="cat_ru:IdentityCardName">
                                    <xsl:value-of select="cat_ru:IdentityCardName"/>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"> </xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
                                    <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                                    </span>
		 
	</xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:OrganizationName"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                              <xsl:text> </xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Сведения о декларанте таможенной процедуры таможенного транзита:</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:value-of select="gcadd:Declarant/cat_ru:OrganizationName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(полное наименование в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Сведения об организации:</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:for-each select="gcadd:Declarant">
                              <xsl:choose>
                                 <xsl:when test="cat_ru:RFOrganizationFeatures">
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                                 <xsl:when test="cat_ru:RKOrganizationFeatures">
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                                 <xsl:when test="cat_ru:RBOrganizationFeatures">
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:OGRN">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:OGRN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:INN">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:INN"/>, </xsl:if>
                                    <xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:KPP">
                                       <xsl:value-of select="cat_ru:RBOrganizationFeatures/cat_ru:KPP"/> </xsl:if>
                                 </xsl:when>
                              </xsl:choose>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(ОГРН/ОГРНИП - Основной государственный регистрационный  номер., ИНН - Индивидуальный номер налогоплательщика, КПП - Код причины постановки на учет)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Местонахождение</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <xsl:for-each select="gcadd:Declarant/gcadd:Address">
                              <xsl:if test="cat_ru:CountryCode">
                                 <xsl:value-of select="cat_ru:CountryCode"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:CounryName">
                                 <xsl:value-of select="cat_ru:CounryName"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:PostalCode">
                                 <xsl:value-of select="cat_ru:PostalCode"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:Region">
                                 <xsl:value-of select="cat_ru:Region"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:City">
                                 <xsl:value-of select="cat_ru:City"/>, 
									</xsl:if>
                              <xsl:if test="cat_ru:StreetHouse">
                                 <xsl:value-of select="cat_ru:StreetHouse"/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(адрес места нахождения в соответствии с учредительными документами)</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="gcadd:Declarant/gcadd:IdentityCard">
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text>Документ, удостоверяющий личность</xsl:text>
                           </td>
                           <td align="center" class="graph" colspan="2" style="width:55%;">
                              <xsl:for-each select="gcadd:Declarant/gcadd:IdentityCard">
                                 <xsl:if test="cat_ru:IdentityCardName">
                                    <xsl:value-of select="cat_ru:IdentityCardName"/>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"> </xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
                                    <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                                    </span>
		 
	</xsl:if>
                                 <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
                                    </xsl:call-template>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:OrganizationName"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                              <xsl:text> </xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="gcadd:TransportDocument">
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text>Сведения о транспортном (перевозочном) документе</xsl:text>
                           </td>
                           <td align="center" class="graph" colspan="2" style="width:55%;">
                              <!--<xsl:value-of select="torc:RegistrationDocument/torc:DocumentID"/>-->
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="gcadd:TransportDocument/cat_ru:PrDocumentName">
                                 <xsl:value-of select="gcadd:TransportDocument/cat_ru:PrDocumentName"/> </xsl:if>
                              <xsl:if test="gcadd:TransportDocument/cat_ru:PrDocumentNumber">№<xsl:value-of select="gcadd:TransportDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
                              <xsl:if test="gcadd:TransportDocument/cat_ru:PrDocumentDate">от <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="gcadd:TransportDocument/cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                              <xsl:text>(наименование, номер, дата)     </xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Cведения о договоре поручительства</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;">
                           <!--<xsl:value-of select="torc:RegistrationDocument/torc:DocumentID"/>-->
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="gcadd:GuaranteeDocument/cat_ru:PrDocumentName">
                              <xsl:value-of select="gcadd:GuaranteeDocument/cat_ru:PrDocumentName"/> </xsl:if>
                           <xsl:if test="gcadd:GuaranteeDocument/cat_ru:PrDocumentNumber">№<xsl:value-of select="gcadd:GuaranteeDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
                           <xsl:if test="gcadd:GuaranteeDocument/cat_ru:PrDocumentDate">от <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="gcadd:GuaranteeDocument/cat_ru:PrDocumentDate"/>
                              </xsl:call-template>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                           <xsl:text>(наименование, номер, дата)     </xsl:text>
                        </td>
                        <!--<td style="width:50mm;" class="graph">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>-->
                     </tr>
                     <xsl:if test="gcadd:CommercialDocument">
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text>Сведения о коммерческом документе</xsl:text>
                           </td>
                           <td align="center" class="graph" colspan="2" style="width:55%;">
                              <!--<xsl:value-of select="torc:RegistrationDocument/torc:DocumentID"/>-->
                              <xsl:for-each select="gcadd:CommercialDocument">
								  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								  <xsl:if test="cat_ru:PrDocumentName">
									 <xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
								  <xsl:if test="cat_ru:PrDocumentNumber">№<xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
								  <xsl:if test="cat_ru:PrDocumentDate">от <xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
									 </xsl:call-template>
								  </xsl:if>
								  <xsl:if test="position()!=last()"><br/></xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                           <td align="center" class="graphLittle" colspan="2" style="width:55%;border-top:solid 0.8pt #000000;">
                              <xsl:text>(наименование, номер, дата)     </xsl:text>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Таможенный орган назначения</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="gcadd:ArrivalCustoms/cat_ru:Code"/>
                           <xsl:if test="gcadd:ArrivalCustoms/cat_ru:OfficeName">, <xsl:value-of select="gcadd:ArrivalCustoms/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;">
                           <xsl:text>(код, наименование)</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text>Таможенный орган отправления</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="gcadd:DepatureCustoms/cat_ru:Code"/>
                           <xsl:if test="gcadd:DepatureCustoms/cat_ru:OfficeName">, <xsl:value-of select="gcadd:DepatureCustoms/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;">
                           <xsl:text>(код, наименование)</xsl:text>
                        </td>
                     </tr>
                     <tr>
						 <td class="graph" style="width:45%;">
                           <xsl:text>Таможенный орган оформления</xsl:text>
                        </td>
                        <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.8pt #000000;">
                           <xsl:value-of select="gcadd:DeclarationCustoms/cat_ru:Code"/>
                           <xsl:if test="gcadd:DeclarationCustoms/cat_ru:OfficeName">, <xsl:value-of select="gcadd:DeclarationCustoms/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:45%;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                        <td align="center" class="graphLittle" colspan="2" style="width:55%;">
                           <xsl:text>(код, наименование)</xsl:text>
                        </td>
                     </tr>
                     <xsl:if test="gcadd:RegNumberDT">
                        <tr>
                           <td class="graph" style="width:45%;">
                              <xsl:text>Регистрационный номер таможенной декларации</xsl:text>
                           </td>
                           <td align="center" class="graph" colspan="2" style="width:55%;border-bottom:solid 0.8pt #000000;">
                              <xsl:value-of select="gcadd:RegNumberDT/cat_ru:CustomsCode"/>/<xsl:value-of select="substring(gcadd:RegNumberDT/cat_ru:RegistrationDate,9,2)"/>
                              <xsl:value-of select="substring(gcadd:RegNumberDT/cat_ru:RegistrationDate,6,2)"/>
                              <xsl:value-of select="substring(gcadd:RegNumberDT/cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="gcadd:RegNumberDT/cat_ru:GTDNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
