<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:KTDin="urn:customs.ru:Information:CustomsDocuments:KTDin:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <!--Графа B-->
   <xsl:template name="PaymentDetails">
      <b>B</b> ПОДРОБНОСТИ ПОДСЧЁТА<br/>
      <table style="width: 100%; border-collapse: collapse;">
         <tr>
            <th class="tt tb tr">Вид</th>
            <th class="tt tb tr">Сумма</th>
            <th class="tt tb tr">Предыдущая сумма</th>
            <th class="tt tb tr">Изменения</th>
            <th class="tt tb">Номер и дата платёжного поручения</th>
            <th class="tt tb">СУ</th>
         </tr>
         <xsl:variable name="paymentDetails" select="//KTDin:KDTinPayments/KTDin:KDTinCustomsPayment"/>
         <xsl:choose>
            <xsl:when test="count($paymentDetails) > 0">
               <xsl:apply-templates select="$paymentDetails"/>
            </xsl:when>
            <xsl:otherwise>
               <tr>
                  <td class="tb tr" style="height: 8px;"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
               </tr>
               <tr>
                  <td class="tb tr" style="height: 8px;"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
               </tr>
            </xsl:otherwise>
         </xsl:choose>
         <tr>
            <td colspan="5">
               <xsl:text>Общая сумма, подлежащая возврату (взысканию), руб.</xsl:text>
               <xsl:variable name="paymentAmounts" select="$paymentDetails/catESAD_cu:PaymentAmount"/>
               <xsl:variable name="paymentPrevious" select="$paymentDetails/KTDin:PaymentPrevious"/>
               <xsl:if test="count($paymentAmounts | $paymentPrevious) > 0">
                  <xsl:text>: </xsl:text>
                  <xsl:value-of select="sum($paymentAmounts) - sum($paymentPrevious)"/>
               </xsl:if>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Информация о подробностях таможенных плажетей для графы B-->
   <xsl:template match="KTDin:KDTinPayments/KTDin:KDTinCustomsPayment">
   <xsl:for-each select=".">
      <tr>
         <!--xsl:for-each select="//SADin:ESADinPayments/SADin:ESADinCustomsPayment">
									<xsl:if test="position() > 1">
										<br/>
									</xsl:if>
									<xsl:value-of select="catESAD_cu:PaymentModeCode"/>
									<span class="graph">-</span>
									<xsl:value-of select="catESAD_cu:PaymentAmount"/>
									<xsl:if test="catESAD_cu:PaymentCurrencyCode">
										<span class="graph">-</span>
										<xsl:value-of select="catESAD_cu:PaymentCurrencyCode"/>
									</xsl:if>
									<xsl:value-of select="KTDin:PaymentPrevious"/>
									<xsl:if test="KTDin:RateCurrencyCodePrevious">
										<span class="graph">-</span>
										<xsl:value-of select="KTDin:RateCurrencyCodePrevious"/>
									</xsl:if>
								</xsl:for-each>
        
        </td>
         <td>
                                <xsl:for-each select="//KTDin:ESADinPayments/KTDin:ESADinCustomsPayment">
									<xsl:for-each select="KTDin:PaymentDocument">
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:if test="cat_ru:PrDocumentDate">
											<span class="graph">-</span>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>,
									</xsl:if>
									</xsl:for-each>
									<br/>
								</xsl:for-each>
                            </td-->
         <td class="tt tb tr">
            <xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
         </td>
         <td class="tt tb tr">
            <xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
         </td>
         <td class="tt tb tr">
            <xsl:apply-templates select="KTDin:PaymentPrevious"/>
         </td>
         <td class="tt tb tr">
            <!--<xsl:variable name="paymentChanges">
               <xsl:choose>
                  <xsl:when test="KTDin:PaymentPrevious">
                     <xsl:value-of select="catESAD_cu:PaymentAmount - KTDin:PaymentPrevious"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:if test="$paymentChanges > 0">
               <xsl:text>+</xsl:text>
            </xsl:if>
            <xsl:value-of select="$paymentChanges"/>-->
            <xsl:value-of select="KTDin:ChangeAmount"/>
         </td>
         <td class="tt tb tr">
            <xsl:for-each select="KTDin:PaymentDocument">
               <!--<xsl:value-of select="cat_ru:PrDocumentNumber"/>
               <xsl:if test="cat_ru:PrDocumentDate">
                  <span class="graph">-</span>
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                  </xsl:call-template>
               </xsl:if>-->
               <xsl:if test="cat_ru:PrDocumentNumber">№ <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate"> от <xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
				</xsl:if>
				Сумма уплаты / возврата <xsl:value-of select="KTDin:DocPaymentAmount"/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
            </xsl:for-each>
            <!--xsl:apply-templates select="catESAD_cu:DelayPremitNumber | catESAD_cu:DelayPremitDate"/-->
         </td>
         <td class="tt tb">
         <xsl:for-each select="KTDin:PaymentDocument">
         <xsl:value-of select="KTDin:PaymentWayCode"/>
         <xsl:if test="position()!=last()"><br/></xsl:if>
            </xsl:for-each>
         </td>
      </tr></xsl:for-each>
   </xsl:template>
   <!--Дата платёжного поручения-->
   <xsl:template match="catESAD_cu:DelayPremitDate">
      <xsl:text> от </xsl:text>
      <xsl:apply-templates mode="date" select="."/>
      <xsl:text> г.</xsl:text>
   </xsl:template>
   <!--Применяется к любым элементам, содержащим дату. Выводит дату по стандартам русской локали-->
   <xsl:template match="*" mode="date">
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="."/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template name="russian_date2">
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
   <xsl:template match="KTDin:KTDin">
      <html>
         <head>
            <title>Корректировка декларации на товары. Внутренний формат</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 7pt;}
                    div.page {
                        width: 190mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    .graphMain {font-size: 9pt; font-weight: bold;}
                    .graphNum {font-weight: bold;}
                    .graphNo {font-weight: bold;}
                    h1{font-size: 12pt;}
                    table{width: 100%; border-collapse: collapse; margin: 0;}
                    td {vertical-align: top;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: White; padding: 2px;}
                    table.addInfo td {border: 1px solid black; vertical-align: top; padding: 2px;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .t {border: 1px solid black;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .b {border: 2px solid black;}
                    .br {border-right: 2px solid black;}
                    .bl {border-left: 2px solid black;}
                    .bb {border-bottom: 2px solid black;}
                    .bt {border-top: 2px solid black;}
                    .green {background: #FFFFFF;}
                    .nopadding {padding: 0;}
                    .nowrap {white-space: nowrap;}
                    td.firstCol {width: 55px;}
                    td.narrow {width: 1%;}
                    .dl {border-left: 1px dashed black;}
                    .db {border-bottom: 1px dashed black;}
                </style>
         </head>
         <body>
            <div class="page">
               <xsl:call-template name="td3Header"/>
               <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinGoods[position() = 1]"/>
               <xsl:if test="not(//KTDin:KTDinGoods)">
		        <xsl:call-template name="EmptyGoods">
			        <xsl:with-param name="EmpGoods" select="//KTDin:KTDin"/>
		        </xsl:call-template></xsl:if>
               <xsl:call-template name="td3section47"/>
               <!--xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinReloadingInfo"/-->
               <xsl:call-template name="td3sectionFDJ"/>
            </div>
            <xsl:if test="count(//KTDin:KTDinGoods) > 1">
               <xsl:call-template name="td4"/>
            </xsl:if>
            
            
            <!--xsl:if test="count(//KTDin:KTDinDeclarationDecision | //KTDin:KTDinCommonOfficialMark) > 0"-->
            <xsl:if test="count(//KTDin:KTDinCommonOfficialMark) > 0">
	            <div class="page">
                  <!--xsl:apply-templates select="KTDin:KTDinDeclarationDecision"/-->
                  <xsl:apply-templates select="KTDin:KTDinCommonOfficialMark"/>
                  <xsl:call-template name="goodsOfficialMarks"/>
               </div>
            </xsl:if>
            <!--xsl:if test="count(//KTDin:KTDinAutomobile | //KTDin:KTDinContractList) > 0"-->
            <xsl:if test="count(//KTDin:KTDinAutomobile) > 0">
               <div class="page">
                  <xsl:call-template name="automobile"/>
                  <!--xsl:apply-templates mode="foreignTradeContracts" select="//KTDin:KTDinGoods[count(KTDin:KTDinContractList) > 0]"/-->
               </div>
            </xsl:if>
         </body>
      </html>
   </xsl:template>
   <!--Если количество товаров в декларации больше, чем 1, 2 - ... выводятся на бланке ТД4-->
   <xsl:template name="td4">
      <xsl:for-each select="//KTDin:KTDinGoods">
         <xsl:if test="(position() - 1) mod 3 = 1">
            <xsl:variable name="firstEntryPos" select="position()"/>
            <div class="page">
               <xsl:call-template name="td4Head"/>
               <xsl:for-each select="//KTDin:KTDinGoods">
                  <xsl:if test="position() >= $firstEntryPos and position() &lt;= $firstEntryPos + 2">
                     <xsl:apply-templates select="."/>
                  </xsl:if>
               </xsl:for-each>
               <table style="height: 100%;">
                  <tr>
                     <td class="firstCol tr tb">
                        <b>47 </b> Исчисление платежей</td>
                     <td class="tl tt br bb nopadding" style="width: 45%;">
                        <xsl:apply-templates mode="payments" select="//KTDin:KTDinGoods[position() = $firstEntryPos]">
                           <xsl:with-param name="GoodsNumberDescription"> по первому товару</xsl:with-param>
                        </xsl:apply-templates>
                     </td>
                     <td class="tr tt bb nopadding">
                        <xsl:apply-templates mode="payments" select="//KTDin:KTDinGoods[position() = $firstEntryPos + 1]">
                           <xsl:with-param name="GoodsNumberDescription"> по второму товару</xsl:with-param>
                        </xsl:apply-templates>
                     </td>
                  </tr>
                  <xsl:variable name="thirdGoods" select="//KTDin:KTDinGoods[position() = $firstEntryPos + 2]"/>
                  <xsl:if test="$thirdGoods">
                     <tr>
                        <td class="tb tr"/>
                        <td class="br tb nopadding">
                           <xsl:apply-templates mode="payments" select="$thirdGoods">
                              <xsl:with-param name="GoodsNumberDescription"> по третьему товару</xsl:with-param>
                           </xsl:apply-templates>
                        </td>
                        <td class="tr tb"/>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </xsl:if>
      </xsl:for-each>
   </xsl:template>
   <!--Верхняя часть листа КТД2-->
   <xsl:template name="td4Head">
      <table style="height: 100%">
         <tr>
            <td class="firstCol"/>
            <td class="header nowrap" colspan="5">ДОПОЛНИТЕЛЬНЫЙ ЛИСТ К ФОРМЕ КОРРЕКТИРОВКИ/</td>
            <td class="tl nowrap" colspan="6">
               <b>А</b> </td>
         </tr>
         <tr>
            <td/>
            <td class="tb header nowrap">ТАМОЖЕННОЙ ДЕКЛАРАЦИИ (КТД 2)</td>
            <td class="bl bt br" colspan="4">
               <b>1</b> ДЕКЛАРАЦИЯ</td>
            <td colspan="6">
               <xsl:apply-templates mode="numberGTD" select="//KTDin:GTDNumber"/>
            </td>
         </tr>
         <tr>
            <td/>
            <td class="tl green nopadding">
               <table>
                  <tr>
                     <td class="nowrap" style="width: 40%;">
                        <b>2</b> Отправитель/<i>Экспортер</i>
                     </td>
                     <td class="nowrap" style="width: 40%;">
                        <b>8</b> Получатель</td>
                     <td>№</td>
                  </tr>
               </table>
            </td>
            <td class="bl br" colspan="4"/>
            <td colspan="6"/>
         </tr>
         <tr>
            <td/>
            <td class="tl green br tb" rowspan="3">
               <i>Отправитель: </i>
               <xsl:apply-templates mode="org" select="//KTDin:KTDinConsignor"/>
               <hr/>
               <i>Получатель: </i>
               <xsl:apply-templates mode="org" select="//KTDin:KTDinConsignee"/>
            </td>
            <td class="bl bb br nopadding" colspan="4" style="vertical-align: bottom;">
               <table>
                  <tr>
                     <td class="green" style="vertical-align: bottom; text-align: left; width: 30%;"/>
                     <td class="tr green" style="vertical-align: bottom; text-align: right; width: 1%;">
                        <b>C</b>
                     </td>
                     <td class="tr"/>
                     <td class="green" style="vertical-align: bottom; text-align: right; width: 50%;">
                        <b>BIS</b>
                     </td>
                  </tr>
               </table>
            </td>
            <td colspan="6"/>
         </tr>
         <tr>
            <td/>
            <td class="nowrap" colspan="2">
               <b>3</b> Формы</td>
            <td class="br tb bl number" rowspan="2">1</td>
            <td class="br tb bl number" rowspan="2">6</td>
            <td colspan="4"/>
         </tr>
         <tr>
            <td class="tb"/>
            <td class="tb"/>
            <td class="tb"/>
            <td class="tb" colspan="6"/>
         </tr>
      </table>
   </xsl:template>
   <!--Разделы F, D, J бланка ТД-3-->
   <xsl:template name="td3sectionFDJ">
      <table>
         <tr>
            <td class="firstCol tr tb" rowspan="4"/>
            <td class="green tl">
               <b>50 </b>Принципал</td>
            <td class="green">№ <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinPrincipal/cat_ru:OGRN"/>
            </td>
            <td class="green">Подпись:</td>
            <td class="dl db tr" colspan="2" rowspan="4">
               <b>С </b>
            </td>
         </tr>
         <tr>
            <td class="green tl" colspan="3">
               <xsl:apply-templates mode="org" select="KTDin:KTDinGoodsShipment/KTDin:KTDinPrincipal"/>
            </td>
         </tr>
         <tr>
            <td class="green tl" colspan="3">
                    представленный
                    <xsl:for-each select="KTDin:KTDinGoodsShipment/KTDin:KTDinPrincipal/KTDin:ESADPrincipalRepresentative">
                  <br/>
                  <xsl:apply-templates select="cat_ru:PersonName"/>
                  <xsl:apply-templates select="cat_ru:PersonPost"/>
                  <br/>
                  <xsl:apply-templates select="catESAD_ru:IdentityCard"/>
               </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="green tb tl" colspan="3">Место и дата:</td>
         </tr>
      </table>
      <table>
         <tr>
            <td class="firstCol tr tb">
               <b>51 </b>Предпо-<br/>лагаемые органы (и страна) транзита</td>
            <td class="green tr tb"/>
            <td class="green tr tb"/>
            <td class="green tr tb"/>
            <td class="green tr tb"/>
            <td class="green tr tb"/>
            <td class="green tr tb"/>
         </tr>
      </table>
      <table>
         <tr>
            <td class="firstCol tr tb" rowspan="2">
               <b>52 </b>Гарантия<br/>недействи-<br/>тельна для</td>
            <td class="tb green" rowspan="2" width="70%">
               <!--xsl:apply-templates select="//catESAD_ru:GuaranteeReference/catESAD_ru:LimitationNonEC/catESAD_ru:NotValid4Country" mode="commaSeparated"/-->
               <xsl:for-each select="KTDin:KTDinGoodsShipment/KTDin:Guarantee">
                  <xsl:apply-templates select="catESAD_cu:PaymentWayCode"/>
                  <xsl:apply-templates select="catESAD_cu:Amount"/>
                  <xsl:apply-templates select="catESAD_cu:DocumentNumber"/>
                  <xsl:apply-templates select="catESAD_cu:DocumentDate"/>
                  <xsl:apply-templates select="catESAD_cu:UNP"/>
                  <xsl:apply-templates select="catESAD_cu:BIC"/>
                  <br/>
               </xsl:for-each>
            </td>
            <td class="br green">Код</td>
            <td class="tr tb nowrap green" rowspan="2">
               <b>53 </b>Орган (и страна) назначения<br/>
               <!--<xsl:if test="KTDin:CustomsProcedure = 'ВТТ' or KTDin:CustomsProcedure = 'МТТ'">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DeliveryCustomsOffice/catESAD_ru:Code"/>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DeliveryCustomsOffice/catESAD_ru:OfficeName"/>
                        <xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DestinationCountryCode">
                            <br/>
                            <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DestinationCountryCode"/>
                            <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DestinationCountryName"/>
                        </xsl:if>
                    </xsl:if>-->
            </td>
         </tr>
         <tr>
            <td class="bl bb br green" style="height: 6px;"/>
         </tr>
      </table>
      <table>
         <tr>
            <td class="firstCol tr tb">
               <div style="display: inline;">
                  <b>D </b></div><br/>
               <div style="display: inline;">Печать:</div>
               <br/>
               <br/>Результат:<br/>
               <br/>
               <div style="display: inline;">Наложенные пломбы:</div>
               <div style="display: inline; margin-left:150px;">Номер:</div>
               <br/>
               <br/>Тип:<br/>
               <br/>Срок доставки (дата):<br/>
               <br/>Подпись:<br/>
            </td>
            <td class="tb tr" style="width: 30%;">
               <b>54 </b>Место и дата<br/>
               <!--xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker">
                        1) <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:CertificateNumber"/>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:IssueCertificateDate" mode="date"/>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:INNID"/>
                        <xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:KPPCode">
                            <xsl:text> / </xsl:text>
                            <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:KPPCode"/>
                        </xsl:if>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:AgreementNumber"/>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:CustomsBroker/catESAD_ru:ConclusionAgreementDate" mode="date"/>
                    </xsl:if-->
               <!--<xsl:if test="(KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:CustomsRepresCertificate) or (KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ContractRepresDecl)">
						<span class="graph">1) </span>
						<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ContractRepresDecl/cat_ru:PrDocumentName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ContractRepresDecl/cat_ru:PrDocumentNumber"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ContractRepresDecl/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
						<xsl:if test="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ContractRepresDecl">
							<br/>
							<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ContractRepresDecl/cat_ru:PrDocumentName"/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
						<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:CustomsRepresCertificate/cat_ru:PrDocumentName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:CustomsRepresCertificate/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="KTDin:KTDinGoodsShipment/KTDin:FilledPerson/KTDin:ExecutionDate"/>
						</xsl:call-template>
						
					</xsl:if>
					<br/>Подпись и фамилия лица, скорректировавшего ДТ<br/>
					<xsl:choose>
						<xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson">-->
               <span class="graph">Подпись и фамилия лица, заполнившего декларацию:</span>
               <br/>
               <xsl:for-each select="//KTDin:KDTFilledInfo/KTDin:CustomsRepresentative">
                  <!--Пункт 1)-->
                  <span class="graph">1) </span>
										Свид. о включении в Реестр таможенных представителей № <xsl:value-of select="catESAD_cu:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>;<br/>
                  <xsl:for-each select="catESAD_cu:ContractRepresDecl">
											Договор таможенного представителя с декларантом № 
											 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text> от 
											<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                  </xsl:for-each>
										; <br/>
                  <!--ИНН / КПП:
										<xsl:value-of select="cat_ru:INN"/>
										<xsl:if test="cat_ru:INN and cat_ru:KPP">/</xsl:if>
										<xsl:value-of select="cat_ru:KPP"/>-->
                  <xsl:choose>
                     <xsl:when test="catESAD_cu:RFOrganizationFeatures">
                        <xsl:for-each select="catESAD_cu:RFOrganizationFeatures">
                           <xsl:if test="cat_ru:OGRN">
                              <xsl:value-of select="cat_ru:OGRN"/>
                              <xsl:if test="cat_ru:INN">/</xsl:if>
                           </xsl:if>
                           <xsl:if test="cat_ru:INN">
                              <xsl:value-of select="cat_ru:INN"/>
                              <xsl:if test="cat_ru:KPP">/</xsl:if>
                           </xsl:if>
                           <xsl:if test="cat_ru:KPP">
			/ <xsl:value-of select="cat_ru:KPP"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:when test="catESAD_cu:RKOrganizationFeatures">
                        <xsl:for-each select="catESAD_cu:RKOrganizationFeatures">
                           <xsl:if test="cat_ru:BIN">
                              <xsl:value-of select="cat_ru:BIN"/>
                              <xsl:if test="cat_ru:IIN">/</xsl:if>
                           </xsl:if>
                           <xsl:if test="cat_ru:IIN">
                              <xsl:value-of select="cat_ru:IIN"/>
                              <xsl:if test="cat_ru:ITN">/</xsl:if>
                           </xsl:if>
                           <xsl:for-each select="cat_ru:ITN">
                              <xsl:value-of select="cat_ru:CategoryCode"/>/
         <xsl:value-of select="cat_ru:KATOCode"/>/
         <xsl:value-of select="cat_ru:RNN"/>
                              <xsl:if test="cat_ru:ITNReserv">
            /<xsl:value-of select="cat_ru:ITNReserv"/>
                              </xsl:if>
                           </xsl:for-each>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:when test="catESAD_cu:RBOrganizationFeatures">
                        <xsl:for-each select="catESAD_cu:RBOrganizationFeatures">
                           <xsl:if test="cat_ru:UNP">
                              <xsl:value-of select="cat_ru:UNP"/>
                              <xsl:if test="cat_ru:RBIdentificationNumber">/</xsl:if>
                           </xsl:if>
                           <xsl:if test="cat_ru:RBIdentificationNumber">
                              <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
                           </xsl:if>
                        </xsl:for-each>
                     </xsl:when>
                  </xsl:choose>
                  <br/>
               </xsl:for-each>
               <!--2)
                            <xsl:value-of select="				KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/cat_ru:PersonSurname"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/cat_ru:PersonName"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/cat_ru:PersonMiddleName"/>
							<xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:IdentityCard">
								<br/>
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardName"/>
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardSeries"/>
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardNumber"/>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:IdentityCard/cat_ru:IdentityCardDate"/>
								</xsl:call-template>
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:IdentityCard/cat_ru:OrganizationName"/>
							</xsl:if>
							<xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/cat_ru:PersonPost">
								<br/>
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/cat_ru:PersonPost"/>
							</xsl:if>
							<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_ru:Contact/cat_ru:Phone"/>
							<xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument">
								<br/>-->
               <xsl:for-each select="//KTDin:KDTFilledInfo/KTDin:FilledPerson">
                  <!--Пункт 2)-->
                  <span class="graph">2)</span>
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
                  <br/>
                  <xsl:for-each select="catESAD_cu:IdentityCard">
                     <xsl:value-of select="cat_ru:IdentityCardName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:IdentityCardSeries"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                     <xsl:text> </xsl:text>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
                     </xsl:call-template>
                     <xsl:value-of select="cat_ru:OrganizationName"/>
                     <br/>
                  </xsl:for-each>
                  <xsl:if test="cat_ru:PersonPost">
                     <xsl:value-of select="cat_ru:PersonPost"/>
                     <br/>
                  </xsl:if>
                  <xsl:for-each select="catESAD_cu:Contact">
											Телефон <xsl:value-of select="cat_ru:Phone"/>
                     <br/>
                  </xsl:for-each>
                  <!-- 3)
                                <xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
									<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>
								</xsl:if>
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
								<xsl:if test="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/KTDin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:when>
					</xsl:choose>-->
                  <!--Графа 3)-->
                  <xsl:for-each select="catESAD_cu:AuthoritesDocument">
                     <span class="graph">3)</span>
                     <xsl:if test="cat_ru:PrDocumentName">
                        <xsl:value-of select="cat_ru:PrDocumentName"/>, 
											</xsl:if>
                     <xsl:value-of select="cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="cat_ru:PrDocumentDate">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="cat_ru:ComplationAuthorityDate">
                        <span class="graph">до </span>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <br/>
                  </xsl:for-each>
               </xsl:for-each>
               <!--Графа 4)-->
               <xsl:if test="//KTDin:RegNumberDoc">
                  <span class="graph">4)  Исходящий номер регистрации документов</span>
                  <br/>
                  <xsl:value-of select="//KTDin:RegNumberDoc"/>
                  <xsl:text> </xsl:text>
                  <br/>
               </xsl:if>
               <xsl:if test="//KTDin:SecurityLabelCode">
                  <xsl:value-of select="//KTDin:SecurityLabelCode"/>
                  <br/>
               </xsl:if>
               <span class="graph">Подпись и фамилия лица заполневшего КДТ</span>
               <br/>
              <!-- <xsl:for-each select="//KTDin:KTDinDeclarant/KTDin:ESADFilledPerson">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
                  <xsl:text> </xsl:text>
                  <br/>
                  <xsl:for-each select="catESAD_cu:IdentityCard">
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:IdentityCardName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:IdentityCardSeries"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:IdentityCardNumber"/>
                     <xsl:text> </xsl:text>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
                     </xsl:call-template>
                     <xsl:value-of select="cat_ru:OrganizationName"/>
                     <br/>
                  </xsl:for-each>
                  <xsl:if test="cat_ru:PersonPost">
                     <xsl:value-of select="cat_ru:PersonPost"/>
                     <br/>
                  </xsl:if>
                  <xsl:for-each select="catESAD_cu:Contact">
											Телефон <xsl:value-of select="cat_ru:Phone"/>
                     <br/>
                  </xsl:for-each>
                  <xsl:for-each select="catESAD_cu:AuthoritesDocument">
                     <xsl:if test="cat_ru:PrDocumentName">
                        <xsl:value-of select="cat_ru:PrDocumentName"/>, 
											</xsl:if>
                     <xsl:value-of select="cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="cat_ru:PrDocumentDate">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="cat_ru:ComplationAuthorityDate">
                        <span class="graph">до </span>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:ComplationAuthorityDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <br/>
                  </xsl:for-each>
               </xsl:for-each>-->
               <p align="right">
               <xsl:if test="KTDin:ExecutionDate">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="//KTDin:ExecutionDate"/>
                  </xsl:call-template></xsl:if>
               </p>
               <br/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Перегрузки-->
   <!--<xsl:template match="KTDin:KTDinReloadingInfo">
        <table>
            <tr>
                <td class="firstCol tr tb" rowspan="4">
                    <b>55 </b> Пере-<br/>грузки</td>
                <td colspan="3" class="tr tb">
                    Место и страна:
                    <xsl:apply-templates select="catESAD_ru:ReloadCountryCode"/>
                    <xsl:apply-templates select="catESAD_ru:ReloadCountryName"/>
                    <xsl:apply-templates select="catESAD_ru:ReloadingCustomsOffice/cat_ru:Code"/>
                    <xsl:apply-templates select="catESAD_ru:ReloadingCustomsOffice/cat_ru:OfficeName"/>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="tb tr">
                    Идентификация и страна регистрации нового транспортного средства:
                    <xsl:apply-templates select="catESAD_ru:ReloadingTransportMeans/catESAD_ru:TransportModeCode"/>
                    <xsl:apply-templates select="catESAD_ru:ReloadingTransportMeans/catESAD_ru:TransportIdentifier"/>
                    <xsl:if test="catESAD_ru:ReloadingTransportMeans/catESAD_ru:TrailerIdentifier">
                        <xsl:text> / </xsl:text>
                        <xsl:apply-templates select="catESAD_ru:ReloadingTransportMeans/catESAD_ru:TrailerIdentifier"/>
                    </xsl:if>
                    <xsl:if test="catESAD_ru:ReloadingTransportMeans/catESAD_ru:SecondTrailerIdentifier">
                        <xsl:text> / </xsl:text>
                        <xsl:apply-templates select="catESAD_ru:ReloadingTransportMeans/catESAD_ru:SecondTrailerIdentifier"/>
                    </xsl:if>
                    <xsl:apply-templates select="catESAD_ru:ReloadingTransportMeans/catESAD_ru:TransportMeansNationalityCode"/>
                </td>
            </tr>
            <tr>
                <td class="tb tr">Конт=</td>
                <td align="center" class="tb tr">
                    <xsl:apply-templates select="catESAD_cu:ContainerIndicator" mode="indicator"/>
                </td>
                <td class="tb tr">
                    <xsl:text>(1) Номер нового контейнера</xsl:text>
                    <xsl:apply-templates select="catESAD_ru:ReloadContainer/catESAD_ru:ContainerNumber"/>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="tb tr">(1) Указывается 1, если ДА или 0, если НЕТ</td>
            </tr>
        </table>
    </xsl:template>-->
   <!--ТД3, гр. 47 - Исчисление платежей, подробности подсчёта-->
   <xsl:template name="td3section47">
      <table>
         <tr>
            <td class="firstCol tr tb">
               <b>47 </b>Исчисле-<br/>ние платежей</td>
            <td class="nopadding tb" style="width: 45%;">
               <xsl:apply-templates mode="payments" select="//KTDin:KTDinGoods[position() = 1]"/>
            </td>
            <td class="tl tb tr nopadding">
               <table style="height: 100%">
                  <tr>
                     <td class="tb tr" style="width: 50%; min-height: 15pt;">
                        <b>48 </b> Отсрочка платежей
                                <xsl:for-each select="//KTDin:CUDelayPayments">
                           <br/>
                           <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates select="catESAD_cu:DelayDocumentNumber"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates mode="date" select="catESAD_cu:DelayDocumentDate"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates mode="date" select="catESAD_cu:DelayDate "/>
                           <!--xsl:apply-templates select="catESAD_ru:DelayDocumentNumber"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="catESAD_ru:DelayPremitDate" mode="date"/>
                                    <xsl:text> / </xsl:text>
                                    <xsl:apply-templates select="catESAD_ru:DelayPaymentDate " mode="date"/-->
                        </xsl:for-each>
                     </td>
                     <td class="tb">
                        <b>49 </b>Реквизиты склада</td>
                  </tr>
               </table>
               <xsl:call-template name="PaymentDetails"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="*" mode="indicator">
      <xsl:choose>
         <xsl:when test=". = 1  or . = 't'  or . = 'true'">1</xsl:when>
         <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="KTDin:TransportMeans">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="catESAD_ru:TransportIdentifier"/>
      <xsl:if test="catESAD_ru:TrailerIdentifier">
         <xsl:text> / </xsl:text>
         <xsl:apply-templates select="catESAD_ru:TrailerIdentifier"/>
      </xsl:if>
      <xsl:if test="catESAD_ru:SecondTrailerIdentifier">
         <xsl:text> / </xsl:text>
         <xsl:apply-templates select="catESAD_ru:SecondTrailerIdentifier"/>
      </xsl:if>
   </xsl:template>
   <!--Номер в стандартной записи для таможенного документа-->
   <xsl:template match="*" mode="numberGTD">
      <xsl:apply-templates select="cat_ru:CustomsCode"/>
      <xsl:text> / </xsl:text>
      <xsl:call-template name="russian_date_gtd">
         <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
      </xsl:call-template>
      <xsl:text> / </xsl:text>
      <xsl:apply-templates select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template name="td3Header">
      <table>
         <tr>
            <td class="graphMain" colspan="3"/>
            <td class="tl">А </td>
         </tr>
         <tr>
            <td class="graphMain" colspan="2">ФОРМА КОРРЕКТИРОВКИ ТАМОЖЕННОЙ ДЕКЛАРАЦИИ (КТД1)</td>
            <td class="bl bt br">
               <b>1 </b> ДЕКЛАРАЦИЯ</td>
            <td rowspan="4">
               <xsl:apply-templates mode="numberGTD" select="KTDin:GTDNumber"/>
            </td>
         </tr>
         <tr>
            <td align="center" class="b firstCol">
               <b>1</b>
            </td>
            <td class="t green" rowspan="3">
               <b>2</b>
               <xsl:text> Отправитель / </xsl:text>
               <i>Экспортёр</i>
               <div style="display: inline; padding-left: 40px;">
                        № <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsignor"/>
            </td>
            <td class="bl bb br green nopadding">
               <table style="height: 100%;">
                  <tr>
                     <td class="tr" style="width: 30px; text-align: center;">
                        <!--<xsl:apply-templates select="KTDin:TransitDirectionCode"/>-->
                        <xsl:value-of select="KTDin:CustomsProcedure"/>
                     </td>
                     <td class="tr" style="text-align: center;">
                        <xsl:apply-templates select="KTDin:CustomsModeCode"/>
                     </td>
                     <td style="text-align: center;">
                        <xsl:apply-templates select="KTDin:ElectronicDocumentSign"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="b" rowspan="9"/>
            <td class="tr green nopadding">
               <table style="height: 100%; width:40mm;">
                  <tr>
                     <td class="tr" colspan="2" style="width:22mm;">
                        <b>3</b> Формы</td>
                     <td style="width: 1%; white-space: nowrap;">
                        <b>4</b> Отгр. спец.</td>
                  </tr>
                  <tr>
                     <td class="tr" style="width:10mm;"/>
                     <td align="center" class="tr" style="width:12mm;">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:TotalSheetNumber"/>
                     </td>
                     <td align="center">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:SpecificationNumber"/>
                        <xsl:if test="KTDin:KTDinGoodsShipment/catESAD_cu:SpecificationListNumber">
                           <xsl:text> / </xsl:text>
                           <xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:SpecificationListNumber"/>
                        </xsl:if>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="t nopadding" colspan="2">
               <table style="height: 100%;">
                  <tr>
                     <td class="tr green" style="width: 20%;">
                        <b>5 </b> Всего т-ов</td>
                     <td class="tr green" style="width: 20%;">
                        <b>6 </b> Всего мест</td>
                     <td>
                        <b>7 </b> Справочный номер</td>
                  </tr>
                  <tr>
                     <td class="tr green">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:TotalGoodsNumber"/>
                     </td>
                     <td class="tr green">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:TotalPackageNumber"/>
                     </td>
                     <td>
                        <xsl:apply-templates select="KTDin:DeclarationKind"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green" rowspan="2">
               <b>8 </b> Получатель
                    <div style="display: inline; padding-left: 95px;">
                        № <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsignee/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsignee"/>
            </td>
            <td class="tl tr" colspan="2">
               <b>9 </b> Лицо, ответственное за финансовое урегулирование
                    <div style="display: inline; padding-left: 40px;">
                        № <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinFinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="KTDin:KTDinGoodsShipment/KTDin:KTDinFinancialAdjustingResponsiblePerson"/>
            </td>
         </tr>
         <tr>
            <td class="nopadding tr tt tl" colspan="2">
               <table style="height: 100%;">
                  <tr>
                     <td class="tl tr" colspan="2">
                        <b>10 </b>
                       Стр. первого<br/> назн./послед.отправл.
                     </td>
                     <td class="bl tr" colspan="2">
                        <b>11 </b>
                        Торг. страна
                     </td>
                     <td class="tr">
                        <b>12 </b> Общая таможенная стоимость</td>
                     <td class="tb" rowspan="2">
                        <b>13 </b>
                        <!--i>ЕСП</i-->
                     </td>
                  </tr>
                  <tr>
                     <td class="tl bb br" style="width: 20px;"/>
                     <td class="tb"/>
                     <td align="center" class="bl bb br" style="width: 20px;">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:TradeCountryCode"/>
                     </td>
                     <td class="tb tr">
                        <!--xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinMainContractTerms/catESAD_cu:TradeCountryCode"/-->
                     </td>
                     <td class="tb tr">
                     <table>
						<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 1.5pt black;" align="center" width="50%">
								<!--<xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:TotalCustCost"/>-->
							</td>
							<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 0pt black;" align="center">
								<xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:PreviousTotalCustomsAmount"/>
							</td>
					</table>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="tt tr tb" rowspan="2">
               <b>14 </b> Декларант/Представитель
                    <div style="display: inline; padding-left: 35px;">
                        № <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               </div>
               <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
               <br/>
               <xsl:apply-templates mode="org" select="KTDin:KTDinGoodsShipment/KTDin:KTDinDeclarant"/>
            </td>
            <td class="tb tr nopadding" colspan="2">
               <table style="height: 100%;">
                  <tr>
                     <td class="tr green">
                        <b>15 </b> Страна отправления
								<br/>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DispatchCountryName"/>
                     </td>
                     <td class="tr">
                        <b>15 </b> Код страны отпр.
								<br/>
                        <span style="border-right:solid 0.5pt #000000">
                                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>a<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>  
                                </span>
                        <span style="border-right:solid 1pt #000000">
                                     
								<xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DispatchCountryCode"/>
								      
                                </span>
                        <span style="border-right:solid 0.5pt #000000">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>b<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </span>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td>
                        <b>17 </b> Код страны назнач.<br/>
                        <span style="border-right:solid 0.5pt #000000">
                                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>a<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>  
                                </span>
                        <span style="border-right:solid 1pt #000000">
                                     
								<xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DestinationCountryCode"/>
								      
                                </span>
                        <span style="border-right:solid 0.5pt #000000">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>b<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </span>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="tr tb">
               <b>16 </b> Страна происхождения<br/>
               <xsl:apply-templates select="KTDin:KTDinGoodsShipment/catESAD_cu:OriginCountryName"/>
            </td>
            <td class="green tr tb">
               <b>17 </b> Страна назначения<br/>
               <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:DestinationCountryName"/>
            </td>
         </tr>
         <tr>
            <td class="nopadding tr" colspan="3">
               <table style="height: 100%;">
                  <tr>
                     <td class="br green" colspan="2">
                        <b>18 </b>Идентификация и страна регистрации трансп. средства при отправлении</td>
                     <td class="br green nowrap">
                        <b>19 </b>Конт.</td>
                     <td class="tr tr" colspan="3" style="width: 50%;">
                        <b>20 </b> Условия поставки</td>
                  </tr>
                  <tr>
                     <td class="tb br green">
                        <xsl:apply-templates mode="transport" select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport"/>
                        <xsl:choose>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport/KTDin:MethodTransport=1"> газопровод</xsl:when>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport/KTDin:MethodTransport=2"> нефтепровод</xsl:when>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport/KTDin:MethodTransport=3"> нефтепродуктопровод</xsl:when>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport/KTDin:MethodTransport=4"> линия электропередач</xsl:when>
                        </xsl:choose>
                     </td>
                     <td align="center" class="bb br green">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport/cat_ru:TransportNationalityCode"/>
                     </td>
                     <td class="bb br green">
                        <xsl:apply-templates mode="indicator" select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:ContainerIndicator"/>
                     </td>
                     <td align="center" class="bb br"/>
                     <td class="tb br">
                        <xsl:choose>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode!=''">
                              <xsl:value-of select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                           </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace!=''">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:for-each select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td class="bb tr"/>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="nopadding tb tr" colspan="3">
               <table style="height: 100%;">
                  <tr>
                     <td class="br green" colspan="2">
                        <b>21 </b> Идентификация и страна регистрации трансп. средства при прибытии</td>
                     <td class="tr" colspan="2">
                        <b>22 </b> Валюта и общая фактурная стоимость</td>
                     <td class="br">
                        <b>23 </b> Курс валюты
                                <br/>
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:ContractCurrencyRate"/>
                     </td>
                     <td colspan="4">
                        <b>24 </b> Характер сделки</td>
                  </tr>
                  <tr>
                     <td class="green br">
                        <xsl:apply-templates mode="transport" select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans"/>
                        <xsl:choose>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans/KTDin:MethodTransport=1"> газопровод</xsl:when>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans/KTDin:MethodTransport=2"> нефтепровод</xsl:when>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans/KTDin:MethodTransport=3"> нефтепродуктопровод</xsl:when>
                           <xsl:when test="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans/KTDin:MethodTransport=4"> линия электропередач</xsl:when>
                        </xsl:choose>
                     </td>
                     <td align="center" class="green tb br">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans/cat_ru:TransportNationalityCode"/>
                     </td>
                     <td align="center" class="tb br">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:ContractCurrencyCode"/>
                     </td>
                     <td align="center" class="tr">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:TotalInvoiceAmount"/>
                     </td>
                     <td class="br">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:ContractCurrencyRate"/>
                     </td>
                     <td class="tb tr">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:DealNatureCode"/>
                        <!--xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:DealFeatureCode"/-->
                     </td>
                     <td class="tb br">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:DealFeatureCode"/>
                        <!--xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinMainContractTerms/catESAD_cu:DealNatureCode"/-->
                     </td>
                     <td>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="t nopadding">
               <table style="height: 100%;">
                  <tr>
                     <td class="green br" colspan="2">
                        <b>25 </b> Вид транспорта</td>
                     <td class="tr" colspan="2">
                        <b>26 </b> Вид транспорта</td>
                     <td class="green" rowspan="2">
                        <b>27 </b>Место погрузки</td>
                  </tr>
                  <tr>
                     <td class="green"/>
                     <td align="right" class="green br">на границе</td>
                     <td/>
                     <td align="right" class="tr">внутри страны</td>
                  </tr>
                  <tr>
                     <td align="center" class="tb br green">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinBorderTransportMeans/cat_ru:TransportModeCode"/>
                     </td>
                     <td class="br green"/>
                     <td align="center" class="tb br">
                        <xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinDepartureArrivalTransport/cat_ru:TransportModeCode"/>
                     </td>
                     <td class="tr"/>
                     <td class="green">
                        <!--xsl:apply-templates select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/KTDin:KTDinLoadingPlace"/-->
                     </td>
                  </tr>
               </table>
            </td>
            <td class="t" colspan="2" rowspan="2">
               <b>28</b>
                    Финансовые и банковские сведения
                    <br/>
            </td>
         </tr>
         <tr>
            <td align="center" class="b" style="vertical-align: middle;">
               <!--b>1</b-->
            </td>
            <td class="t nopadding">
               <table style="height: 100%;">
                  <tr>
                     <td class="tr">
                        <b>29 </b> Орган въезда/выезда
                                <br/>
                        <xsl:for-each select="KTDin:KTDinGoodsShipment/KTDin:KTDinConsigment/catESAD_cu:BorderCustomsOffice">
                           <xsl:if test="position() > 1">
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:apply-templates select="cat_ru:CustomsCountryCode"/>
                           <xsl:apply-templates select="cat_ru:Code"/>
                        </xsl:for-each>
                     </td>
                     <td>
                        <b>30 </b> Местонахождение товаров
                                <br/>
                        <xsl:for-each select="KTDin:KTDinGoodsShipment/KTDin:KTDinGoodsLocation">
                           <xsl:apply-templates select="."/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Местонахождение товаров-->
   <xsl:template match="KTDin:KTDinGoodsLocation">
      <xsl:apply-templates select="catESAD_cu:InformationTypeCode"/>
      <xsl:if test="KTDin:CustomsOffice">
         <xsl:apply-templates select="KTDin:CustomsOffice"/>
      </xsl:if>
      <xsl:if test="KTDin:CustomsCountryCode">
         <xsl:apply-templates select="KTDin:CustomsCountryCode"/>
      </xsl:if>
      <xsl:if test="KTDin:Address">
         <br/>
         <xsl:apply-templates select="KTDin:Address/cat_ru:PostalCode"/> 
			<xsl:apply-templates select="KTDin:Address/cat_ru:CountryCode"/> 
			<xsl:apply-templates select="KTDin:Address/cat_ru:CounryName"/> 
			<xsl:apply-templates select="KTDin:Address/cat_ru:Region"/> 
			<xsl:apply-templates select="KTDin:Address/cat_ru:City"/> 
			<xsl:apply-templates select="KTDin:Address/cat_ru:StreetHouse"/> 
		</xsl:if>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="KTDin:LocationName">
         <xsl:value-of select="KTDin:LocationName"/>,
			</xsl:if>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="KTDin:GoodsLocationWarehouse">
         <xsl:value-of select="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:if test="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentDate">
			от<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:apply-templates mode="date" select="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
         </xsl:if>
         <xsl:choose>
            <xsl:when test="KTDin:GoodsLocationPlace">
               <!-- pdp-->
					N<xsl:if test="KTDin:GoodsLocationPlace/catESAD_cu:NumberCustomsZone">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="KTDin:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <!--xsl:choose>
            <xsl:when test="catESAD_ru:GoodsLocationWarehouse">
                <xsl:apply-templates select="catESAD_ru:GoodsLocationWarehouse/catESAD_cu:DocumentModeCode"/>
                <xsl:apply-templates select="catESAD_ru:GoodsLocationWarehouse/catESAD_ru:CertificateNumber"/>
            </xsl:when>
            <xsl:when test="catESAD_ru:GoodsLocationPlace">
                <xsl:apply-templates select="catESAD_ru:GoodsLocationPlace/catESAD_ru:GoodsLocationPlaceDesc"/>
			
                <xsl:if test="catESAD_ru:GoodsLocationPlace/catESAD_ru:RailwayStationCode">
                    <xsl:apply-templates select="catESAD_ru:GoodsLocationPlace/catESAD_ru:RailwayStationCode"/>
                </xsl:if>
                <xsl:if test="catESAD_ru:GoodsLocationPlace/catESAD_ru:RailwayStationName">
                    <xsl:apply-templates select="catESAD_ru:GoodsLocationPlace/catESAD_ru:RailwayStationName"/>
                </xsl:if>
              
            </xsl:when>
            <xsl:when test="catESAD_cu:Transport"
        </xsl:choose-->
         <!--<xsl:if test="KTDin:GoodsLocationWarehouse">
			<xsl:choose>
				<xsl:when test="KTDin:GoodsLocationWarehouse">
					<xsl:value-of select="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:value-of select="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:value-of select="KTDin:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="KTDin:GoodsLocationPlace">
			<xsl:choose>
				<xsl:when test="KTDin:GoodsLocationPlace">
					<xsl:value-of select="KTDin:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="KTDin:Transport">
			<xsl:choose>
				<xsl:when test="(number(KTDin:Transport/catESAD_cu:TransporKind)=1) or (KTDin:Transport/catESAD_cu:TransporKind='true') or (KTDin:Transport/catESAD_cu:TransporKind='t')">Ж/Д:</xsl:when>
				<xsl:otherwise>АВТО:</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="KTDin:Transport/catESAD_cu:TransporIdentifier">
				<xsl:value-of select="."/>, 
					</xsl:for-each>-->
      </xsl:if>
      <xsl:if test="KTDin:Transport">, <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="KTDin:Transport/catESAD_cu:TransporKind"/>:<xsl:for-each select="KTDin:Transport/catESAD_cu:TransporIdentifier">
            <xsl:value-of select="."/>
            <xsl:if test="position()!=last()">;</xsl:if>
         </xsl:for-each>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template name="automobile">
      <h1>Данные по транспортным средствам</h1>
      <table class="addInfo">
         <tr>
            <th>№<br/>товара</th>
            <th>Марка /<br/>Модель</th>
            <th style="width: 1%;">Год<br/>изготовления</th>
            <th style="width: 1%;">Рабочий объем двигателя, куб. см</th>
            <th>Идентиф-й<br/>№ кузова</th>
            <th>Двигатель</th>
            <th>Идентиф-й № шасси (рамы)</th>
            <th>№ удостоверения</th>
            <th>Стоимость</th>
            <th>Грузоподъемность/<br/>Мощность</th>
            <th>Пробег</th>
         </tr>
         <xsl:apply-templates select="//KTDin:KTDinAutomobile"/>
      </table>
   </xsl:template>
   <xsl:template match="KTDin:KTDinAutomobile">
      <tr>
         <td>
            <xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:Model"/>
            <xsl:text> / </xsl:text>
            <xsl:apply-templates select="cat_ru:Mark"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:OfftakeYear"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:EngineVolumeQuanity"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:Mark"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:EngineID"/>
         </td>
         <td>
            <xsl:apply-templates select="cat_ru:ChassisID"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:IdentityCardNumber"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:CarCost"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:PowerWeightQuanity"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:PassedKilometerQuantity"/>
         </td>
      </tr>
   </xsl:template>
   <!--Служебные отметки по ДТ2-->
   <xsl:template match="KTDin:KTDinCommonOfficialMark">
      <h1>Служебные отметки по КТД</h1>
      <table class="addInfo">
         <tr>
            <th>Номер графы</th>
            <th>Код типа инф-и</th>
            <th>Служебная запись / номер документа</th>
            <th>Время</th>
            <th>ФИО инспектора</th>
            <th>ЛНП</th>
         </tr>
         <tr>
            <td>
               <xsl:apply-templates select="catESAD_ru:GRNumber"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:InformationTypeCode"/>
            </td>
            <td>
               <xsl:if test="KTDin:SolutionNumber">
                  <xsl:value-of select="KTDin:SolutionNumber/cat_ru:CustomsCode"/>/
					 <xsl:call-template name="russian_date2">
                     <xsl:with-param name="dateIn" select="KTDin:SolutionNumber/cat_ru:RegistrationDate"/>
                  </xsl:call-template>/
                 <xsl:value-of select="KTDin:SolutionNumber/cat_ru:GTDNumber"/>/                 
                 <xsl:value-of select="KTDin:SolutionNumber/catESAD_ru:Code"/>/
                 <xsl:value-of select="KTDin:SolutionNumber/catESAD_ru:SolutionInformation"/>
                  <br/>
               </xsl:if>
               <xsl:apply-templates select="catESAD_ru:MarkDescription"/>
            </td>
            <td>
               <xsl:apply-templates mode="time" select="catESAD_ru:TimeInf"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:PersonName"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:LNP"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Товар-->
   <xsl:template match="KTDin:KTDinGoods">
      <table>
         <tr>
            <td class="tr tb firstCol" rowspan="4">
               <b>31</b> Грузовые места и описание товаров</td>
            <td class="green">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</td>
            <td class="green tr tb  bl nopadding">
               <b>32 </b> Товар
						<br/>
               <span style="border-right:solid 1pt #000000">  №<xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>  </span>
							  <xsl:value-of select="catESAD_cu:GoodFeatures"/>
            </td>
            <td class="tb tr green">
               <b>33 </b> Код товара<br/>
               <xsl:value-of select="substring(catESAD_cu:GoodsTNVEDCode, 1, 6)"/>
            </td>
            <td class="nopadding tb tr" colspan="2" style="vertical-align: bottom;">
               <table>
                  <tr>
                     <td class="tr"/>
                     <td/>
                  </tr>
                  <tr>
                     <td align="center" class="tr">
                        <xsl:apply-templates select="catESAD_cu:AdditionalSign"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="catESAD_cu:IntellectPropertySign"/>
                     </td>
                     <td align="center">
                        <xsl:apply-templates select="catESAD_cu:GoodsClassificationCode"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green tb" colspan="2" rowspan="3">
               <b>1) </b>
               <xsl:for-each select="catESAD_cu:GoodsDescription">
                  <xsl:apply-templates select="."/>
               </xsl:for-each>
               <xsl:for-each select="KTDin:ElectricalEnergReceived">
                  <!--xsl:apply-templates select="catESAD_ru:TariffZoneName"/>
                  <xsl:apply-templates select="catESAD_ru:TextID"/>
                  <xsl:if test="catESAD_ru:Description">
                     <xsl:text>/</xsl:text>
                     <xsl:apply-templates select="catESAD_ru:Description"/>
                  </xsl:if-->
                  <xsl:apply-templates select="catESAD_cu:ElectricalEnergyQuantity"/>
                  <xsl:if test="catESAD_cu:QualifierCode">
                     <xsl:apply-templates select="catESAD_cu:QualifierCode"/>
                  </xsl:if>
                  <!--xsl:if test="catESAD_ru:QualifierName">
                     <xsl:text>/</xsl:text>
                     <xsl:apply-templates select="catESAD_ru:QualifierName"/>
                  </xsl:if-->
                  <xsl:text>, </xsl:text>
               </xsl:for-each>
               <xsl:for-each select="KTDin:ElectricalEnergGiven">
               	  <xsl:apply-templates select="catESAD_cu:ElectricalEnergyQuantity"/>
                  <xsl:if test="catESAD_cu:QualifierCode">
                     <xsl:apply-templates select="catESAD_cu:QualifierCode"/>
                  </xsl:if>
                  <xsl:text>, </xsl:text>
               </xsl:for-each>
               <xsl:for-each select="catESAD_cu:GoodsGroupDescription">
                  <br/>
                  <xsl:for-each select="catESAD_cu:GoodsDescription">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                            Производитель
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                            Тов.знак
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <!--xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                            Катег.прод.
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each-->
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                            Марка
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                            Артикул
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                            Стандарт
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                            Сорт
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                            Наим.сортимента
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                            Порода древесины
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                            Размеры
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                     <xsl:apply-templates select="."/>
                  </xsl:for-each>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                            Кол-во
                        </xsl:if>
                  <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                     <xsl:apply-templates select="."/>
                     <xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
                     <xsl:if test="cat_ru:MeasureUnitQualifierCode">
                                (
                                <xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>)
                            </xsl:if>
                  </xsl:for-each>
                  <br/>
                  <xsl:if test="catESAD_cu:OilField"> Месторождения товара:
							<xsl:value-of select="catESAD_cu:OilField"/>
                  </xsl:if>
               </xsl:for-each>
               <xsl:if test="catESAD_cu:OriginCountryName">
                  <br/>
                  <xsl:apply-templates select="catESAD_cu:OriginCountryName"/>
               </xsl:if>
               <xsl:if test="KTDin:SupplementaryGoodsQuantity">
                  <br/>
                  <xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                  <xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                  <xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
               </xsl:if>
               <xsl:for-each select="KTDin:SupplementaryGoodsQuantity1">
                  <br/>
                  <xsl:apply-templates select="cat_ru:GoodsQuantity"/>
                  <xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
                  <xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
               </xsl:for-each>
               <xsl:if test="(catESAD_cu:BeginPeriodDate!='') or (catESAD_cu:EndPeriodDate!='')">
                  <br/>
                  <xsl:if test="catESAD_cu:BeginPeriodDate">
                     <b>Начало периода </b>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="catESAD_cu:BeginPeriodDate"/>
                     </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:EndPeriodDate">
                     <b>Окончание периода </b>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="catESAD_cu:EndPeriodDate"/>
                     </xsl:call-template>
                  </xsl:if>
               </xsl:if>
				<xsl:if test="catESAD_cu:IPObjectRegistryNum">
					<xsl:if test="count(catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']) &gt; 0">
						<br/>
						<span class="graph">Единый ТРОИС ЕАЭС: </span>
						<xsl:for-each select="catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='1']">
							<xsl:if test="catESAD_cu:CountryCode">
								<span class="graph">(</span><xsl:value-of select="catESAD_cu:CountryCode"/><span class="graph">) </span>
							</xsl:if>
							<xsl:value-of select="catESAD_cu:IPORegistryNumber"/><xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="count(catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']) &gt; 0">
						<br/>
						<span class="graph">Национальный ТРОИС: </span>
						<xsl:for-each select="catESAD_cu:IPObjectRegistryNum[catESAD_cu:DocumentModeCode='2']">
							<xsl:if test="catESAD_cu:CountryCode">
								<span class="graph">(</span><xsl:value-of select="catESAD_cu:CountryCode"/><span class="graph">) </span>
							</xsl:if>
							<xsl:value-of select="catESAD_cu:IPORegistryNumber"/><xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
               <xsl:if test="KTDin:ESADGoodsPackaging">
                  <br/>
                  <b>2) </b>
                  <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=1">
							1<xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PakageQuantity!=''">
                        <xsl:apply-templates select="KTDin:ESADGoodsPackaging/catESAD_cu:PakageQuantity"/>
                        <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                        (<xsl:apply-templates select="KTDin:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть места)
                                    </xsl:if>
                                    ,
                                </xsl:if>
                     <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                        <xsl:for-each select="KTDin:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                           <xsl:apply-templates select="catESAD_cu:PackingCode"/>
                           <xsl:if test="catESAD_cu:PakingQuantity">
                                         - 
                                        <xsl:apply-templates select="catESAD_cu:PakingQuantity"/>
                           </xsl:if>
                                    , 
                                </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PalleteInformation">
                        <xsl:for-each select="KTDin:ESADGoodsPackaging/catESAD_cu:PalleteInformation">
                           <xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
                           <xsl:if test="catESAD_cu:PalleteDescription">
                                                /<xsl:apply-templates select="catESAD_cu:PalleteDescription"/>
                           </xsl:if>
                                    , 
                                </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:UnitPackInfo">
                        <br/>2.1
                                <xsl:for-each select="KTDin:ESADGoodsPackaging/catESAD_cu:UnitPackInfo">
                           <xsl:apply-templates select="catESAD_cu:PackingCode"/>
                           <xsl:if test="catESAD_cu:PakingQuantity">
                                         - 
                                        <xsl:apply-templates select="catESAD_cu:PakingQuantity"/>
                           </xsl:if>
                                    , 
                                </xsl:for-each>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                     <br/>
                            2.1 без упаковки
                            </xsl:if>
                  <xsl:if test="KTDin:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                     <br/>
                                2.1 без упаковки/
                                <xsl:for-each select="KTDin:ESADGoodsPackaging/catESAD_cu:CargoInfo">
                        <xsl:apply-templates select="catESAD_cu:PackingCode"/>
                        <xsl:if test="catESAD_cu:PakingQuantity">
                                     - 
                                    <xsl:apply-templates select="catESAD_cu:PakingQuantity"/>
                        </xsl:if>
                        <xsl:text>, </xsl:text>
                     </xsl:for-each>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="KTDin:ESADContainer">
                  <br/>
                  <b>3) </b>
                  <xsl:apply-templates select="KTDin:ESADContainer/catESAD_cu:ContainerQuantity"/>
                  <xsl:for-each select="KTDin:ESADContainer/catESAD_cu:ContainerNumber">
                     <xsl:apply-templates select="catESAD_cu:ContainerIdentificaror"/>
                     <xsl:if test="catESAD_cu:FullIndicator='2'">
                                 часть
                            </xsl:if>
                            , 
                        </xsl:for-each>
               </xsl:if>
               <xsl:if test="KTDin:ESADExcise">
                  <br/>
                  <b>4) </b>
                  <xsl:for-each select="KTDin:ESADExcise">
                     <xsl:apply-templates select="catESAD_cu:ExciseSerieses"/>
                     <xsl:apply-templates select="catESAD_cu:ExciseFirstNumber"/>
                     <xsl:apply-templates select="catESAD_cu:ExciseLastNumber"/>
                     <xsl:apply-templates select="catESAD_cu:ExciseQuantity"/>
                            ; 
                        </xsl:for-each>
               </xsl:if>
               <xsl:if test="catESAD_cu:CUESADDeliveryTerms">
                  <br/>
                  <b>5) </b>
                  <xsl:for-each select="catESAD_cu:CUESADDeliveryTerms">
                     <xsl:apply-templates select="cat_ru:DeliveryPlace"/>
                     <xsl:apply-templates select="cat_ru:DeliveryTermsStringCode"/>
                     <xsl:apply-templates select="cat_ru:TransferPlace"/>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="KTDin:KDTinCustomsConditions">
                  <br/>
                  <b>6) </b>
                  <xsl:for-each select="KTDin:KDTinCustomsConditions">1
						<xsl:for-each select="catESAD_cu:RateOutputGoods">
						Норма:<xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                     <!--xsl:if test="catESAD_cu:ProcessingPeriod">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catESAD_cu:ProcessingPeriod"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="catESAD_cu:RateOutputGoods">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:RateOutputGoods"/>
							</xsl:if-->
                     <xsl:for-each select="catESAD_cu:ProcessingProduct">
						Продукт переработки:	
							<xsl:for-each select="catESAD_cu:GoodsDescription">
                           <xsl:value-of select="."/> 
							</xsl:for-each>
                        <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
							g<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                        </xsl:if>
                        <br/>
                     </xsl:for-each>
                     <xsl:if test="catESAD_cu:WasteProducts">
							Отходы:<xsl:for-each select="catESAD_cu:WasteProducts">
                           <xsl:for-each select="catESAD_cu:GoodsDescription">
                              <xsl:value-of select="."/> 
							</xsl:for-each>
                           <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
                              <xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                           </xsl:if>
                        </xsl:for-each>
                        <br/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:Heels">
							Остатки:<xsl:for-each select="catESAD_cu:Heels">
                           <xsl:for-each select="catESAD_cu:GoodsDescription">
                              <xsl:value-of select="."/> 
							</xsl:for-each>
                           <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
                              <xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                           </xsl:if>
                        </xsl:for-each>
                        <br/>
                     </xsl:if>
                     <xsl:for-each select="catESAD_cu:GoodsIdentificationMethod">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                     <!--xsl:apply-templates select="catESAD_cu:ProcessingDocNumber"/>
							<xsl:if test="catESAD_cu:ProcessingDocDate">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catESAD_cu:ProcessingDocDate"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="catESAD_cu:ProcessingOperationDesc">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:ProcessingOperationDesc"/>
							</xsl:if>
							<xsl:if test="catESAD_cu:GoodsIdentificationMethod">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:GoodsIdentificationMethod"/>
							</xsl:if>
							<xsl:if test="catESAD_cu:ProcessingPlace">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="catESAD_cu:ProcessingPlace"/>
							</xsl:if>
							<xsl:if test="catESAD_cu:GoodsTNVEDCode">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
							</xsl:if>
							<xsl:if test="catESAD_cu:GoodsDescription">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:GoodsDescription"/>
							</xsl:if>
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:ProcessingGoodsQuantity">
									<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
									<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
									<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="catESAD_cu:PlaceProcessing">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:PlaceProcessing">
									<xsl:apply-templates select="cat_ru:PostalCode"/>
									<xsl:apply-templates select="cat_ru:CountryCode"/>
									<xsl:apply-templates select="cat_ru:CounryName"/>
									<xsl:apply-templates select="cat_ru:Region"/>
									<xsl:apply-templates select="cat_ru:City"/>
									<xsl:apply-templates select="cat_ru:StreetHouse"/>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="catESAD_cu:Organization">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:for-each select="catESAD_cu:Organization">
									<xsl:apply-templates select="cat_ru:OrganizationName"/>
									<xsl:apply-templates select="cat_ru:ShortName"/>
									<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
									<xsl:for-each select="cat_ru:RFOrganizationFeatures">
										<xsl:apply-templates select="cat_ru:OGRN"/>
										<xsl:apply-templates select="cat_ru:INN"/>
										<xsl:apply-templates select="cat_ru:KPP"/>
									</xsl:for-each>
									<xsl:for-each select="cat_ru:Address">
										<xsl:apply-templates select="cat_ru:PostalCode"/>
										<xsl:apply-templates select="cat_ru:CountryCode"/>
										<xsl:apply-templates select="cat_ru:CounryName"/>
										<xsl:apply-templates select="cat_ru:Region"/>
										<xsl:apply-templates select="cat_ru:City"/>
										<xsl:apply-templates select="cat_ru:StreetHouse"/>
									</xsl:for-each>
									<xsl:for-each select="cat_ru:IdentityCard">
										<xsl:apply-templates select="cat_ru:IdentityCardCode"/>
										<xsl:apply-templates select="cat_ru:IdentityCardName"/>
										<xsl:apply-templates select="cat_ru:IdentityCardSeries"/>
										<xsl:apply-templates select="cat_ru:IdentityCardNumber"/>
										<xsl:apply-templates select="cat_ru:IdentityCardDate"/>
										<xsl:apply-templates select="cat_ru:OrganizationName"/>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:if-->
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="(catESAD_cu:DeliveryTime) or (catESAD_cu:DeliveryTimeEND)">
                  <br/>
                  <span class="graph">
                     <b>7) </b> Поставка в течение</span>
                  <xsl:value-of select="catESAD_cu:DeliveryTime"/>
                  <xsl:if test="catESAD_cu:DeliveryTimeEND">
								- <xsl:value-of select="catESAD_cu:DeliveryTimeEND"/>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="catESAD_cu:QuantityFact">
                  <br/>
                  <span class="graph">
                     <b>8) </b>
                  </span>
                  <xsl:value-of select="catESAD_cu:QuantityFact"/>
               </xsl:if>
               <xsl:if test="(KTDin:ElectricalEnergReceived) or (KTDin:ElectricalEnergGiven)">
                  <br/>
                  <span class="graph">
                     <b>9) </b>
                  </span>
                  <xsl:if test="KTDin:ElectricalEnergReceived">
					Электроэнергии принято:
					<xsl:for-each select="KTDin:ElectricalEnergReceived">
                        <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/>
                        <xsl:value-of select="catESAD_cu:QualifierCode"/> 
					
					</xsl:for-each>
                  </xsl:if>
                  <xsl:if test="KTDin:ElectricalEnergGiven">
					Электроэнергии передано:
					<xsl:for-each select="KTDin:ElectricalEnergGiven">
                        <xsl:value-of select="catESAD_cu:ElectricalEnergyQuantity"/>
                        <xsl:value-of select="catESAD_cu:QualifierCode"/> 
					
					</xsl:for-each>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="catESAD_cu:GoodsSTZ">
                  <br/>
                  <span class="graph">
                     <b>11) </b>
                  </span>
                  <xsl:for-each select="catESAD_cu:GoodsSTZ">
							Номер строки в гр 40 <xsl:value-of select="catESAD_cu:LineNumber"/>
                     <br/>
                     <xsl:for-each select="catESAD_cu:GoodsDescription">
                        <xsl:value-of select="."/>
                     </xsl:for-each>
							Кол-во 
						<xsl:for-each select="catESAD_cu:SupplementaryQuantity">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="cat_ru:GoodsQuantity"/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                        <xsl:if test="cat_ru:MeasureUnitQualifierCode">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
                     </xsl:for-each>
                     <xsl:for-each select="catESAD_cu:GoodsGroupDescription">
                        <br/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:for-each select="catESAD_cu:GoodsDescription">
                           <xsl:value-of select="."/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:RKTNVED">
                           <xsl:value-of select="catESAD_cu:RKTNVED"/>
                        </xsl:if>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                                Производитель
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                                Тов.знак
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:TradeMark">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <!--xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                                Катег.прод.
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:MilitaryProductCategoryCode">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each-->
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                                Торг. знак, марка
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMark">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                                Модель
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsModel">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                                Артикул
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsMarking">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                                Стандарт
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsStandard">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                                Сорт
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsSort">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                                Наим.сортимента
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodSortiment">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                                Порода древесины
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:WoodKind">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                                Размеры
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:Dimensions">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="."/>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
                                Дата выпуска
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:DateIssue">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="."/>
                           </xsl:call-template>
                        </xsl:for-each>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
                           <br/>Сериный номер:
									<xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:SerialNumber">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="."/>;
							</xsl:for-each>
                        </xsl:if>
                        <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                                Кол-во
                            </xsl:if>
                        <xsl:for-each select="catESAD_cu:GoodsGroupInformation/catESAD_cu:GoodsGroupQuantity">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:GoodsQuantity"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                           <xsl:if test="cat_ru:MeasureUnitQualifierCode">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>(
                                    <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
                                </xsl:if>
                        </xsl:for-each>
                     </xsl:for-each>
                  </xsl:for-each>
               </xsl:if>
            </td>
            <td class="nopadding bl bb br" style="vertical-align: bottom;">
               <table>
                  <tr>
                     <td class="nowrap" colspan="4">
                        <b>34 </b> Код страны происх.</td>
                  </tr>
                  <tr>
                     <td align="center" class="tr">a</td>
                     <td align="center" class="tr">
                        <xsl:apply-templates select="catESAD_cu:OriginCountryCode"/>
                     </td>
                     <td align="center" class="tr">b</td>
                     <td/>
                  </tr>
               </table>
            </td>
            <td class="nowrap tb tr green">
               <b>35 </b> Вес брутто (кг)<br/>
               <xsl:apply-templates select="catESAD_cu:GrossWeightQuantity"/>
            </td>
            <td class="nowrap tb tr">
               <b>36 </b>Преференция<br/>
               <xsl:choose>
                  <xsl:when test="catESAD_cu:Preferencii">
                     <xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:CustomsTax"/> 
					<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:CustomsDuty"/> 
					<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:Excise"/> 
					<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:Rate"/>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
               </xsl:choose>
            </td>
         </tr>
         <tr>
            <td class="bl bb br nopadding">
               <table style="height: 100%;">
                  <tr>
                     <td colspan="2">
                        <b>37 </b>Процедура</td>
                  </tr>
                  <tr>
                     <td align="center" class="tr">
                        <xsl:if test="KTDin:KTDinCustomsProcedure">
                           <xsl:apply-templates select="KTDin:KTDinCustomsProcedure/catESAD_cu:MainCustomsModeCode"/> 
									<xsl:apply-templates select="KTDin:KTDinCustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
                        </xsl:if>
                     </td>
                     <td align="center">
                        <xsl:apply-templates select="KTDin:KTDinCustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
                     </td>
                  </tr>
               </table>
            </td>
            <td class="green tb tr">
               <b>38 </b> Вес нетто (кг)<br/>
               <xsl:apply-templates select="catESAD_cu:NetWeightQuantity"/>
            </td>
            <td class="tb tr">
               <b>39 </b>
               <i>Квота</i>
               <br/>
               <xsl:apply-templates select="KTDin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/> 
					<xsl:apply-templates select="KTDin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>
            </td>
         </tr>
         <tr>
            <td class="green tl tb tr" colspan="3">
               <b>40 </b> Общая декларация / Предшествующий документ<br/>
               <xsl:for-each select="KTDin:KTDinPrecedingDocument">
                  <xsl:if test="position() > 1">
                     <br/>
                  </xsl:if>
                  <xsl:apply-templates select="catESAD_cu:PrecedingDocumentID"/>
                  <xsl:apply-templates select="catESAD_cu:PrecedingDocumentName"/>
                  <xsl:if test="catESAD_cu:PrecedingDocumentCustomsCode">
                     <xsl:apply-templates select="catESAD_cu:PrecedingDocumentCustomsCode"/>
                     <xsl:text> / </xsl:text>
                  </xsl:if>
                  <xsl:call-template name="russian_date_gtd">
                     <xsl:with-param name="dateIn" select="catESAD_cu:PrecedingDocumentDate"/>
                  </xsl:call-template>
                  <xsl:if test="catESAD_cu:AddNumberPart">
                     <xsl:text> / </xsl:text>
                     <xsl:apply-templates select="catESAD_cu:AddNumberPart"/>
                  </xsl:if>
                  <xsl:text> / </xsl:text>
                  <xsl:apply-templates select="catESAD_cu:PrecedingDocumentNumber"/>
                  <xsl:if test="catESAD_cu:PrecedingDocumentGoodsNumeric">
                     <xsl:text> / </xsl:text>
                     <xsl:apply-templates select="catESAD_cu:PrecedingDocumentGoodsNumeric"/>,
                        </xsl:if>
                  <xsl:if test="catESAD_cu:CustomsCost">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:CustomsCost"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:NetWeight">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeight"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:NetWeightQuantity">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
                  </xsl:if>
                  <xsl:if test="(catESAD_cu:NetWeightQuantity) or (catESAD_cu:SupplementaryGoodsQuantity)">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>,
								<xsl:value-of select="catESAD_cu:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                     <xsl:if test="catESAD_cu:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									(<xsl:value-of select="catESAD_cu:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
								</xsl:if>
                  </xsl:if>
                  <br/>
               </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="tr tb" rowspan="3">
               <b>44</b> Дополнит. информация/<br/> Представл. документы</td>
            <td class="tb green" colspan="2" rowspan="3">
               <xsl:if test="KTDin:KTDinPresentedDocument">
                  <!--xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:KTDinBasicPresentedDocuments">
                            <xsl:sort select="catESAD_cu:LineNumber" order="ascending"/>
                            <xsl:if test="position() > 1">
                                <br/>
                            </xsl:if>
                            <xsl:apply-templates select="catESAD_cu:LineNumber"/>
                            <xsl:if test="catESAD_ru:SubLineNumber">
                                .
                                <xsl:apply-templates select="catESAD_ru:SubLineNumber"/>
                            </xsl:if>
                            -
                            <xsl:if test="catESAD_cu:PresentedDocumentModeCode">
                                <xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode"/>
                            </xsl:if>
								<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
								<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
								<xsl:apply-templates select="cat_ru:PrDocumentName"/>
                            <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                <xsl:text> с </xsl:text>
                                <xsl:apply-templates select="catESAD_cu:DocumentBeginActionsDate" mode="date"/>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                <xsl:text> по </xsl:text>
                                <xsl:apply-templates select="catESAD_cu:DocumentEndActionsDate" mode="date"/>
                            </xsl:if>
                            <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                            <xsl:apply-templates select="catESAD_ru:ActNumber"/>
                            <xsl:apply-templates select="catESAD_ru:ActDate" mode="date"/>
                            <xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:PaymentPrivilegeDocument">
                            7.1
                            <xsl:if test="catESAD_ru:SymdolSubLineNumber">
                                .
                                <xsl:apply-templates select="catESAD_ru:SymdolSubLineNumber"/>
                            </xsl:if>
                            -
                            <xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode"/>
                            <xsl:apply-templates select="catESAD_cu:PrivelegeDocumentModeCode"/>
                            <xsl:apply-templates select="catESAD_cu:CustomsPaymentModeCodeType"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                            <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                <xsl:text> с </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                <xsl:text> по </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                            <xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:PaymentDocument">
                            <br/>
                            7.2 -
                            <xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode"/>
                            <xsl:apply-templates select="catESAD_ru:PrivelegeDocumentModeCode"/>
                            <xsl:apply-templates select="catESAD_cu:CustomsPaymentModeCodeType"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                            <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                <xsl:text> с </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                <xsl:text> по </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                            <xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:ExciseDocument">
                            <br/>
                            <xsl:if test="catESAD_ru:EGAISsign=1"> 8.1 - </xsl:if>
                            <xsl:if test="catESAD_ru:EGAISsign=2"> 8.2 - </xsl:if>
                            <xsl:apply-templates select="catESAD_cu:PresentedDocumentModeCode"/>
                            <xsl:apply-templates select="catESAD_cu:CustomsPaymentModeCodeType"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                            <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                <xsl:text> с </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                <xsl:text> по </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                            <xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:EconomicAreaDocuments">
                            <br/>
                            9.1 -
                            <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentDate"/>
                            <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                            <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                <xsl:text> с </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                <xsl:text> по </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                            <xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:WarehouseDocument">
                            <xsl:if test="catESAD_ru:SubLineNumber=2">
                                <br/>
                                9.2 -
                                <xsl:apply-templates select="catESAD_cu:DocumentModeCode"/>
                                <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                                <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
                                <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                                <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                    <xsl:text> с </xsl:text>
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                    <xsl:text> по </xsl:text>
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                                <xsl:apply-templates select="catESAD_cu:PresentingLackingDate" mode="date"/>
                                <xsl:apply-templates select="catESAD_ru:PeriodDate" mode="date"/>
                                <xsl:if test="catESAD_ru:ConditionDate">
                                    /
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_ru:ConditionDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_ru:SaleDate">
                                    /
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_ru:SaleDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:РrocessingDocument">
                            <xsl:choose>
                                <xsl:when test="catESAD_ru:SubLineNumber=3">
                                    <br/>
                                    9.3 -
                                    <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                                    <xsl:if test="cat_ru:PrDocumentDate">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:PrDocumentName">
                                        <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                        <xsl:text> с </xsl:text>
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                        <xsl:text> по </xsl:text>
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_ru:OrganizationName">
                                        <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:PresentingLackingDate">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_ru:InformationCode">
                                        <xsl:apply-templates select="catESAD_ru:InformationCode"/>
                                    </xsl:if>
                                    <xsl:if test="catESAD_ru:PeriodDate">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_ru:PeriodDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="catESAD_ru:SubLineNumber=4">
                                    <br/>
                                    9.4 -
                                    <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                                    <xsl:if test="cat_ru:PrDocumentDate">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="cat_ru:PrDocumentName">
                                        <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                        <xsl:text> с </xsl:text>
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                        <xsl:text> по </xsl:text>
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_ru:OrganizationName">
                                        <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                                    </xsl:if>
                                    <xsl:if test="catESAD_cu:PresentingLackingDate">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="catESAD_ru:InformationCode">
                                        <xsl:apply-templates select="catESAD_ru:InformationCode"/>
                                    </xsl:if>
                                    <xsl:if test="catESAD_ru:PeriodDate">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="catESAD_ru:PeriodDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:WarehouseDocument">
                            <xsl:if test="catESAD_ru:SubLineNumber=5">
                                <br/>
                                9.5 -
                                <xsl:if test="catESAD_cu:DocumentModeCode">
                                    <xsl:apply-templates select="catESAD_cu:DocumentModeCode"/>
                                </xsl:if>
                                <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                                <xsl:if test="cat_ru:PrDocumentDate">
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="cat_ru:PrDocumentName">
                                    <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                                </xsl:if>
                                <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                    <xsl:text> с </xsl:text>
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                    <xsl:text> по </xsl:text>
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_ru:OrganizationName">
                                    <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                                </xsl:if>
                                <xsl:if test="catESAD_cu:PresentingLackingDate">
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_ru:PeriodDate">
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_ru:PeriodDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_ru:ConditionDate">
                                    /
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_ru:ConditionDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="catESAD_ru:SaleDate">
                                    /
                                    <xsl:call-template name="russian_date">
                                        <xsl:with-param name="dateIn" select="catESAD_ru:SaleDate"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each-->
                  <!--xsl:for-each select="KTDin:KTDinPresentedDocument/KTDin:ReimportDocument">
                            <br/>
                            9.6 -
                            <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
                            <xsl:if test="cat_ru:PrDocumentDate">
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="cat_ru:PrDocumentName">
                                <xsl:apply-templates select="cat_ru:PrDocumentName"/>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                                <xsl:text> с </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                                <xsl:text> по </xsl:text>
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_ru:OrganizationName">
                                <xsl:apply-templates select="catESAD_ru:OrganizationName"/>
                            </xsl:if>
                            <xsl:if test="catESAD_cu:PresentingLackingDate">
                                <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="catESAD_ru:InformationCode">
                                <xsl:apply-templates select="catESAD_ru:InformationCode"/>
                            </xsl:if>
                            <xsl:if test="catESAD_ru:GoodsStatus">
                                <xsl:apply-templates select="catESAD_ru:GoodsStatus"/>
                            </xsl:if>
                            <xsl:if test="catESAD_ru:RepairStatus">
                                <xsl:apply-templates select="catESAD_ru:RepairStatus"/>
                            </xsl:if>
                        </xsl:for-each-->
                  <xsl:for-each select="KTDin:KTDinPresentedDocument">
                     <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                     <xsl:if test="catESAD_cu:ProvidingIndicationMark">
						<xsl:text>/</xsl:text>
						<xsl:value-of select="catESAD_cu:ProvidingIndicationMark"/>
                     </xsl:if>
                     <xsl:if test="cat_ru:PrDocumentDate">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:value-of select="cat_ru:PrDocumentName"/>
                     <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                     <xsl:if test="catESAD_cu:DocumentBeginActionsDate">
                        <xsl:text> с </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:DocumentBeginActionsDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:DocumentEndActionsDate">
                        <xsl:text> по </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:DocumentEndActionsDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:PresentingLackingDate">
                        <xsl:text> Обязуюсь предоставить до </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CountryCode">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CountryCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CustomsCode">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CustomsCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CustomsPaymentModeCodeType"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TemporaryImportCode">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:TemporaryImportCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TemporaryStorageImportDate">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:TemporaryStorageImportDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:SupplyStatus">
                        <xsl:text> /Опережающая поставка </xsl:text>
                        <xsl:value-of select="catESAD_cu:SupplyStatus"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:SpecialSimplifiedCode">
                        <xsl:text> /</xsl:text>
                        <xsl:value-of select="catESAD_cu:SpecialSimplifiedCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TotalDocuments">
                        <xsl:text> </xsl:text>Общее количество документов:
									<xsl:value-of select="catESAD_cu:TotalDocuments"/>
                     </xsl:if>
                     <xsl:if test="../KTDin:KDTinCustomsConditions/catESAD_cu:ProcessingPlace">
							Место переработки:<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:ProcessingPlace"/>
                     </xsl:if>
                     <xsl:if test="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing">
							Адрес переработки:<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing/cat_ru:PostalCode"/> 
							<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing/cat_ru:CountryCode"/> 
							<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing/cat_ru:CounryName"/> 
							<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing/cat_ru:Region"/> 
							<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing/cat_ru:City"/> 
							<xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:PlaceProcessing/cat_ru:StreetHouse"/> 
						</xsl:if>
                     <xsl:if test="../KTDin:KDTinCustomsConditions/catESAD_cu:Organization">
                        <xsl:apply-templates mode="org" select="../KTDin:KDTinCustomsConditions/catESAD_cu:Organization"/>
                        <br/>
                     </xsl:if>
                     <xsl:if test="../KTDin:KDTinCustomsConditions/catESAD_cu:Substitute">
							Заменители:
							<xsl:for-each select="../KTDin:KDTinCustomsConditions/catESAD_cu:Substitute">
                           <xsl:value-of select="."/> 
							</xsl:for-each>
                        <br/>
                     </xsl:if>
                     <br/>
                     <!--xsl:for-each select="../KTDin:KDTinCustomsConditions/catESAD_cu:ProcessingOperationDesc">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each-->
                     <xsl:if test="../KTDin:KDTinCustomsConditions/catESAD_cu:ProcessingDocNumber">
                        <xsl:value-of select="../KTDin:KDTinCustomsConditions/catESAD_cu:ProcessingDocNumber"/>
                     </xsl:if>
						c<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="../KTDin:KDTinCustomsConditions/catESAD_cu:ProcessingDocDate"/>
                     </xsl:call-template>
                     <br/>
                     <xsl:for-each select="../KTDin:KDTinCustomsConditions/catESAD_cu:GoodsIdentificationMethod">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                     <br/>
                  </xsl:for-each>
               </xsl:if>
            </td>
            <td class="tl tb tr">
               <b>41 </b> Дополнит.единицы<br/>
               <xsl:choose>
                  <xsl:when test="KTDin:SupplementaryGoodsQuantity">
                     <xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
							/
							<xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
							/
							<xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
                  </xsl:when>
               </xsl:choose>
            </td>
            <td class="tb tr">
               <b>42 </b>Цена товара<br/>
               <xsl:apply-templates select="catESAD_cu:InvoicedCost"/>
            </td>
            <td class="tb tr nopadding">
               <table>
                  <tr>
                     <td class="tl" colspan="2">
                        <b>43 </b> Код МОС</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <xsl:apply-templates select="KTDin:CustomsCostMethodCode"/>
                     </td>
                     <td align="center">
                        <xsl:apply-templates select="catESAD_cu:CustomsCostCorrectMethod"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="nopadding tr" colspan="3">
               <table>
                  <tr>
                     <td class="green" rowspan="2"/>
                     <td class="br green">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td>
                        <b>45 </b>Таможенная стоимость</td>
                  </tr>
                  <tr>
                     <td class="bl bb br green"><xsl:text> </xsl:text></td>
                     <td class="tb">
                     <table>
						<tr>
                        <td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 1.5pt black;width:25mm;" align="center"><!--<xsl:apply-templates select="catESAD_cu:CustomsCost"/>--></td>
						<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 0pt black;width:35mm;" align="center">
						<xsl:if test="KTDin:PreviousCustomsCost"><xsl:value-of select="KTDin:PreviousCustomsCost"/></xsl:if>
						</td>
                  </tr>
					</table>
                        
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
        
            <td class="tl tb tr">
            <b>45а</b>
            Код изменений<br/>
            <xsl:if test="KTDin:ChangeCode"> <xsl:for-each select="KTDin:ChangeCode">
								<xsl:value-of select="KTDin:PhaseChanges"/>/<xsl:value-of select="KTDin:BasisCompilation"/>/<xsl:value-of select="KTDin:QuantityChanges"/>/<xsl:value-of select="KTDin:CountryChanges"/>/<xsl:value-of select="KTDin:TNVEDChanges"/>/<xsl:value-of select="KTDin:CustCostChanges"/>/<xsl:value-of select="KTDin:CustomsPaymentChanges"/>/<xsl:value-of select="KTDin:OtherChanges"/></xsl:for-each>
			</xsl:if>
            </td>
            <td class="tl tb tr" colspan="2">
               <b>46 </b>Статистическая стоимость<br/>
               <xsl:apply-templates select="catESAD_cu:StatisticalCost"/>
               <!--xsl:apply-templates mode="indicator" select="catESAD_ru:ConformityStatCostIndicator"/-->
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Служебные отметки по товарам-->
   <xsl:template name="goodsOfficialMarks">
      <xsl:if test="//KTDin:KTDinGoodsOfficialMark">
         <h1>Служебные отметки по товарам</h1>
         <table class="addInfo">
            <tr>
               <th>№<br/>товара</th>
               <th>Код импа<br/>инф-и</th>
               <th>Служебная запись/<br/>номер документа</th>
               <th>Дата принятия решения о направлении требования / приостановлении выпуска товаров</th>
               <th>Время</th>
               <th>ФИО инспектора</th>
               <th>ЛНП</th>
               <th>Дата выполнения требований предоставления документов</th>
               <th>Время</th>
               <xsl:if test="//KTDin:KTDinGoodsOfficialMark/KTDin:Code">
                  <th>Код основания продления срока выпуска</th>
               </xsl:if>
            </tr>
            <xsl:apply-templates select="//KTDin:KTDinGoodsOfficialMark"/>
         </table>
      </xsl:if>
   </xsl:template>
   <!--Служебные отметки по товару-->
   <xsl:template match="KTDin:KTDinGoodsOfficialMark">
      <tr>
         <td>
            <!--<xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>-->
            <xsl:value-of select="../catESAD_cu:GoodsNumeric"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:InformationTypeCode"/>
         </td>
         <td>
            <xsl:if test="KTDin:SolutionNumber">
               <xsl:value-of select="KTDin:SolutionNumber/cat_ru:CustomsCode"/>/
                 <xsl:call-template name="russian_date2">
                  <xsl:with-param name="dateIn" select="KTDin:SolutionNumber/cat_ru:RegistrationDate"/>
               </xsl:call-template>/
                 <xsl:value-of select="KTDin:SolutionNumber/cat_ru:GTDNumber"/>/
                 <xsl:value-of select="KTDin:SolutionNumber/catESAD_ru:Code"/>/
                 <xsl:value-of select="KTDin:SolutionNumber/catESAD_ru:SolutionInformation"/>
               <br/>
            </xsl:if>
            <xsl:apply-templates select="catESAD_cu:MarkDescription"/>
         </td>
         <td>
            <xsl:apply-templates mode="date" select="catESAD_cu:DateInf"/>
         </td>
         <td>
            <xsl:apply-templates mode="time" select="catESAD_cu:TimeInf"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:PersonName"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:LNP"/>
         </td>
         <td>
            <xsl:apply-templates mode="date" select="catESAD_cu:ReqCompletionDate"/>
         </td>
         <td>
            <xsl:apply-templates mode="time" select="catESAD_cu:ReqCompletionTime"/>
         </td>
         <xsl:if test="//KTDin:KTDinGoodsOfficialMark/KTDin:Code">
            <td>
               <xsl:value-of select="KTDin:Code"/>
            </td>
         </xsl:if>
      </tr>
   </xsl:template>
   <!--Форматирует дату по стандартам русской локали-->
   <xsl:template match="*" mode="time">
      <xsl:value-of select="substring(., 1, 5)"/>
   </xsl:template>
   <!--Дополнительные сведения по внешнеторговым контрактам. Заполняется при подаче ВДТ-->
   <!--<xsl:template match="KTDin:KTDinGoods" mode="foreignTradeContracts">
        <h1>Данные по паспорту сделки товара № <xsl:apply-templates select="catESAD_cu:GoodsNumeric"/> (при подаче ВДТ)</h1>
        <table class="addInfo">
            <tr>
                <th>Номер паспорта сделки</th>
                <th style="width: 1%;">Номер внеш. торг. контракта</th>
                <th style="width: 1%;">Дата внеш. торг. контракта</th>
                <th style="width: 1%;">Наим-е банка, оформ-го паспорт сделки</th>
                <th>Описание поставки товаров</th>
                <th>Дополнения и приложения к основному контракту</th>
            </tr>
            <xsl:apply-templates select="KTDin:KTDinContractList"/>
        </table>
    </xsl:template>-->
   <!--Данные внешнеторгового контракта-->
   <!--<xsl:template match="KTDin:KTDinContractList">
        <tr>
            <td>
                <xsl:apply-templates select="catESAD_ru:DealPassportNumber"/>
            </td>
            <td>
                <xsl:apply-templates select="catESAD_ru:ContractNumber"/>
            </td>
            <td>
                <xsl:apply-templates select="catESAD_ru:ContractDate" mode="date"/>
            </td>
            <td>
                <xsl:apply-templates select="catESAD_ru:BankName"/>
            </td>
            <td>
                <xsl:apply-templates select="catESAD_ru:SupplyInformations"/>
            </td>
            <td>
                <xsl:apply-templates select="catESAD_ru:AdditionalContract"/>
            </td>
        </tr>
    </xsl:template>-->
   <!--Описание поставки товаров-->
   <!--<xsl:template match="catESAD_ru:SupplyInformations">
        <xsl:if test="position() > 1">
            <hr/>
        </xsl:if>
        <xsl:apply-templates mode="commaSeparated"/>
    </xsl:template>-->
   <xsl:template match="*" mode="commaSeparated">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
   </xsl:template>
   <!--Платежи по товару-->
   <xsl:template match="KTDin:KTDinGoods" mode="payments">
      <xsl:param name="GoodsNumberDescription" select="''"/>
      <table>
         <tr>
            <td class="tr tb">Вид</td>
            <td class="tr tb" colspan="2">Основа начисления</td>
            <td class="tr tb">Ставка</td>
            <td class="tr tb">Сумма</td>
            <td class="tr tb">СП</td>
            <!--<td class="tb">Предыдущая сумма</td>-->
         </tr>
         <xsl:variable name="paymentDetails" select="KTDin:KTDinCustomsPaymentCalculation"/>
         <xsl:choose>
            <xsl:when test="count($paymentDetails) > 0">
               <xsl:apply-templates select="$paymentDetails"/>
            </xsl:when>
            <xsl:otherwise>
               <tr>
                  <td class="tb tr" style="height: 8px;"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb"/>
               </tr>
               <tr>
                  <td class="tb tr" style="height: 8px;"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb tr"/>
                  <td class="tb"/>
               </tr>
            </xsl:otherwise>
         </xsl:choose>
         <tr>
            <td colspan="6">
               <xsl:text>Общая сумма, подлежащая взысканию (возврату)</xsl:text>
               <xsl:value-of select="$GoodsNumberDescription"/>
               <xsl:text>, руб.</xsl:text>
               <xsl:variable name="paymentAmounts" select="KTDin:KTDinCustomsPaymentCalculation/catESAD_cu:PaymentAmount"/>
               <xsl:variable name="paymentPrevious" select="KTDin:KTDinCustomsPaymentCalculation/KTDin:PaymentPrevious"/>
               <xsl:if test="count($paymentAmounts | $paymentPrevious) > 0">
                  <xsl:text>: </xsl:text>
                  <xsl:value-of select="sum($paymentAmounts) - sum($paymentPrevious)"/>
               </xsl:if>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="KTDin:KTDinCustomsPaymentCalculation">
      <tr>
         <td class="tr tb">
            <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
         </td>
         <td class="tr tb" colspan="2">
            <xsl:value-of select="catESAD_cu:TaxBase"/>
         </td>
         <td class="tr tb">
            <xsl:value-of select="catESAD_cu:Rate"/>
            <xsl:if test="catESAD_cu:PaymentModeCode != 10">
               <xsl:text> </xsl:text>
               <xsl:choose>
                  <xsl:when test="catESAD_cu:RateTypeCode = '*'">
                     <xsl:value-of select="catESAD_cu:RateTNVEDQualifierCode"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test="catESAD_cu:Rate">%</xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </td>
         <td class="tr tb">
            <xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
         </td>
         <td class="tr tb">
            <!--<xsl:apply-templates select="catESAD_cu:PaymentWayCode"/>-->
            <xsl:value-of select="catESAD_cu:PaymentCode"/>
         </td>
         <!--<td class="tb">
            <xsl:apply-templates select="KTDin:PaymentPrevious"/>
         </td>-->
      </tr>
   </xsl:template>
   <!--Организация (например, отправитель или получатель)-->
   <xsl:template match="*" mode="org">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="KTDin:ContractorIndicator='1'"> 'контрагент'</xsl:if>
      <xsl:if test="KTDin:ContractorIndicator='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
      <xsl:if test="cat_ru:ShortName"> (<xsl:value-of select="cat_ru:ShortName"/>)</xsl:if>
      <br/>
      <xsl:apply-templates mode="commaSeparated" select="catESAD_ru:Address/*"/>
      <xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures/cat_ru:INN | cat_ru:RFOrganizationFeatures/cat_ru:KPP">
            <br/>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
               <xsl:text> ИНН: </xsl:text>
               <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
            </xsl:if>
            <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
               <xsl:text> КПП: </xsl:text>
               <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
            </xsl:if>
         </xsl:when>
      </xsl:choose>
      <br/>
      <xsl:apply-templates select="catESAD_ru:IdentityCard"/>
      <xsl:if test="KTDin:BranchDescription">
         <br/>
         <xsl:value-of select="KTDin:BranchDescription/cat_ru:OrganizationName"/>
         <br/>
         <xsl:value-of select="KTDin:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>,
        
         <!--<xsl:value-of select="KDTout:KTDoutDeclarant/KDTout:BranchDescription/cat_ru:Address/cat_ru:CountryCode"/>,-->
         <xsl:value-of select="KTDin:BranchDescription/cat_ru:Address/cat_ru:CounryName"/> 
        <xsl:value-of select="KTDin:BranchDescription/cat_ru:Address/cat_ru:Region"/>,
        <xsl:value-of select="KTDin:BranchDescription/cat_ru:Address/cat_ru:City"/>,
        <xsl:value-of select="KTDin:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:if test="KTDin:Contact">
         <br/>
      Контактные сведения:
		<xsl:for-each select="KTDin:Contact/cat_ru:Phone">тел.:<xsl:value-of select="."/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </xsl:for-each>
         <xsl:if test="KTDin:Contact/cat_ru:Fax">факс: <xsl:value-of select="KTDin:Contact/cat_ru:Fax"/> </xsl:if>
         <xsl:if test="KTDin:Contact/cat_ru:Telex">телекс: <xsl:value-of select="KTDin:Contact/cat_ru:Telex"/> </xsl:if>
         <xsl:for-each select="KTDin:Contact/cat_ru:E_mail">эл. почта: <xsl:value-of select="."/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template match="catESAD_ru:IdentityCard">
      <xsl:apply-templates mode="commaSeparated" select="*"/>
   </xsl:template>
   <!--<xsl:template match="KTDin:KTDinLoadingPlace">
        <xsl:apply-templates select="catESAD_cu:InformationTypeCode"/>
        <xsl:text> </xsl:text>
        <xsl:if test="catESAD_cu:InformationTypeCode = 31">
            <xsl:text>Склад получателя </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="catESAD_ru:LoadingPlaceWarehouse">
        <xsl:apply-templates select="catESAD_ru:CertificateNumber"/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="catESAD_ru:CertificateDate"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="catESAD_ru:LoadingPlaseConsignee">
        <xsl:apply-templates select="catESAD_ru:CustomsOfficeID"/>
    </xsl:template>

    <xsl:template match="catESAD_ru:LoadingPlaceOther">
        <xsl:if test="position() > 1">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:if test="catESAD_ru:GoodsLoadingPlaceDesc">
            <xsl:apply-templates select="catESAD_ru:GoodsLoadingPlaceDesc"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:apply-templates select="catESAD_ru:CustomsOfficeID"/>
    </xsl:template>-->
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="$dateIn"/>
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
   <xsl:template match="*" mode="transport">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="./KTDin:TransportMeansQuantity"/>: 
										<xsl:for-each select="./KTDin:TransportMeans">
         <xsl:if test="(cat_ru:ActiveTransportIdentifier) and not(cat_ru:TransportIdentifier) ">
            <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>\
										</xsl:if>
         <xsl:if test="(cat_ru:TransportIdentifier)  ">
            <xsl:value-of select="cat_ru:TransportIdentifier"/>;
											</xsl:if>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="EmptyGoods">
		<xsl:param name="EmpGoods"/>
		<table>
         <tr>
            <td class="tr tb firstCol" rowspan="4">
               <b>31</b> Грузовые места и описание товаров</td>
            <td class="green">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</td>
            <td class="green tr tb  bl nopadding">
               <b>32 </b> Товар
						<br/>
               <span style="border-right:solid 1pt #000000">  №<xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>  </span>
							  <!--<xsl:value-of select="catESAD_cu:GoodFeatures"/>-->
            </td>
            <td class="tb tr green">
               <b>33 </b> Код товара<br/>
               <!--<xsl:value-of select="substring(catESAD_cu:GoodsTNVEDCode, 1, 6)"/>-->
            </td>
            <td class="nopadding tb tr" colspan="2" style="vertical-align: bottom;">
               <table>
                  <tr>
                     <td class="tr"/>
                     <td/>
                  </tr>
                  <tr>
                     <td align="center" class="tr">
                        <!--<xsl:apply-templates select="catESAD_ru:AdditionalSign"/>-->
                        <xsl:text> </xsl:text>
                        <!--<xsl:apply-templates select="catESAD_cu:IntellectPropertySign"/>-->
                     </td>
                     <td align="center">
                       <!-- <xsl:apply-templates select="catESAD_cu:GoodsClassificationCode"/>-->
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green tb" colspan="2" rowspan="3">
              <xsl:text> </xsl:text>
            </td>
            <td class="nopadding bl bb br" style="vertical-align: bottom;">
               <table>
                  <tr>
                     <td class="nowrap" colspan="4">
                        <b>34 </b> Код страны происх.</td>
                  </tr>
                  <tr>
                     <td align="center" class="tr">a</td>
                     <td align="center" class="tr">
                        <!--<xsl:apply-templates select="catESAD_cu:OriginCountryCode"/>-->
                     </td>
                     <td align="center" class="tr">b</td>
                     <td/>
                  </tr>
               </table>
            </td>
            <td class="nowrap tb tr green">
               <b>35 </b> Вес брутто (кг)<br/>
               <!--<xsl:apply-templates select="catESAD_cu:GrossWeightQuantity"/>-->
            </td>
            <td class="nowrap tb tr">
               <b>36 </b>Преференция<br/>
              <!-- <xsl:choose>
                  <xsl:when test="catESAD_cu:Preferencii">
                     <xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:CustomsTax"/> 
					<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:CustomsDuty"/> 
					<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:Excise"/> 
					<xsl:value-of select="catESAD_cu:Preferencii/catESAD_cu:Rate"/>
                  </xsl:when>
                  <xsl:otherwise>-</xsl:otherwise>
               </xsl:choose>-->
            </td>
         </tr>
         <tr>
            <td class="bl bb br nopadding">
               <table style="height: 100%;">
                  <tr>
                     <td colspan="2">
                        <b>37 </b>Процедура</td>
                  </tr>
                  <tr>
                     <td align="center" class="tr">
                        <!--<xsl:if test="KTDin:KTDinCustomsProcedure">
                           <xsl:apply-templates select="KTDin:KTDinCustomsProcedure/catESAD_cu:MainCustomsModeCode"/> 
									<xsl:apply-templates select="KTDin:KTDinCustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
                        </xsl:if>-->
                     </td>
                     <td align="center">
                        <!--<xsl:apply-templates select="KTDin:KTDinCustomsProcedure/catESAD_cu:GoodsTransferFeature"/>-->
                     </td>
                  </tr>
               </table>
            </td>
            <td class="green tb tr">
               <b>38 </b> Вес нетто (кг)<br/>
               <!--<xsl:apply-templates select="catESAD_cu:NetWeightQuantity"/>-->
            </td>
            <td class="tb tr">
               <b>39 </b>
               <i>Квота</i>
               <br/>
               <!--<xsl:apply-templates select="KTDin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/> 
					<xsl:apply-templates select="KTDin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>-->
            </td>
         </tr>
         <tr>
            <td class="green tl tb tr" colspan="3">
               <xsl:text> </xsl:text>
            </td>
         </tr>
         <tr>
            <td class="tr tb" rowspan="3">
               <b>44</b> Дополнит.<br/>информация/<br/>Представл.<br/>документы/<br/>Сертификаты<br/>и разрешения</td>
            <td class="tb green" colspan="2" rowspan="3">
              
            </td>
            <td class="tl tb tr">
               <b>41 </b> Дополнит.единицы<br/>
               <!--<xsl:choose>
                  <xsl:when test="KTDin:SupplementaryGoodsQuantity">
                     <xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
							/
							<xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
							/
							<xsl:apply-templates select="KTDin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
                  </xsl:when>
               </xsl:choose>-->
            </td>
            <td class="tb tr">
               <b>42 </b>Цена товара<br/>
               <!--<xsl:apply-templates select="catESAD_cu:InvoicedCost"/>-->
            </td>
            <td class="tb tr nopadding">
               <table>
                  <tr>
                     <td class="tl" colspan="2">
                        <b>43 </b> Код МОС</td>
                  </tr>
                  <tr>
                     <td align="center" class="tl tb br">
                       <!-- <xsl:apply-templates select="KTDin:CustomsCostMethodCode"/>-->
                     </td>
                     <td align="center">
                        <!--<xsl:apply-templates select="catESAD_cu:CustomsCostCorrectMethod"/>-->
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="nopadding tr" colspan="3">
               <table>
                  <tr>
                     <td class="green" rowspan="2"/>
                     <td class="br green">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td>
                        <b>45 </b>Таможенная стоимость</td>
                  </tr>
                  <tr>
                     <td class="bl bb br green"><xsl:text> </xsl:text></td>
                     <td class="tb">
                     <table>
						<tr>
                        <td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 1.5pt black;width:25mm;" align="center"><!--<xsl:apply-templates select="catESAD_cu:CustomsCost"/>--></td>
						<td style="border-bottom:solid 0pt black;border-left:solid 0pt black;border-right:solid 0pt black;width:35mm;" align="center">
						<!--<xsl:if test="KTDin:PreviousCustomsCost"><xsl:value-of select="KTDin:PreviousCustomsCost"/>-->
						</td>
                  </tr>
					</table>
                        
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
        
            <td class="tl tb tr">
            <b>45а</b>
            Код изменений<br/>
            <xsl:choose>
									<xsl:when test="$EmpGoods/KTDin:ChangeCode"><xsl:for-each select="$EmpGoods/KTDin:ChangeCode">
								<xsl:value-of select="KTDin:PhaseChanges"/>/<xsl:value-of select="KTDin:BasisCompilation"/>/<xsl:value-of select="KTDin:QuantityChanges"/>/<xsl:value-of select="KTDin:CountryChanges"/>/<xsl:value-of select="KTDin:TNVEDChanges"/>/<xsl:value-of select="KTDin:CustCostChanges"/>/<xsl:value-of select="KTDin:CustomsPaymentChanges"/>/<xsl:value-of select="KTDin:OtherChanges"/></xsl:for-each></xsl:when>
								
					</xsl:choose>
            </td>  
            <td class="tl tb tr" colspan="2">
               <b>46 </b>Статистическая стоимость<br/>
               <xsl:apply-templates select="catESAD_cu:StatisticalCost"/>
               <xsl:apply-templates mode="indicator" select="catESAD_ru:ConformityStatCostIndicator"/>
            </td>
         </tr>
      </table>
	</xsl:template>
</xsl:stylesheet>
