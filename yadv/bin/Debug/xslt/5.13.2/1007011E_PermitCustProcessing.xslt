<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="percp cat_ru catTreat_ru" version="1.0" xmlns:catTreat_ru="urn:customs.ru:Information:TreatmentDocuments:TreatmentCommonAggregateTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:percp="urn:customs.ru:Information:TreatmentDocuments:PermitCustProcessing:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <!-- Версия 4.7.0.0 от 25.02.2009.   -->
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
   <xsl:template match="percp:PermitCustProcessing">
      <html>
         <head>
            <title>Разрешение на переработку товаров на таможенной территории</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						//height: 297mm;
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
						
					.value
						{
						border-bottom: solid 1px black;
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
         <body class="graph">
            <div class="page">
               <h2>Разрешение на переработку товаров на таможенной территории
							№ <xsl:value-of select="percp:PermitNumber"/>
							от 
							<xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="percp:SendDate"/>
                  </xsl:call-template>
               </h2>
               <h4>
						Таможенный орган
						<xsl:value-of select="percp:Customs/cat_ru:Code"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="percp:Customs/cat_ru:OfficeName"/>
               </h4>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <xsl:if test="percp:BasicPermitNumber">
                              <span class="graphNo">Номер основного разрешения </span>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="percp:BasicPermitNumber"/>
                              <br/>
                           </xsl:if>
                           <span class="graphNo">Дата действия разрешения </span>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="percp:PermitPeriodDate"/>
                           </xsl:call-template>
                           <br/>
                           <span class="graphNo">Код режима переработки </span>
                           <xsl:value-of select="percp:TreatmentProcedureCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">1 Выдано </span>
                           <xsl:apply-templates select="percp:Declarant"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">2 Товары для переработки: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TrGoodsItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование<br/>товара(ов)</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость,<br/>руб.</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                    </tr>
                                    <xsl:apply-templates select="percp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TrGoodsItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TreatmentsGoodsInfo">
										Дополнительные сведения:
										<xsl:for-each select="percp:Treatment/catTreat_ru:TreatmentGoods/catTreat_ru:TreatmentsGoodsInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">3 Нормы выхода в относительном (в процентах) или в абсолютном выражении: </span>
                           <xsl:for-each select="percp:Treatment/catTreat_ru:YieldNorm">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">4 Продукты переработки: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование<br/>товара(ов)</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость,<br/>руб.</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                    </tr>
                                    <xsl:apply-templates select="percp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultItem"/>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultInfo">
										Дополнительные сведения:
										<xsl:for-each select="percp:Treatment/catTreat_ru:TrResult/catTreat_ru:TrResultInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">5 Отходы переработки: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование<br/>товара(ов)</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Код таможенной процедуры</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                    </tr>
                                    <xsl:for-each select="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsItem">
										<xsl:call-template name="tables5and7">
											<xsl:with-param name="row" select="."/>
										</xsl:call-template>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteOutProcedure">
										Режим выпуска отходов:
											<xsl:value-of select="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteOutProcedure"/>
                              <br/>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsInfo">
										Дополнительные сведения:
										<xsl:for-each select="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteProductsInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">6 Производственные потери: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:Loss/catTreat_ru:LossItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                    </tr>
                                    <xsl:for-each select="percp:Treatment/catTreat_ru:Loss/catTreat_ru:LossItem">
										<xsl:call-template name="table6">
											<xsl:with-param name="row" select="."/>
										</xsl:call-template>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:Loss/catTreat_ru:LossInfo">
										Дополнительные сведения:
										<xsl:for-each select="percp:Treatment/catTreat_ru:Loss/catTreat_ru:LossInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">7 Остатки: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование<br/>товара</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Код таможенной процедуры</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость,<br/>руб</td>
                                       <td align="center" class="graph" style="width:20mm;">Таможня</td>
                                    </tr>
                                    <xsl:for-each select="percp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsItem">
										<xsl:call-template name="tables5and7">
											<xsl:with-param name="row" select="."/>
										</xsl:call-template>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsOutProcedure">
										Режим выпуска остатков:
											<xsl:value-of select="percp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsOutProcedure"/>
                              <br/>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsInfo">
										Дополнительные сведения:
										<xsl:for-each select="percp:Treatment/catTreat_ru:Heels/catTreat_ru:HeelsInfo">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">8 Способ идентификации ввезенных товаров в продуктах переработки и отходах: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
                              <br/>
										Способы идентификации товаров в продуктах переработки: 
										<xsl:for-each select="percp:Treatment/catTreat_ru:TrResult/catTreat_ru:IdentificationMethod">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
                              <br/>
										Способы идентификации товаров в отходах: 
										<xsl:for-each select="percp:Treatment/catTreat_ru:WasteProducts/catTreat_ru:WasteIdentMethod">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">9 Эквивалентная компенсация разрешена: </span>
                           <xsl:if test="percp:Treatment/catTreat_ru:Substitute/catTreat_ru:SubstituteItem">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:50mm;">Наименование<br/>товара(ов)</td>
                                       <td align="center" class="graph" style="width:20mm;">Код по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Количество в ед. измерения по ТН ВЭД ЕАЭС</td>
                                       <td align="center" class="graph" style="width:20mm;">Стоимость,<br/>руб</td>
                                    </tr>
                                    <xsl:for-each select="percp:Treatment/catTreat_ru:Substitute/catTreat_ru:SubstituteItem">
										<xsl:call-template name="table9">
											<xsl:with-param name="row" select="."/>
										</xsl:call-template>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </xsl:if>
                           <xsl:if test="percp:Treatment/catTreat_ru:Substitute/catTreat_ru:Substitute">
										Дополнительные сведения:
										<xsl:for-each select="percp:Treatment/catTreat_ru:Substitute/catTreat_ru:Substitute">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">10 Опережающая поставка продуктов переработки: </span>
                           <xsl:if test="(percp:SupplyStatus='true') or (percp:SupplyStatus='t') or (percp:SupplyStatus='1')">да</xsl:if>
                           <xsl:if test="(percp:SupplyStatus='false') or (percp:SupplyStatus='f') or (percp:SupplyStatus='0')">нет</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">11 Краткое описание производственного процесса: </span>
                           <br/>
                           <xsl:for-each select="percp:Treatment/catTreat_ru:TreatmentOperations">
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
                           <span class="graphNo">12 Срок переработки: </span>
                           <br/>
									Общий срок переработки
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                           <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:GeneralTerm"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									месяца (ев)
									<br/>
                        </td>
                     </tr>
                     <xsl:if test="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm">
                        <tr>
                           <td class="graph" style="width:180mm;">
									Срок переработки<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              <xsl:if test="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:StartWith">
									 с <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:StartWith"/>
                                 </xsl:call-template>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:TermTo">
									 по <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:TermTo"/>
                                 </xsl:call-template>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              </xsl:if>
                              <xsl:if test="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID">
									N ДТ
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                                 <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID/cat_ru:CustomsCode"/>
                                 <xsl:text>/</xsl:text>
                                 <xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dateIn" select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID/cat_ru:RegistrationDate"/>
                                 </xsl:call-template>
                                 <xsl:text>/</xsl:text>
                                 <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:GTDID/cat_ru:GTDNumber"/>
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
                                          <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonPost"/>
                                          <br/>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graph" style="width:90mm;">
                                          <xsl:text>_____________</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:StartTerm/catTreat_ru:PersonSignature/cat_ru:PersonMiddleName"/>
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
                     <xsl:for-each select="percp:Treatment/catTreat_ru:DateLimit/catTreat_ru:ExtensionTerm">
                        <tr>
                           <td class="graph" style="width:180mm;">
									Срок переработки продлен
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              <xsl:value-of select="catTreat_ru:TermExtensionAt"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									месяца (ев)
									<br/>
									Общий срок переработки после продления составляет 
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
                              <xsl:value-of select="catTreat_ru:GeneralTermAfterExtension"/>
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
                                          <xsl:value-of select="catTreat_ru:PersonSignature/cat_ru:PersonPost"/>
                                          <br/>
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="catTreat_ru:PersonSignature/cat_ru:IssueDate"/>
                                          </xsl:call-template>
                                       </td>
                                       <td class="graph" style="width:90mm;">
                                          <xsl:text>_____________</xsl:text>
                                          <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          <xsl:value-of select="catTreat_ru:PersonSignature/cat_ru:PersonSurname"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="catTreat_ru:PersonSignature/cat_ru:PersonName"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="catTreat_ru:PersonSignature/cat_ru:PersonMiddleName"/>
                                          <br/>
                                          <span class="graph">(Подпись,фамилия,инициалы)</span>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                        <br/>
                     </xsl:for-each>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">13 Организации-переработчики: </span>
                           <xsl:for-each select="percp:Treatment/catTreat_ru:ProcOrganization">
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
                                             <td align="center" class="graph" style="width:20mm;">Стоимость,<br/>руб</td>
                                             <td align="center" class="graph" style="width:20mm;">Таможня</td>
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
                                             <td align="center" class="graph" style="width:20mm;">Стоимость,<br/>руб</td>
                                             <td align="center" class="graph" style="width:20mm;">Таможня</td>
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
                                 </xsl:if>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">14 Контракт или иной документ, в соответствии с которым осуществляется ввоз товаров для переработки (номер и дата заключения контракта, название иностранной организации, с которой заключен контакт): </span>
                           <br/>
                           <xsl:for-each select="percp:Contract">
									<!--Наименование иностранной организации:-->
										<xsl:value-of select="catTreat_ru:CompanyName"/>
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
                              <xsl:value-of select="cat_ru:PrDocumentName"/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <br/>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">15 Отходы подлежат помещению под таможенную процедуру: </span>
                           <xsl:for-each select="percp:CustProcedureWaste">
                              <xsl:value-of select="."/> 
									</xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="width:180mm;">
                           <span class="graphNo">16 Особые отметки таможни: </span>
                           <xsl:for-each select="percp:Comments">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
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
									<td class="graph" width="25%">
										<xsl:value-of select="percp:CustomsPerson/cat_ru:LNP"/><!--Начальник таможни<br/>(лицо, его замещающее)-->
									</td>
									<td class="graph" ></td>
									<td class="value graph" width="25%"></td>
									<td class="graph" ></td>
									<td class="value graph" align="center" width="25%"><xsl:value-of select="percp:CustomsPerson/cat_ru:PersonName"/></td>
								</tr>
								<tr>
									<td class="graph" ></td>
									<td class="graph" ></td>
									<td class="graph" align="center"><i>(подпись)</i></td>
									<td class="graph" ></td>
									<td class="graph" align="center"><i>(инициалы, фамилия)</i></td>
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
   <xsl:template match="catTreat_ru:RubBankInformation | catTreat_ru:ValBankInformation">
      <table border="0" style="width:180mm">
         <tbody>
            <tr>
               <td class="graph" style="width:90mm;">
                  <xsl:value-of select="./catTreat_ru:BankName"/>

                  <xsl:if test="./catTreat_ru:BankMFO">
			МФО 
			<xsl:value-of select="./catTreat_ru:BankMFO"/>
                  </xsl:if>
               </td>
            </tr>
         </tbody>
      </table>
      <br/>
   </xsl:template>
   <xsl:template match="percp:Declarant | catTreat_ru:ProcOrganization | percp:PermitProperties">
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
									</xsl:if>
      <br/>
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
   <!--шаблон для таблицы 9-->
   <xsl:template name="table9">
   		<xsl:param name="row"/>
   		<xsl:for-each select="$row">
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
				   <xsl:value-of select="catTreat_ru:RubCost"/> руб.
																<xsl:if test="catTreat_ru:CurrencyCost">
																	, <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCost"/>
																	(код  <xsl:value-of select="catTreat_ru:CurrencyCost/catTreat_ru:CurrencyCode"/>)
																</xsl:if>
				</td>
			</tr>
   		</xsl:for-each>
   </xsl:template>
   <!--шаблон для таблицы 6-->
   <xsl:template name="table6">
		<xsl:param name="row"/>
      <xsl:for-each select="$row">
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
         </tr>
      </xsl:for-each>
   </xsl:template>
   <!--шаблон для таблиц 5, 7-->
   <xsl:template name="tables5and7">
		<xsl:param name="row"/>
      <xsl:for-each select="$row">
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
               <xsl:value-of select="../catTreat_ru:WasteOutProcedure|../catTreat_ru:HeelsOutProcedure"/>
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
         </tr>
      </xsl:for-each>
   </xsl:template>
   <!--шаблон для таблиц 2, 4, 13-->
   <xsl:template match="catTreat_ru:TrGoodsItem | catTreat_ru:TrResultItem | catTreat_ru:WasteProductsItem">
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
               <!--xsl:if test="catTreat_ru:QuantityKg">
                  <xsl:value-of select="catTreat_ru:QuantityKg"/> кг
															</xsl:if>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="catTreat_ru:AddQuantity"/>
               <xsl:if test="catTreat_ru:AddUnit">
																(код  <xsl:value-of select="catTreat_ru:AddUnit"/>)
															</xsl:if-->
				<xsl:if test="catTreat_ru:GoodsQuantity">
					<xsl:value-of select="catTreat_ru:GoodsQuantity"/>
					<xsl:if test="catTreat_ru:MeasureUnitQualifierName">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="catTreat_ru:MeasureUnitQualifierName"/>
					</xsl:if>
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
         </tr>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress | catTreat_ru:Address  | catTreat_ru:LegalAddress | catTreat_ru:FactAddress">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="catTreat_ru:TreatmentOrganizationAddress/* | catTreat_ru:Address/*  | catTreat_ru:LegalAddress | catTreat_ru:FactAddress">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
