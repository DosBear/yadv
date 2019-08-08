<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cdep="urn:customs.ru:Information:CommercialFinanceDocuments:ContractDealPassport:5.14.3" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Инструкция Банка России N 138-И-->
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
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
   <xsl:template name="yymm">
      <xsl:param name="reg"/>
      <xsl:choose>
         <xsl:when test="substring($reg,5,1)='-' ">
            <xsl:value-of select="substring($reg,3,2)"/>
            <xsl:value-of select="substring($reg,6,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$reg"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cdep:ContractDealPassport">
      <html>
         <head>
            <style type="text/css">
					div.page {
						width: 210mm;
						/*height: 297mm;*/
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
					}
						
					h1 {
						font-size: 25;
					}
					
					.resident {
						width:100%;
						/*border: 1px solid black; */
					}
						
					.resident tr {
						height:30px;
					}
					
					.column {
						width:100%; 
						border: 1px solid black; 
						border-collapse: collapse;
					}					
					
					.column td {
						padding: 5px; /* Поля вокруг содержимого ячеек */
						border: 1px solid black; /* Граница вокруг ячеек */
					}
					
					.tab {
						width: 20px;	
					}
					
				</style>
         </head>
         <body>
            <div class="page">
				<table width="100%">
					<tbody>
						<tr align="center" valign="middle">
							<td style="border:1px solid;">
								<xsl:value-of select="cdep:BankName"/>
							</td>
						</tr>
						<tr align="center" valign="middle">
							<td>
								Наименование банка ПС
							</td>
						</tr>
					</tbody>
				</table>
               <span>
						Паспорт сделки
						<xsl:if test="cdep:Date">
						от
						<xsl:call-template name="russian_date_gtd">
							 <xsl:with-param name="dateIn" select="cdep:Date"/>
						  </xsl:call-template>
						  </xsl:if>
                  <span class="tab"/> 
						N <xsl:apply-templates select="cdep:PSNumber"/>
               </span>
               <xsl:apply-templates select="cdep:ResidentInfo"/>
               <xsl:if test="cdep:NonresidentInfo">
                  <p><b>2. Реквизиты нерезидента (нерезидентов)</b></p>
                  <table class="column">
                     <tr>
                        <td rowspan="2">Наименование</td>
                        <td colspan="2">Страна</td>
                     </tr>
                     <tr>
                        <td>наименование</td>
                        <td>код</td>
                     </tr>
                     <xsl:apply-templates select="cdep:NonresidentInfo"/>
                  </table>
               </xsl:if>
               <p><b>3. Общие сведения о контракте</b></p>
               <table class="column">
                  <tr>
                     <td rowspan="2">N</td>
                     <td rowspan="2">Дата</td>
                     <td colspan="2">Валюта контракта</td>
                     <td rowspan="2">Сумма контракта</td>
                     <td rowspan="2" style="width:30%">Дата завершения исполнения обязательств по контракту</td>
                  </tr>
                  <tr>
                     <td>Наименование</td>
                     <td>Код</td>
                  </tr>
                  <xsl:apply-templates select="cdep:CommonContractInfo"/>
               </table>
               <xsl:if test="cdep:AdditionalInfo">
                  <p><b>4. Сведения об оформлении, о переводе, и закрытии паспорта сделки</b></p>
                  <table class="column">
                     <tr>
                        <td style="width:5%">N п/п</td>
                        <td>Регистрационный номер банка ПС</td>
                        <td>Дата принятия паспорта сделки при его переводе</td>
                        <td>Дата закрытия паспорта сделки при его переводе</td>
                        <td>Основание закрытия паспорта сделки</td>
                     </tr>
                     <xsl:apply-templates select="cdep:AdditionalInfo"/>
                  </table>
               </xsl:if>
               <xsl:if test="cdep:UpdatingInfo">
                  <p><b>5. Сведения о переоформлении паспорта сделки</b></p>
                  <table class="column">
                     <tr>
                        <td rowspan="2">N</td>
                        <td rowspan="2">Дата</td>
                        <td colspan="2">Документ на основании которого внесены изменения в паспорт сделки</td>
                     </tr>
                     <tr>
                        <td>N</td>
                        <td>дата</td>
                     </tr>
                     <xsl:apply-templates select="cdep:UpdatingInfo"/>
                  </table>
               </xsl:if>
               <xsl:if test="cdep:PreviousPSNumber">
                  <xsl:apply-templates select="cdep:PreviousPSNumber"/>
               </xsl:if>
               <p><b>7. Справочная информация</b></p>
               <xsl:apply-templates select="cdep:DocumentRegistrationType"/>
               <xsl:apply-templates select="cdep:CompletedDocumentType"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="cdep:DocumentRegistrationType">
      <table style="width:100%; margin-top:20px;">
         <tr>
            <td style="width:70%">7.1. Способ и дата представления резидентом документов для оформления (переоформления, принятия на обслуживание, закрытия) паспорта сделки</td>
            <td>
               <xsl:if test="cdep:DocumentType='1'">
                  <td align="right" style="width:5%">1</td>
               </xsl:if>
               <xsl:if test="cdep:DocumentType='2'">
                  <td align="right" style="width:5%">2</td>
               </xsl:if>
            </td>
            <td align="right" style="width:15%">
               <xsl:call-template name="russian_date_gtd">
                  <xsl:with-param name="dateIn" select="cdep:Date"/>
               </xsl:call-template>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="cdep:CompletedDocumentType">
      <table style="width:100%; margin-top:20px;">
         <tr>
            <td style="width:70%">7.2 Способ и дата направления резиденту оформленного (переоформленного, принятого на обслуживание, закрытого) паспорта сделки</td>
            <td>
               <xsl:if test="cdep:DocumentType='1'">
                  <td align="right" style="width:5%">1</td>
               </xsl:if>
               <xsl:if test="cdep:DocumentType='2'">
                  <td align="right" style="width:5%">2</td>
               </xsl:if>
            </td>
            <td align="right" style="width:15%">
               <xsl:call-template name="russian_date_gtd">
                  <xsl:with-param name="dateIn" select="cdep:Date"/>
               </xsl:call-template>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="cdep:PreviousPSNumber">
      <table style="width:100%; margin-top:20px;">
         <tr>
            <td style="width:50%"><b>6. Сведения о ранее оформленном паспорте сделки</b></td>
            <td align="right">
               <xsl:call-template name="yymm">
                  <xsl:with-param name="reg" select="cdep:RegistrationPeriod"/>
               </xsl:call-template>
               <xsl:value-of select="cdep:PSSerialNumber"/>/
					<xsl:value-of select="cdep:BankRegistrationNumber"/>/
					<xsl:value-of select="cdep:AffiliateSerialNumber"/>/
					<xsl:value-of select="cdep:ContractCode"/>/
					<xsl:value-of select="cdep:ResidentSign"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="cdep:UpdatingInfo">
      <tr>
         <td>
            <xsl:value-of select="cdep:Restructuring/cat_ru:PrDocumentNumber"/>
         </td>
         <td>
            <xsl:call-template name="russian_date_gtd">
               <xsl:with-param name="dateIn" select="cdep:Restructuring/cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:value-of select="cdep:ReasonsDocuments/cat_ru:PrDocumentNumber"/>
         </td>
         <td>
            <xsl:call-template name="russian_date_gtd">
               <xsl:with-param name="dateIn" select="cdep:ReasonsDocuments/cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="cdep:AdditionalInfo">
      <tr>
         <td>
            <xsl:value-of select="position()"/>
         </td>
         <td>
            <xsl:value-of select="cdep:BankRegistrationNumber"/>/
				<xsl:value-of select="cdep:AffilianceRegistrationNumber"/>
         </td>
         <td>
            <xsl:call-template name="russian_date_gtd">
               <xsl:with-param name="dateIn" select="cdep:TransferDate"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:call-template name="russian_date_gtd">
               <xsl:with-param name="dateIn" select="cdep:ClosingDate"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:value-of select="cdep:ClosingReasons"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="cdep:CommonContractInfo">
      <tr>
         <td>
            <xsl:value-of select="cdep:Number"/>
         </td>
         <td>
            <xsl:call-template name="russian_date_gtd">
               <xsl:with-param name="dateIn" select="cdep:MostLaterDate"/>
            </xsl:call-template>
         </td>
         <td>
            <xsl:value-of select="cdep:CurrencyName"/>
         </td>
         <td>
            <xsl:value-of select="cdep:CurrencyCode"/>
         </td>
         <td>
            <xsl:choose>
               <xsl:when test="cdep:ContractSum">
                  <xsl:value-of select="cdep:ContractSum"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="cdep:NonContractSum"/>
               </xsl:otherwise>
            </xsl:choose>
         </td>
         <td>
            <xsl:call-template name="russian_date_gtd">
               <xsl:with-param name="dateIn" select="cdep:CompletionDate"/>
            </xsl:call-template>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="cdep:NonresidentInfo">
      <tr>
         <td>
            <xsl:value-of select="cdep:Name"/>
         </td>
         <td>
            <xsl:value-of select="cdep:CountryName"/>
         </td>
         <td>
            <xsl:value-of select="cdep:CountryCode"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="cdep:PSNumber">
      <xsl:call-template name="yymm">
         <xsl:with-param name="reg" select="cdep:RegistrationPeriod"/>
      </xsl:call-template>
      <xsl:value-of select="cdep:PSSerialNumber"/>/<xsl:value-of select="cdep:BankRegistrationNumber"/>/<xsl:value-of select="cdep:AffiliateSerialNumber"/>/<xsl:value-of select="cdep:ContractCode"/>/<xsl:value-of select="cdep:ResidentSign"/>
   </xsl:template>
   <xsl:template match="cdep:ResidentInfo">
      <p><b>1. Сведения о резиденте</b></p>
      <p>
			1.1. Наименование
			<xsl:value-of select="cat_ru:OrganizationName"/>
         <xsl:if test="cdep:AffiliateName != '' ">
				, <xsl:value-of select="cdep:AffiliateName"/>
         </xsl:if>
      </p>
      <xsl:apply-templates select="RUScat_ru:SubjectAddressDetails"/>
      <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <table width="100%">
         <tbody>
            <tr>
               <td>1.3. Основной государственный регистрационный номер</td>
               <td align="right">
                  <xsl:choose>
                     <xsl:when test="//cdep:AdditionalInfo/cdep:NotaryAttorneyRegNumber and (//cdep:AdditionalInfo/cdep:NotaryAttorneyRegNumber!='')">
                        <xsl:value-of select="//cdep:AdditionalInfo/cdep:NotaryAttorneyRegNumber"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="cat_ru:OGRN"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
				<td>
					1.4. Дата внесения записи в государственный реестр
				</td>
			</tr>
            <tr>
               <td>1.5. ИНН / КПП</td>
               <td align="right">
                  <xsl:value-of select="cat_ru:INN"/> /
							<xsl:value-of select="cat_ru:KPP"/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="RUScat_ru:SubjectAddressDetails">
	    <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
			<tbody>
				<tr valign="top">
					<td><p>1.2. Адрес:</p></td>
					<td>
					<table class="resident">
						 <tr>
							<td style="width:10%"/>
							<td style="width:40%">Субъект Российской Федерации</td>
							<td style="border:1px solid;">
							   <xsl:value-of select="RUScat_ru:CounryName"/>
							</td>
						 </tr>
						 <tr>
							<td style="width:10%"/>
							<td style="width:40%">Район</td>
							<td style="border:1px solid;">
								<xsl:value-of select="RUScat_ru:Region"/>
							</td>
						 </tr>
						 <tr>
							<td/>
							<td>Город</td>
							<td style="border:1px solid;">
								<xsl:value-of select="RUScat_ru:City"/>
							</td>
						 </tr>
						 <tr>
							<td/>
							<td>Населенный пункт</td>
							<td style="border:1px solid;">
								<xsl:value-of select="RUScat_ru:Town"/>
							</td>
						 </tr>
						 <tr>
							<td/>
							<td>Улица (проспект, переулок и т.д.)</td>
							<td valign="top" style="border:1px solid;">
							   <xsl:value-of select="RUScat_ru:StreetHouse"/>
							</td>
						 </tr>
						 <tr align="right">
							<td colspan="2">
								<table cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
									<tbody>
										<tr>
											<td>Номер дома (владение)</td>
											<td style="border:1px solid; width:30%;">
													<xsl:value-of select="RUScat_ru:House"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
									<tbody>
										<tr>
											<td width="40%">корпус (строение)</td>
											<td width="10%" style="border:1px solid;"></td>
											<td width="40%">офис (квартира)</td>
											<td width="10%" style="border:1px solid;">
												<xsl:value-of select="RUScat_ru:Room"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						 </tr>
					  </table>
					</td>
				</tr>
			</tbody>
		</table>
   </xsl:template>
</xsl:stylesheet>
