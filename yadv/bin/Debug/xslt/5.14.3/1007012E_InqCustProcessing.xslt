<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="inccp cat_ru catTreat_ru" version="1.0" xmlns:catTreat_ru="urn:customs.ru:Information:TreatmentDocuments:TreatmentCommonAggregateTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:inccp="urn:customs.ru:Information:TreatmentDocuments:InqCustProcessing:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="inccp:InqCustProcessing">
      <html>
         <head>
            <title>Заявление на переработку товаров на таможенной территории</title>
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
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <h2>Заявление на переработку товаров на таможенной территории
						<xsl:if test="inccp:InqDoc/cat_ru:PrDocumentNumber">
							№ <xsl:value-of select="inccp:InqDoc/cat_ru:PrDocumentNumber"/>
                  </xsl:if>
                  <xsl:if test="inccp:InqDoc/cat_ru:PrDocumentDate">
							от 
							<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="inccp:InqDoc/cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                  </xsl:if>
               </h2>
               <h4>
						Таможенный орган
						<xsl:value-of select="inccp:Customs/cat_ru:Code"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="inccp:Customs/cat_ru:OfficeName"/>
               </h4>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">1 Заявитель </span>
                           <xsl:apply-templates select="inccp:Declarant"/>
                           <br/>
                           <span class="graphNo">Контракт: </span>
                           <br/>
                           <xsl:for-each select="inccp:Contract">
									Наименование иностранной организации:
										<xsl:value-of select="catTreat_ru:CompanyName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="cat_ru:PrDocumentName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="cat_ru:PrDocumentNumber">
											№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                              </xsl:if>
                              <xsl:if test="cat_ru:PrDocumentDate">
											от 
											<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <br/>
                           </xsl:for-each>
                           <br/>
                           <xsl:if test="inccp:ContractHolder">
                              <span class="graphNo">Контрактодержатель </span>
                              <xsl:apply-templates select="inccp:ContractHolder"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">2 Товары для переработки: </span>
                           <xsl:if test="inccp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TrGoodsItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="inccp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TrGoodsItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TreatmentsGoodsInfo">
										Дополнительные сведения:
										<xsl:for-each select="inccp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TreatmentsGoodsInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">3 Нормы выхода в относительном (в процентах) или в абсолютном выражении: </span>
                           <xsl:for-each select="inccp:Treatment/catTreat_ru:YieldNorm">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">4 Продукты переработки: </span>
                           <!--br/>
									Способы идентификации товаров в продуктах переработки: 
									<xsl:for-each select="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
											<xsl:value-of select="."/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:for-each-->
                           <xsl:if test="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultInfo">
										Дополнительные сведения:
										<xsl:for-each select="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">5 Отходы переработки: </span>
                           <!--br/>
									Способы идентификации товаров в отходах: 
									<xsl:for-each select="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
											<xsl:value-of select="."/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:for-each-->
                           <xsl:if test="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteOutProcedure">
										Режим выпуска отходов:
											<xsl:value-of select="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteOutProcedure"/>
                              <br/>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsInfo">
										Дополнительные сведения:
										<xsl:for-each select="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">6 Производственные потери: </span>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Loss/catTreat_ru:LossItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="inccp:Treatment/catTreat_ru:Loss/catTreat_ru:LossItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Loss/catTreat_ru:LossInfo">
										Дополнительные сведения:
										<xsl:for-each select="inccp:Treatment/catTreat_ru:Loss/catTreat_ru:LossInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">7 Остатки: </span>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="inccp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsOutProcedure">
										Режим выпуска остатков:
											<xsl:value-of select="inccp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsOutProcedure"/>
                              <br/>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsInfo">
										Дополнительные сведения:
										<xsl:for-each select="inccp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">8 Способ идентификации ввезенных товаров в продуктах переработки и отходах: </span>
                           <xsl:if test="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
                              <br/>
										Способы идентификации товаров в продуктах переработки: 
										<xsl:for-each select="inccp:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
                              <br/>
										Способы идентификации товаров в отходах: 
										<xsl:for-each select="inccp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">9 Эквивалентная компенсация разрешена: </span>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Substitute/catTreat_ru:SubstituteItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                       <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                    </tr>
                                    <xsl:apply-templates select="inccp:Treatment/catTreat_ru:Substitute/catTreat_ru:SubstituteItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="inccp:Treatment/catTreat_ru:Substitute/catTreat_ru:Substitute">
										Дополнительные сведения:
										<xsl:for-each select="inccp:Treatment/catTreat_ru:Substitute/catTreat_ru:Substitute">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">10 Краткое описание производственного процесса: </span>
                           <br/>
                           <xsl:for-each select="inccp:Treatment/catTreat_ru:TreatmentOperations">
                              <xsl:value-of select="catTreat_ru:OperationName"/>
                              <xsl:if test="catTreat_ru:OperationMethod">, 
											<xsl:for-each select="catTreat_ru:OperationMethod">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                              </xsl:if>
                              <xsl:if test="catTreat_ru:OperationEndDate">, срок завершения операции:
											<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catTreat_ru:OperationEndDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                              <br/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">11 Срок переработки: </span>
                           <br/>
									Общий срок переработки
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:GeneralTerm"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									месяца (ев)
									<br/>
                        </td>
                     </tr>
                     <xsl:if test="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm">
                        <tr>
                           <td class="graph" style="width:180mm;">
									Срок переработки<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              <xsl:if test="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:StartWith">
									 с <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:StartWith"/>
                                 </xsl:call-template>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:TermTo">
									 по <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:TermTo"/>
                                 </xsl:call-template>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID">
									N ДТ
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID/cat_ru:CustomsCode"/>
                                 <xsl:text>/</xsl:text>
                                 <xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dateIn" select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID/cat_ru:RegistrationDate"/>
                                 </xsl:call-template>
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID/cat_ru:GTDNumber"/>
                              </xsl:if>
                              <br/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:180mm;">
                              <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="left" class="graph" style="width:90mm;">
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonPost"/>
                                          <br/>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graph" style="width:90mm;">
                                          <xsl:text>_____________</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonMiddleName"/>
                                          <br/>
                                          <span class="graph">(Подпись,фамилия,инициалы)</span>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <br/>
                     </xsl:if>
                     <xsl:if test="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:ExtensionTerm">
                        <tr>
                           <td class="graph" style="width:180mm;">
									Срок переработки продлен
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:ExtensionTerm/catTreat_ru:TermExtensionAt"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									месяца (ев)
									<br/>
									Общий срок переработки после продления составляет 
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:ExtensionTerm/catTreat_ru:GeneralTermAfterExtension"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									месяца (ев)
									<br/>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" style="width:180mm;">
                              <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="left" class="graph" style="width:90mm;">
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:ExtensionTerm/catTreat_ru:PersonSignature/cat_ru:PersonPost"/>
                                          <br/>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:ExtensionTerm/catTreat_ru:PersonSignature/cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graph" style="width:90mm;">
                                          <xsl:text>_____________</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="inccp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonMiddleName"/>
                                          <br/>
                                          <span class="graph">(Подпись,фамилия,инициалы)</span>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <br/>
                     </xsl:if>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:for-each select="inccp:Treatment/catTreat_ru:ProcOrganization">
                              <span class="graphNo">12 Организация-переработчик: </span>
                              <br/>
                              <xsl:apply-templates select="."/>
                              <br/>
											Контракт 
											<xsl:for-each select="catTreat_ru:Contract">
                                 <xsl:if test="cat_ru:PrDocumentNumber">
													№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                 </xsl:if>
                                 <xsl:if test="cat_ru:PrDocumentDate">
													от 
													<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:if>
                                 <xsl:value-of select="cat_ru:PrDocumentName"/>,
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                              <xsl:if test="catTreat_ru:TrResult">
                                 <br/>
                                 <span class="graphNo">Продукты переработки:  </span>
                                 <br/>
											Способы идентификации товаров в продуктах переработки: 
											<xsl:for-each select="catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                                 <xsl:if test="catTreat_ru:TrResult/catTreat_ru:TrResultItem">
                                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                             <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                             <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                             <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                             <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                             <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                             <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                          </tr>
                                          <xsl:apply-templates select="catTreat_ru:TrResult/catTreat_ru:TrResultItem"/>
                                       </tbody>
                                    </table>
                                 </xsl:if>
                                 <xsl:if test="catTreat_ru:TrResult/catTreat_ru:TrResultInfo">
												Дополнительные сведения:
												<xsl:for-each select="catTreat_ru:TrResult/catTreat_ru:TrResultInfo">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                    <br/>
                                 </xsl:if>
                              </xsl:if>
                              <xsl:if test="catTreat_ru:WasteProducts">
                                 <br/>
                                 <span class="graphNo">Отходы переработки:  </span>
                                 <br/>
											Способы идентификации товаров в отходах: 
											<xsl:for-each select="catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                                 <xsl:if test="catTreat_ru:WasteProducts/catTreat_ru:WasteProductsItem">
                                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                             <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                             <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                             <td align="center" class="graph" style="width:20mm;">Количество в доп. ед. измерения</td>
                                             <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                             <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                             <td align="center" class="graph" style="width:30mm;">Контракт</td>
                                          </tr>
                                          <xsl:apply-templates select="catTreat_ru:WasteProducts/catTreat_ru:WasteProductsItem"/>
                                       </tbody>
                                    </table>
                                 </xsl:if>
                                 <xsl:if test="catTreat_ru:WasteProducts/catTreat_ru:WasteOutProcedure">
												Режим выпуска отходов:
													<xsl:value-of select="catTreat_ru:WasteProducts/catTreat_ru:WasteOutProcedure"/>
                                    <br/>
                                 </xsl:if>
                                 <xsl:if test="catTreat_ru:WasteProducts/catTreat_ru:WasteProductsInfo">
												Дополнительные сведения:
												<xsl:for-each select="catTreat_ru:WasteProducts/catTreat_ru:WasteProductsInfo">
                                       <xsl:value-of select="."/>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    </xsl:for-each>
                                    <br/>
                                 </xsl:if>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">13 Стоимость переработки: </span>
                           <xsl:value-of select="inccp:Treatment/catTreat_ru:ProcessingCost"/>
                           <xsl:if test="inccp:Treatment/catTreat_ru:CostCurrencyCode">
										код валюты  <xsl:value-of select="inccp:Treatment/catTreat_ru:CostCurrencyCode"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">14 Таможня ввоза товаров для переработки: </span>
                           <xsl:value-of select="inccp:GoodsInCustoms/cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="inccp:GoodsInCustoms/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">15 Таможня вывоза готовой продукции: </span>
                           <xsl:value-of select="inccp:GoodsOutCustoms/cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="inccp:GoodsOutCustoms/cat_ru:OfficeName"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <table border="0" cellpadding="3" cellspacing="0" width="100%">
                              <tbody>
                                 <tr>
                                    <td class="graph" style="width:90mm;">
                                       <xsl:value-of select="inccp:PersonSignature/cat_ru:PersonPost"/>
                                       <br/>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="inccp:PersonSignature/cat_ru:IssueDate"/>
                                       </xsl:call-template>
                                    </td>
                                    <td class="graph" style="width:90mm;">
                                       <xsl:text>_____________</xsl:text>
                                       <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                       <xsl:value-of select="inccp:PersonSignature/cat_ru:PersonSurname"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="inccp:PersonSignature/cat_ru:PersonName"/>
                                       <xsl:text> </xsl:text>
                                       <xsl:value-of select="inccp:PersonSignature/cat_ru:PersonMiddleName"/>
                                       <br/>
                                       <span class="graph">(Подпись,фамилия,инициалы)</span>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--xsl:template match="catTreat_ru:RubBankInformation | catTreat_ru:ValBankInformation">
		<xsl:apply-templates/>
	</xsl:template-->
   <xsl:template match="catTreat_ru:RubBankInformation | catTreat_ru:ValBankInformation">
      <table border="0" style="width:180mm">
         <tbody>
            <tr>
               <td class="graph" style="width:90mm;">
				Банк:<br/>
                  <xsl:value-of select="./catTreat_ru:BankName"/>
                  <br/>
				ОКПО
		<xsl:value-of select="./catTreat_ru:BankOKPO"/>
                  <xsl:if test="./catTreat_ru:BankMFO">
			МФО 
			<xsl:value-of select="./catTreat_ru:BankMFO"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:if>
               </td>
               <td class="graph" style="width:90mm;">
                  <xsl:for-each select="./catTreat_ru:BankAccount">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catTreat_ru:BankAccountDescription"/>
			№ <xsl:value-of select="catTreat_ru:BankAccount"/>,
			<br/>
                  </xsl:for-each>
               </td>
            </tr>
         </tbody>
      </table>
      <br/>
   </xsl:template>
   <xsl:template match="inccp:Declarant | inccp:ContractHolder |  catTreat_ru:ProcOrganization">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
									</xsl:if>
      <br/>
      <xsl:if test="./catTreat_ru:OKPOID">
										ОКПО 
										<xsl:value-of select="./catTreat_ru:OKPOID"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:OKATOCode">
										ОКАТО 
										<xsl:value-of select="./catTreat_ru:OKATOCode"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
										ОГРН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
      </xsl:if>
      <xsl:if test="./cat_ru:RFOrganizationFeatures/cat_ru:KPP">
										КПП 
										<xsl:value-of select="./cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
      </xsl:if>
      <br/>
      <xsl:if test="./catTreat_ru:Phone">
										тел.
										<xsl:value-of select="./catTreat_ru:Phone"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:Fax">
										факс: 
										<xsl:value-of select="./catTreat_ru:Fax"/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:Telex">
										телекс
										<xsl:value-of select="./catTreat_ru:Telex"/>
      </xsl:if>
      <br/>
      <xsl:if test="./catTreat_ru:LegalAddress">
		Юридический адрес:
			<xsl:apply-templates select="./catTreat_ru:LegalAddress"/>
         <br/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:FactAddress">
		Фактический адрес:
			<xsl:apply-templates select="./catTreat_ru:FactAddress"/>
         <br/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:TreatmentOrganizationAddress">
				Адрес  производственных  площадей:
			<xsl:apply-templates select="./catTreat_ru:TreatmentOrganizationAddress"/>
         <br/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:RubBankInformation">
         <br/>
										Рублевый счет:
										<br/>
         <xsl:apply-templates select="./catTreat_ru:RubBankInformation"/>
         <br/>
      </xsl:if>
      <xsl:if test="./catTreat_ru:ValBankInformation">
		
										Валютный счет:
										<br/>
         <xsl:apply-templates select="./catTreat_ru:ValBankInformation"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catTreat_ru:TrGoodsItem | catTreat_ru:TrResultItem | catTreat_ru:WasteProductsItem | catTreat_ru:LossItem | catTreat_ru:HeelsItem | catTreat_ru:SubstituteItem">
      <xsl:for-each select=".">
         <tr>
            <td align="center" class="graph" style="width:50mm;">
               <xsl:for-each select="catTreat_ru:Name">
                  <xsl:value-of select="."/>
               </xsl:for-each>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:TNVED"/>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:if test="catTreat_ru:QuantityKg">
                  <xsl:value-of select="catTreat_ru:QuantityKg"/> кг
															</xsl:if>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:AddQuantity"/>
               <xsl:if test="catTreat_ru:AddUnit">
																(код  <xsl:value-of select="catTreat_ru:AddUnit"/>)
															</xsl:if>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:GoodsQuantity"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:MeasureUnitQualifierName"/>
               <xsl:if test="catTreat_ru:MeasureUnitQualifierCode">
																(код  <xsl:value-of select="catTreat_ru:MeasureUnitQualifierCode"/>)
															</xsl:if>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:RubCost"/> руб.
															<xsl:if test="catTreat_ru:CurrencyCost">
																, <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCost"/>
																(код  <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCode"/>)
															</xsl:if>
            </td>
            <td align="center" class="graph" style="width:20mm;">
               <xsl:value-of select="catTreat_ru:CustomsCode"/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </td>
            <td align="center" class="graph" style="width:30mm;">
               <xsl:for-each select="catTreat_ru:Contract">
                  <xsl:if test="cat_ru:PrDocumentNumber">
																	№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                  </xsl:if>
                  <xsl:if test="cat_ru:PrDocumentDate">
																	от 
																	<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                     <br/>
                  </xsl:if>
               </xsl:for-each>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </td>
         </tr>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress | catTreat_ru:Address | catTreat_ru:LegalAddress | catTreat_ru:FactAddress">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress/* | catTreat_ru:Address/* | catTreat_ru:LegalAddress/* | catTreat_ru:FactAddress/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
