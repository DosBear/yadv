<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:SADin="urn:customs.ru:Information:CustomsDocuments:ESADin:5.12.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="SADin:ESADin">
      <html>
         <head>
            <title>Таможенная декларация</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
                    body {background: #CCCCCC; font-size: 7pt;}
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
                    .graphMain {font-size: 9pt; font-weight: bold;}
                    .graphNum {font-weight: bold;}
                    .graphNo {font-weight: bold;}
                    h1{font-size: 12pt;}
                    table{width: 100%; border-collapse: collapse; margin: 0;}
                   
                    table.addInfo {border-collapse: collapse;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey; }
                    table.addInfo td {border: 1px solid black; }
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
               <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinGoods[position() = 1]"/>
               <xsl:call-template name="td3section47"/>
               <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinReloadingInfo"/>
               <xsl:call-template name="td3sectionFDJ"/>
            </div>
            <xsl:if test="count(//SADin:ESADinGoods) > 1">
               <xsl:call-template name="td4"/>
            </xsl:if>
            <xsl:if test="count(//SADin:ESADinDeclarationDecision | //SADin:ESADinCommonOfficialMark | //SADin:ESADinGoodsDecision) > 0">
               <div class="page">
                  <xsl:apply-templates select="SADin:ESADinDeclarationDecision"/>
                  <xsl:call-template name="goodsDecision"/>
                  <xsl:apply-templates select="SADin:ESADinCommonOfficialMark"/>
                  <xsl:call-template name="goodsOfficialMarks"/>
               </div>
            </xsl:if>
            <!--xsl:if test="count(//SADin:ESADinAutomobile | //SADin:ESADinContractList) > 0"-->
            <xsl:if test="count(//SADin:ESADinAutomobile) > 0">
               <div class="page">
                  <xsl:call-template name="automobile"/>
                  <!--xsl:apply-templates mode="foreignTradeContracts" select="//SADin:ESADinGoods[count(SADin:ESADinContractList) > 0]"/-->
               </div>
            </xsl:if>
         </body>
      </html>
   </xsl:template>
   <!--Если количество товаров в декларации больше, чем 1, 2 - ... выводятся на бланке ТД4-->
   <xsl:template name="td4">
      <xsl:for-each select="//SADin:ESADinGoods">
         <xsl:if test="(position() - 1) mod 3 = 1">
            <xsl:variable name="firstEntryPos" select="position()"/>
            <div class="page">
               <xsl:call-template name="td4Head"/>
               <xsl:for-each select="//SADin:ESADinGoods">
                  <xsl:if test="position() >= $firstEntryPos and position() &lt;= $firstEntryPos + 2">
                     <xsl:apply-templates select="."/>
                  </xsl:if>
               </xsl:for-each>
               <table style="height: 100%;">
                  <tr>
                     <td class="firstCol tr tb" rowspan="2">
                        <b>47 </b> Исчисление платежей</td>
                     <td class="tr tb" style="width: 45%;">
                        <xsl:apply-templates mode="payments" select="//SADin:ESADinGoods[position() = $firstEntryPos]"/>
                     </td>
                     <td class="tr tb">
                        <xsl:apply-templates mode="payments" select="//SADin:ESADinGoods[position() = $firstEntryPos + 1]"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="tr tb">
                        <xsl:apply-templates mode="payments" select="//SADin:ESADinGoods[position() = $firstEntryPos + 2]"/>
                     </td>
                     <td class="tr tb"/>
                  </tr>
               </table>
            </div>
         </xsl:if>
      </xsl:for-each>
   </xsl:template>
   <!--Верхняя часть листа ТД4-->
   <xsl:template name="td4Head">
      <table style="height: 100%">
         <tr>
            <td class="firstCol"/>
            <td class="header nowrap" colspan="5">ДОБАВОЧНЫЙ ЛИСТ К 
				<xsl:choose>
                  <xsl:when test="(//SADin:CustomsProcedure)!='ТТ'">ДЕКЛАРАЦИИ НА ТОВАРЫ</xsl:when>
                  <xsl:otherwise>ТРАНЗИТНОЙ ДЕКЛАРАЦИИ</xsl:otherwise>
               </xsl:choose>
            </td>
            <td class="tl nowrap" colspan="6">
               <b>А</b> ОРГАН ОТПРАВЛЕНИЯ/ЭКСПОРТА/НАЗНАЧЕНИЯ</td>
         </tr>
         <tr>
            <td/>
            <td class="tb header nowrap"/>
            <td class="bl bt br" colspan="4">
               <b>1</b> ДЕКЛАРАЦИЯ</td>
            <td colspan="6">
               <xsl:apply-templates mode="numberGTD" select="//SADin:GTDNumber"/>
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
               <xsl:apply-templates mode="org" select="//SADin:ESADinConsignor"/>
               <hr/>
               <i>Получатель: </i>
               <xsl:apply-templates mode="org" select="//SADin:ESADinConsignee"/>
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
               <xsl:if test="SADin:CustomsProcedure='ТТ'">
                  <b>50 </b>Принципал </xsl:if>
               <xsl:if test="SADin:CustomsProcedure!='ТТ'">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </xsl:if>
            </td>
            <td class="green">
               <xsl:if test="SADin:CustomsProcedure='ТТ'">№ 
                  
                  <!--xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinPrincipal/cat_ru:OGRN"/-->
               </xsl:if>
               <xsl:if test="SADin:CustomsProcedure!='ТТ'">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </xsl:if>
            </td>
            <td class="green">
               <xsl:if test="SADin:CustomsProcedure='ТТ'">Подпись:</xsl:if>
               <xsl:if test="SADin:CustomsProcedure!='ТТ'">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </xsl:if>
            </td>
            <td class="dl db tr" colspan="2" rowspan="4" style="width:50%">
               <b>С </b>ОРГАН ОТПРАВЛЕНИЯ</td>
         </tr>
         <tr>
            <td class="green tl" colspan="3">
               <!--xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinPrincipal" mode="org"/-->
            </td>
         </tr>
         <tr>
            <td class="green tl" colspan="3">
               <xsl:if test="SADin:CustomsProcedure='ТТ'"> представленный</xsl:if>
               <xsl:if test="SADin:CustomsProcedure!='ТТ'">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </xsl:if>
               <!--xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinPrincipal/SADin:ESADPrincipalRepresentative">
                        <br/>
                        <xsl:apply-templates select="cat_ru:PersonName"/>
                        <xsl:apply-templates select="cat_ru:PersonPost"/>
                        <br/>
                        <xsl:apply-templates select="catESAD_ru:IdentityCard"/>
                    </xsl:for-each-->
            </td>
         </tr>
         <tr>
            <td class="green tb tl" colspan="3">
               <xsl:if test="SADin:CustomsProcedure='ТТ'">Место и дата:</xsl:if>
               <xsl:if test="SADin:CustomsProcedure!='ТТ'">
                  <xsl:if test="SADin:ExecutionPlace">
                     <xsl:value-of select="SADin:ExecutionPlace"/>
                  </xsl:if>
                  <xsl:text> </xsl:text>
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="SADin:ExecutionDate"/>
                  </xsl:call-template>
               </xsl:if>
            </td>
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
               <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:Guarantee">
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
               <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:DeliveryCustomsOffice">
                  <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:DeliveryCustomsOffice/cat_ru:Code"/>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:DeliveryCustomsOffice/cat_ru:OfficeName"> 
               <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:DeliveryCustomsOffice/cat_ru:OfficeName"/>
                  </xsl:if>
               </xsl:if>
               <!--xsl:if test="SADin:CustomsProcedure = 'ВТТ' or SADin:CustomsProcedure = 'МТТ'">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_ru:DeliveryCustomsOffice/catESAD_ru:Code"/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_ru:DeliveryCustomsOffice/catESAD_ru:OfficeName"/>
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_ru:DestinationCountryCode">
                            <br/>
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_ru:DestinationCountryCode"/>
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_ru:DestinationCountryName"/>
                        </xsl:if>
                    </xsl:if-->
            </td>
         </tr>
         <tr>
            <td class="bl bb br green" style="height: 6px;"/>
         </tr>
      </table>
      <table>
         <tr>
            <td class="firstCol tr tb">
               <!--<b>D/J </b>ОТМЕТКИ ОРГАНА ОТПРАВЛЕНИЯ/НАЗНАЧЕНИЯ
                    <div style="display: inline; margin-left: 100px;">Печать:</div>
					<br/>Результат:<br/>
                    Наложенные пломбы:<div style="display: inline; margin-left: 50px;">Номер:</div>
					<br/>
                    Тип:
					<br/>Срок доставки (дата):
					<br/>Подпись:<br/>
					<br/>-->
               <table>
                  <tr>
                     <td>
                        <b>D/J </b>ОТМЕТКИ ОРГАНА ОТПРАВЛЕНИЯ/НАЗНАЧЕНИЯ                <br/>
                     </td>
                     <td align="right">Печать:<br/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">Результат:<br/>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td>Наложенные пломбы:<br/>
                        <br/>
                     </td>
                     <td>Номер:<br/>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">Срок доставки (дата):<br/>
                        <br/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">Подпись:<br/>
                        <br/>
                        <br/>
                        <br/>
                     </td>
                  </tr>
               </table>
            </td>
            <td class="tb tr" style="width: 30%;">
               <b>54 </b>Место и дата<br/>
               <!--<xsl:if test="(SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:CustomsRepresCertificate) or (SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:ContractRepresDecl)">
						<span class="graph">1) </span>
						<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:ContractRepresDecl/cat_ru:PrDocumentName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:ContractRepresDecl/cat_ru:PrDocumentNumber"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:ContractRepresDecl/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
						<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:ContractRepresDecl">
							<br/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:if>
						<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:CustomsRepresCertificate/cat_ru:PrDocumentName"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:CustomsRepresCertificate/cat_ru:PrDocumentDate"/>
						</xsl:call-template>
					</xsl:if>-->
               <!--xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker">
                        1) <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:CertificateNumber"/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:IssueCertificateDate" mode="date"/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:INNID"/>
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:KPPCode">
                            <xsl:text> / </xsl:text>
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:KPPCode"/>
                        </xsl:if>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:AgreementNumber"/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/SADin:CustomsBroker/catESAD_ru:ConclusionAgreementDate" mode="date"/>
                    </xsl:if-->
               <xsl:for-each select="SADin:CUESADCustomsRepresentative">
                  <!--Пункт 1)-->
                  <span class="graph">1) </span>
										Свид. о включении в Реестр таможенных представителей № <xsl:value-of select="catESAD_cu:CustomsRepresCertificate/cat_ru:PrDocumentNumber"/>;<br/>
                  <xsl:for-each select="catESAD_cu:ContractRepresDecl">
											Договор таможенного представителя с декларантом № 
											 <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:if test="cat_ru:PrDocumentDate">
											от 
											<xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                        </xsl:call-template>
                     </xsl:if>
                  </xsl:for-each>; <br/>
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
                              <xsl:if test="cat_ru:KPP"/>
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
               </xsl:for-each>
					Подпись и фамилия декларанта/представителя<br/>
               <!--<xsl:choose>
						<xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson">
							<span class="graph">2)</span>-->
               <xsl:for-each select="SADin:ESADFilledPerson">
                  <!--Пункт 2)-->
                  <span class="graph">2)</span>
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
                  <xsl:text> </xsl:text>
                  <xsl:for-each select="catESAD_cu:IdentityCard">
                     <br/>
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
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:OrganizationName"/>
                  </xsl:for-each>
                  <xsl:if test="SADin:ESADFilledPerson/cat_ru:PersonPost">
                     <br/>
                     <xsl:value-of select="SADin:ESADFilledPerson/cat_ru:PersonPost"/>
                  </xsl:if>
                  <xsl:for-each select="catESAD_cu:Contact">
											Телефон <xsl:value-of select="cat_ru:Phone"/>
                     <br/>
                  </xsl:for-each>
                  <!--<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/cat_ru:PersonSurname"/>
							<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/cat_ru:PersonName"/>
							<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/cat_ru:PersonMiddleName"/>
							<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:IdentityCard">
								<br/>
								<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardName"/>
								<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardSeries"/>
								<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardNumber"/>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:IdentityCard/cat_ru:IdentityCardDate"/>
								</xsl:call-template>
								<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:IdentityCard/cat_ru:OrganizationName"/>
							</xsl:if>
							<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/cat_ru:PersonPost">
								<br/>
								<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/cat_ru:PersonPost"/>
							</xsl:if>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:Contact/cat_ru:Phone">
								<xsl:value-of select="."/>, 
										</xsl:for-each>
							<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument">
								<br/>
								<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/SADin:ExecutionDate"/>
									</xsl:call-template>
									<br/>
								<span class="graph">3)</span>
								<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName">
									<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentName"/>, 
											</xsl:if>
								<xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentNumber"/>, 
											<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate">
									<span class="graph">до </span>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADFilledPerson/catESAD_cu:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
									</xsl:call-template>
								</xsl:if>
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
                  </xsl:for-each>
               </xsl:for-each>
               <xsl:if test="//SADin:RegNumberDoc">
                  <span class="graph">4)  Исходящий номер регистрации документов</span>
                  <br/>
               </xsl:if>
               <xsl:value-of select="//SADin:RegNumberDoc"/>
               <xsl:text> </xsl:text>
               <br/>
               <xsl:if test="//SADin:SecurityLabelCode"> Код защитной наклейки
										<xsl:value-of select="//SADin:SecurityLabelCode"/>
               </xsl:if>
               <p align="right">
                  <xsl:choose>
                     <xsl:when test="(//SADin:CustomsProcedure ='TT') or (//SADin:CustomsProcedure ='ТТ')">
                        <xsl:text> </xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="//SADin:ExecutionDate"/>
                        </xsl:call-template>
                     </xsl:otherwise>
                  </xsl:choose>
               </p>
               <br/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Перегрузки-->
   <xsl:template match="SADin:ESADinReloadingInfo">
      <table>
         <tr>
            <td class="firstCol tr tb" rowspan="4">
               <b>55 </b> Пере-<br/>грузки</td>
            <td class="tr tb" colspan="3">
                    Место и страна:
                    <xsl:apply-templates select="catESAD_cu:ReloadCountryCode"/>
               <xsl:text> </xsl:text>
               <xsl:apply-templates select="catESAD_cu:ReloadCountryName"/>
               <xsl:text> </xsl:text>
               <xsl:apply-templates select="catESAD_cu:ReloadingCustomsOffice/cat_ru:Code"/>
               <xsl:text> </xsl:text>
               <xsl:apply-templates select="catESAD_cu:ReloadingCustomsOffice/cat_ru:OfficeName"/>
            </td>
         </tr>
         <tr>
            <td class="tb tr" colspan="3">
                    Идентификация и страна регистрации нового транспортного средства:
                    <xsl:for-each select="catESAD_cu:ReloadingTransportMeans">
                  <xsl:value-of select="cat_ru:TransportKindCode"/>,
									<xsl:if test="cat_ru:TransportIdentifier">
                     <xsl:value-of select="cat_ru:TransportIdentifier"/>,
									</xsl:if>
                  <xsl:if test="cat_ru:VIN">
                     <xsl:value-of select="cat_ru:VIN"/>,
									</xsl:if>
                  <xsl:if test="cat_ru:TransportMeansNationalityCode">
                     <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                  </xsl:if>,
                    <xsl:text> </xsl:text>
               </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="tb tr">Конт=</td>
            <td align="center" class="tb tr">
               <xsl:apply-templates mode="indicator" select="catESAD_cu:ContainerIndicator"/>
            </td>
            <td class="tb tr">
               <xsl:text>(1) Номер нового контейнера</xsl:text>
               <xsl:for-each select="catESAD_cu:ReloadContainer/catESAD_cu:ContainerNumber">
                  <xsl:text> </xsl:text>
                  <xsl:apply-templates select="."/>, 
                    </xsl:for-each>
            </td>
         </tr>
         <tr>
            <td class="tb tr" colspan="3">(1) Указывается 1, если ДА или 0, если НЕТ</td>
         </tr>
      </table>
   </xsl:template>
   <!--ТД3, гр. 47 - Исчисление платежей, подробности подсчёта-->
   <xsl:template name="td3section47">
      <table>
         <tr>
            <td class="firstCol tr tb">
               <b>47 </b>Исчисле-<br/>ние платежей</td>
            <td class="nopadding tb" style="width: 45%;">
               <xsl:apply-templates mode="payments" select="//SADin:ESADinGoods[position() = 1]"/>
            </td>
            <td class="tl tb tr nopadding">
               <table style="height: 100%">
                  <tr>
                     <td class="tb tr" style="width: 50%; min-height: 15pt;">
                        <b>48 </b> Отсрочка платежей
                                <xsl:for-each select="//SADin:ESADinPayments/SADin:DelayPayments">
                           <br/>
                           <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates select="catESAD_cu:DelayDocumentNumber"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates mode="date" select="catESAD_cu:DelayDocumentDate"/>
                           <xsl:text>-</xsl:text>
                           <xsl:apply-templates mode="date" select="catESAD_cu:DelayDate "/>
                        </xsl:for-each>
                     </td>
                     <td class="tb">
                        <b>49 </b>Реквизиты склада</td>
                  </tr>
               </table>
               <b>B </b> ПОДРОБНОСТИ ПОДСЧЕТА
                    <table>
                  <tr>
                     <td>
                        <xsl:for-each select="//SADin:ESADinPayments/SADin:ESADinCustomsPayment">
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
                        <!--</xsl:for-each>
                     </td>
                     <td>
                        <xsl:for-each select="//SADin:ESADinPayments/SADin:ESADinCustomsPayment">-->
                           <xsl:for-each select="SADin:PaymentDocument">-<xsl:value-of select="cat_ru:PrDocumentNumber"/>
                              <xsl:if test="cat_ru:PrDocumentDate">
                                 <span class="graph">-</span>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="SADin:PaymentWayCode">-<xsl:value-of select="SADin:PaymentWayCode"/></xsl:if>
									<xsl:if test="SADin:RKOrganizationFeatures">-<xsl:value-of select="SADin:RKOrganizationFeatures/cat_ru:BIN"/><xsl:value-of select="SADin:RKOrganizationFeatures/cat_ru:IIN"/></xsl:if>
									<xsl:if test="SADin:RBOrganizationFeatures">-<xsl:value-of select="SADin:RBOrganizationFeatures/cat_ru:UNP"/><xsl:value-of select="SADin:RBOrganizationFeatures/cat_ru:RBIdentificationNumber"/></xsl:if>
                           <br/>
                        </xsl:for-each>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="*" mode="indicator">
      <xsl:choose>
         <xsl:when test=". = 1  or . = 'true' or . = 't'">1</xsl:when>
         <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="*" mode="transport">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:value-of select="//SADin:TransportMeansQuantity"/>: 
			<xsl:for-each select="./SADin:TransportMeans">
         <xsl:if test="(cat_ru:ActiveTransportIdentifier) and not(cat_ru:TransportIdentifier) ">
            <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>\
			</xsl:if>
         <xsl:if test="(cat_ru:TransportIdentifier)  ">
            <xsl:value-of select="cat_ru:TransportIdentifier"/>;
			</xsl:if>
      </xsl:for-each>
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
      <table cellpadding="0" cellspacing="0">
         <tr>
            <td class="graphMain" colspan="3">
               <xsl:choose>
                  <xsl:when test="(SADin:CustomsProcedure)!='ТТ'">ДЕКЛАРАЦИЯ НА ТОВАРЫ</xsl:when>
                  <xsl:otherwise>ТРАНЗИТНАЯ ДЕКЛАРАЦИЯ</xsl:otherwise>
               </xsl:choose>
            </td>
            <td class="tl">А 
               
               <!--ТАМОЖЕННЫЙ ОРГАН ОТПРАВЛЕНИЯ/ЭКСПОРТА-->
            </td>
         </tr>
         <tr>
            <td class="graphMain" colspan="2" style="width:100mm"/>
            <td class="bl bt br" style="width:40mm">
               <b>1 </b> ДЕКЛАРАЦИЯ</td>
            <td rowspan="4" style="width:70mm" valign="top">
               <xsl:apply-templates mode="numberGTD" select="SADin:GTDNumber"/>
            </td>
         </tr>
         <tr>
            <td align="center" class="b firstCol" style="width:17mm">
               <!--b>1<b-->
               <!--Здесь должен быть номер экземпляра-->
               <!--b>
						<xsl:value-of select=""/>
					</b-->
            </td>
            <td class="t green" rowspan="3" style="width:83mm">
               <b>2</b>
               <xsl:text> Отправитель / </xsl:text>
               <i>Экспортёр</i>
               <div style="display: inline; padding-left: 40px;">
                        № 
                       <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </xsl:if>
                  <!--<xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>-->
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="SADin:ESADinGoodsShipment/SADin:ESADinConsignor"/>
            </td>
            <td style="width:40mm;border-bottom:solid 2px black; border-right:solid 2px black; border-left:solid 2px black;" valign="bottom">
               <table cellpadding="0" cellspacing="0" style="width:40mm;" valign="bottom">
                  <tr>
                     <td style="width: 17mm; text-align: center; border-right:solid 1px black;" valign="bottom">
                        <xsl:apply-templates select="SADin:CustomsProcedure"/>
                     </td>
                     <td class="tr" style="width: 5mm; text-align: center;" valign="bottom">
                        <xsl:apply-templates select="SADin:CustomsModeCode"/>
                        <!--xsl:if test="SADin:TransitDirectionCode">
									&#160;<xsl:apply-templates select="SADin:TransitDirectionCode"/>
								</xsl:if-->
                     </td>
                     <td style="width: 18mm; text-align: center;" valign="bottom">
                        <xsl:apply-templates select="SADin:ElectronicDocumentSign"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td rowspan="9" style="width:17mm; border: solid 1px black"/>
            <td style="width:40mm; border-left:solid 2px black; border-right:solid 2px black;" valign="top">
               <table cellpadding="0" cellspacing="0" style="height:100%; width:40mm;" valing="bottom">
                  <tr>
                     <td colspan="2" style="width:22mm;" valign="top">
                        <b>3</b> Формы</td>
                     <td rowspan="2" style="width:18mm; border-left:solid 1px black;" valign="top">
                        <b>4</b> Отгр. спец.<br/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:SpecificationNumber"/>
                        <xsl:if test="SADin:ESADinGoodsShipment/catESAD_cu:SpecificationListNumber">
                           <xsl:text> / </xsl:text>
                           <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:SpecificationListNumber"/>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td class="tr" style="width: 10mm;">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td align="center" style="width:12mm" valign="bottom">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:TotalSheetNumber"/>
                     </td>
                     <!--td align="center" style="width:18mm">
                                <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:SpecificationNumber"/>
                                <xsl:if test="SADin:ESADinGoodsShipment/catESAD_cu:SpecificationListNumber">
                                    <xsl:text> / </xsl:text>
                                    <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:SpecificationListNumber"/>
                                </xsl:if>
                            </td-->
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td colspan="2" style="width:110mm; border:solid 1px black;" valign="bottom">
               <table cellpadding="0" cellspacing="0" style="height: 100%; width:110mm">
                  <tr>
                     <td style="width: 22mm; border-right:solid 1px black;">
                        <b>5 </b> Всего т-ов<br/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:TotalGoodsNumber"/>
                     </td>
                     <td style="width: 23mm; border-right:solid 1px black;">
                        <b>6 </b> Всего мест<br/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:TotalPackageNumber"/>
                     </td>
                     <td style="width:65mm;">
                        <b>7 </b> Справочный номер<br/>
                        <xsl:apply-templates select="SADin:DeclarationKind"/>
                     </td>
                  </tr>
                  <!--tr>
                            <td class="tr green" style="width:83mm">
								<xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:TotalGoodsNumber"/>
							</td>
                            <td class="tr green"><xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:TotalPackageNumber"/></td>
                            <td><xsl:apply-templates select="SADin:DeclarationKind"/></td>
                        </tr-->
               </table>
            </td>
         </tr>
         <tr>
            <td class="green" rowspan="2">
               <b>8 </b> Получатель
                    <div style="display: inline; padding-left: 95px;">
                        № 
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </xsl:if>
                  <!--<xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee/cat_ru:OGRN"/>-->
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="SADin:ESADinGoodsShipment/SADin:ESADinConsignee"/>
            </td>
            <td class="tl tr" colspan="2">
               <b>9 </b> Лицо, ответственное за финансовое урегулирование
                    <div style="display: inline; padding-left: 40px;">
                        № 
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson">
                     <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                        <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                     </xsl:if>
                     <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                        <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                     </xsl:if>
                     <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                        <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                     </xsl:if>
                     <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                        <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                     </xsl:if>
                     <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                        <xsl:text> / </xsl:text>
                        <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                     </xsl:if>
                  </xsl:if>
                  <!--<xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson/cat_ru:OGRN"/>-->
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="SADin:ESADinGoodsShipment/SADin:ESADinFinancialAdjustingResponsiblePerson"/>
            </td>
         </tr>
         <tr>
            <td class="nopadding tr tt tl" colspan="2">
               <table style="height: 100%;">
                  <tr>
                     <td class="tl tr" colspan="2">
                        <b>10 </b>
                        <i>Стр. перв. назн/<br/>послед.отправл.</i>
                     </td>
                     <td class="bl tr" colspan="2">
                        <b>11 </b>
                        <i>Страна прод.</i>
                     </td>
                     <td class="tr">
                        <b>12 </b>Общая таможенная стоимость</td>
                     <td class="tb" rowspan="2">
                        <b>13 </b>
                     </td>
                  </tr>
                  <tr>
                     <td class="tl bb br" style="width: 20px;"/>
                     <td class="tb"/>
                     <td align="center" class="bl bb br" style="width: 20px;">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:TradeCountryCode"/>
                     </td>
                     <td class="tb tr"/>
                     <!--xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:TradeCountryCode"/>
							</td-->
                     <td class="tb tr">
							<xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:TotalCustCost"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="tt tr tb" rowspan="2">
               <b>14 </b> Декларант/Представитель
                    <div style="display: inline; padding-left: 35px;">
                        № 
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                  </xsl:if>
                  <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
                  </xsl:if>
                  <!--xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:OGRN"/>
                    </div>
                    <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant/cat_ru:OGRN"/-->
               </div>
               <br/>
               <xsl:apply-templates mode="org" select="SADin:ESADinGoodsShipment/SADin:ESADinDeclarant"/>
            </td>
            <td class="tb tr nopadding" colspan="2" style="width:110mm" valign="bottom">
               <table style="height: 100%;">
                  <tr>
                     <td style="width:45mm">
                        <b>15 </b> Страна отправления
                        
                        <!--i>экспорта</i-->
                        <br/>
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:DispatchCountryName"/>
                     </td>
                     <td style="width:35mm; border-right:solid 1pt #000000; border-left:solid 1pt #000000; " valign="bottom">
                        <!--table>
									<tbody>
										<tr>
											<td colspan="4" style="width:35mm"><b>15 </b> Код страны отпр./<i>эксп.</i><br/></td>
										</tr>
										<tr>
											<td colspan="2" style="width:17,5mm;border-right:solid 0.5pt #000000;" valign="bottom">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td colspan="2"  style="width:17,5mm;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
										<tr>
											<td style="width:5mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
											a
											</td>
											<td style="width:12,5mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
												<xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:DispatchCountryCode"/>
											</td>
											<td style="width:5mm;border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
											b
											</td>
											<td style="width:12,5mm; border-bottom:solid 0.5pt #000000;"> 
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</tbody>
								</table-->
                        <span>
                           <b>15 </b> Код страны отпр./
                           
                           <!--i>эксп.</i-->
                        </span>
                        <br/>
                        <span style="border-right:solid 0.5pt #000000">
                                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>a<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>  
                                </span>
                        <span style="border-right:solid 1pt #000000">
                                     <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:DispatchCountryCode"/>      
                                </span>
                        <span style="border-right:solid 0.5pt #000000">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>b<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </span>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td style="30mm">
                        <!--table>
									<tbody>
										<tr>
											<td colspan="4" style="width:35mm"><b>17 </b> Код страны назнач.<br/><br/></td>
										</tr>
										<tr>
											<td colspan="2" style="width:17,5mm;border-right:solid 0.5pt #000000;" valign="bottom">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
											<td colspan="2"  style="width:17,5mm;">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
										<tr>
											<td style="width:5mm; border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
											a
											</td>
											<td style="width:12,5mm; border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
												<xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:DispatchCountryCode"/>
											</td>
											<td style="width:5mm; border-right:solid 0.5pt #000000;border-bottom:solid 0.5pt #000000;">
											b
											</td>
											<td style="width:12,5mm; border-bottom:solid 0.5pt #000000;"> 
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</tbody>
								</table-->
                        <b>17 </b> Код страны назнач.<br/>
                        <span style="border-right:solid 0.5pt #000000">
                                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>a<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>  
                                </span>
                        <span style="border-right:solid 1pt #000000">
                                     <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:DestinationCountryCode"/>      
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
            <td class="tr tb" style="width:46mm;" valign="top">
               <b>16 </b> Страна происхождения<br/>
               <xsl:apply-templates select="SADin:ESADinGoodsShipment/catESAD_cu:OriginCountryName"/>
            </td>
            <td class="green tr tb" style="width:64mm;" valign="top">
               <b>17 </b> Страна назначения<br/>
               <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:DestinationCountryName"/>
            </td>
         </tr>
         <tr>
            <td class="nopadding tr" style="width:83mm;border-bottom:solid 1pt #000000">
               <table style="height: 100%;">
                  <tr>
                     <td class="br green" colspan="2" style="width:66mm">
                        <b>18 </b>Идентификация и страна регистрации трансп. средства при отправлении/ прибытии</td>
                     <td class="green nowrap" style="width:17mm">
                        <b>19 </b>Конт.</td>
                     <!--td colspan="3" style="width:110mm;" class="tr tr"><b>20 </b> Условия поставки</td-->
                  </tr>
                  <tr>
                     <td class="tb br green">
                        <xsl:apply-templates mode="transport" select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport"/>
                        <xsl:choose>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/SADin:MethodTransport=1">газопровод </xsl:when>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/SADin:MethodTransport=2">нефтепровод </xsl:when>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/SADin:MethodTransport=3">нефтепродуктопровод </xsl:when>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/SADin:MethodTransport=4">линия электропередачи </xsl:when>
                        </xsl:choose>
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/SADin:NameObject">
                           <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/SADin:NameObject"/>
                        </xsl:if>
                     </td>
                     <td align="center" class="bb br green">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/cat_ru:TransportNationalityCode"/>
                     </td>
                     <td>
                        <xsl:choose>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:ContainerIndicator">1</xsl:when>
                           <xsl:otherwise>0</xsl:otherwise>
                        </xsl:choose>
                     </td>
                  </tr>
               </table>
            </td>
            <td colspan="2" style="width:110mm; border-right:solid 1pt #000000;border-bottom:solid 1pt #000000" valign="bottom">
               <table style="width:110mm;">
                  <tbody>
                     <tr>
                        <td colspan="3" style="width:110mm;">
                           <b>20 </b> Условия поставки</td>
                     </tr>
                     <tr>
                        <td class="bb br green" style="width:10mm;">
                           <xsl:apply-templates mode="indicator" select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:ContainerIndicator"/>
                        </td>
                        <td align="center" class=" br" style="width:90mm;">
                           <xsl:choose>
                              <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode!=''">
                                 <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryTermsStringCode"/>
                              </xsl:when>
                           </xsl:choose>
                           <xsl:choose>
                              <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace!=''">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:CUESADDeliveryTerms/cat_ru:DeliveryPlace">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                 </xsl:for-each>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:otherwise>
                           </xsl:choose>
                        </td>
                        <!--td class="tb br">
                                <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:ESADDeliveryTerms/cat_ru:DeliveryPlace"/>
                            </td-->
                        <td class="bb" style="width:10mm;">
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </td>
         </tr>
         <tr>
            <td class="nopadding tb tr" colspan="3" style="width:193mm;">
               <table style="height: 100%; width:193mm;">
                  <tr>
                     <td class="br green" colspan="2" style="width:83mm;">
                        <b>21 </b> Идентификация и страна регистрации  активного трансп. средства на границе</td>
                     <td class="tr" colspan="2" style="width:45mm;">
                        <b>22 </b> Валюта и общая сумма по счету</td>
                     <td class="br" style="width:35mm;">
                        <b>23 </b> Курс валюты
                            <br/>
                        <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:ContractCurrencyRate"/>
                     </td>
                     <td colspan="4" style="width:30mm;">
                        <b>24 </b> Характер сделки</td>
                  </tr>
                  <tr>
                     <td class="green br" style="width:66mm;">
                        <xsl:apply-templates mode="transport" select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans"/>
                        <xsl:choose>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/SADin:MethodTransport=1">газопровод </xsl:when>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/SADin:MethodTransport=2">нефтепровод </xsl:when>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/SADin:MethodTransport=3">нефтепродуктопровод </xsl:when>
                           <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/SADin:MethodTransport=4">линия электропередачи </xsl:when>
                        </xsl:choose>
                        <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/SADin:NameObject">
                           <xsl:value-of select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/SADin:NameObject"/>
                        </xsl:if>
                     </td>
                     <td align="center" class="green tb br" style="width:17mm;">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/cat_ru:TransportModeCode"/>
                     </td>
                     <td align="center" class="tb br" style="width:10mm;">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:ContractCurrencyCode"/>
                     </td>
                     <td align="center" class="tr" style="width:35mm;">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:TotalInvoiceAmount"/>
                     </td>
                     <td class="br" style="width:35mm;"/>
                     <td class="tb tr" style="width:7mm;">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:DealFeatureCode"/>
                     </td>
                     <td class="tb br" style="width:7mm;">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinMainContractTerms/catESAD_cu:DealNatureCode"/>
                     </td>
                     <td style="width:16mm;"/>
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
                        <b>27 </b>Место погрузки/разгрузки</td>
                  </tr>
                  <tr>
                     <td class="green"/>
                     <td align="right" class="green br">на границе</td>
                     <td/>
                     <td align="right" class="tr">внутри страны</td>
                  </tr>
                  <tr>
                     <td align="center" class="tb br green">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinBorderTransportMeans/cat_ru:TransportModeCode"/>
                     </td>
                     <td class="br green"/>
                     <td align="center" class="tb br">
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinDepartureArrivalTransport/cat_ru:TransportModeCode"/>
                     </td>
                     <td class="tr"/>
                     <td class="green">
                        <!--xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinLoadingPlace"/-->
                     </td>
                  </tr>
               </table>
            </td>
            <td class="t" colspan="2" rowspan="2" valign="top">
               <b>28</b>
                    Финансовые и банковские сведения
                    <br/>
               <!--xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:FinancialDocuments/catESAD_ru:FinDocumentCode = '1'">
                        1.1-
                        <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:FinancialDocuments">
                            <xsl:if test="./catESAD_ru:FinDocumentCode = '1'"><xsl:apply-templates select="./catESAD_ru:FinDocumentNumber"/>,</xsl:if>
                        </xsl:for-each>
                        <br/>
                    </xsl:if>
                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:FinancialDocuments/catESAD_ru:FinDocumentCode='2'">
                        1.2-
                        <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:FinancialDocuments">
                            <xsl:if test="./catESAD_ru:FinDocumentCode='2'"><xsl:apply-templates select="./catESAD_ru:FinDocumentNumber"/>,</xsl:if>
                        </xsl:for-each>
                        <br/>
                    </xsl:if>
                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:FinancialDocuments/catESAD_ru:FinDocumentCode='3'">
                        1.3-
                        <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:FinancialDocuments">
                            <xsl:if test="./catESAD_ru:FinDocumentCode='3'">
                                <xsl:apply-templates select="./catESAD_ru:GtdRegNumber" mode="numberGTD"/>,
                            </xsl:if>
                        </xsl:for-each>
                        <br/>
                    </xsl:if>
                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization">
                        <xsl:choose>
                            <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization/catESAD_ru:OrganizationKind='1'">
                                <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization/catESAD_ru:INN!=''">
                                    1.4-
                                    <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization/catESAD_ru:INN"/>
                                    <br/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                1-
                                <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization/catESAD_ru:OKPO"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures">
                        <br/>
                        2-
                        <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization/catESAD_ru:BankName"/>
                        <xsl:if test="(SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures) or (SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:BankOrganization)">
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:PaymentFormCode"/>
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_cu:DealFeatureCode"/>
                            <xsl:text> / </xsl:text>
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_cu:DealNatureCode"/>
                            <xsl:apply-templates select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:PaymentFeature"/>
                            <xsl:text> / </xsl:text>
                            <xsl:choose>
                                <xsl:when test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:FirstPaymentDate">
                                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:FirstPaymentIndicator=1">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn" select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:FirstPaymentDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:FirstPaymentIndicator=2">
                                        <xsl:variable name="FirstPaymentDate">
                                            <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn"
                                                                select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:FirstPaymentDate"/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:value-of select="substring($FirstPaymentDate, 3)"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>-</xsl:otherwise>
                            </xsl:choose>
                            /
                            <xsl:choose>
                                <xsl:when
                                        test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:LastPaymentDate">
                                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:LastPaymentIndicator=1">
                                        <xsl:call-template name="russian_date">
                                            <xsl:with-param name="dateIn"
                                                            select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:LastPaymentDate"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:LastPaymentIndicator=2">
                                        <xsl:variable name="LastPaymentDate">
                                            <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn"
                                                                select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:LastPaymentDate"/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:value-of select="substring($LastPaymentDate, 3)"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>-</xsl:otherwise>
                            </xsl:choose>
                            /
                            <xsl:choose>
                                <xsl:when
                                        test="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:AgreementCurrencyCode">
                                    <xsl:apply-templates
                                            select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/SADin:ESADinMainContractTerms/catESAD_ru:DealFeatures/catESAD_ru:AgreementCurrencyCode"/>
                                </xsl:when>
                                <xsl:otherwise>-</xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:if-->
            </td>
         </tr>
         <tr>
            <td align="center" class="b" style="vertical-align: middle;">
               <b>1</b>
            </td>
            <td class="t nopadding">
               <table style="height: 100%;">
                  <tr>
                     <td class="tr" valign="top">
                        <b>29 </b> Орган въезда/выезда
                                <br/>
                        <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinConsigment/catESAD_cu:BorderCustomsOffice">
                           <xsl:if test="position() > 1">
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <xsl:value-of select="cat_ru:CustomsCountryCode"/>
                           <xsl:apply-templates select="cat_ru:Code"/>
                           <xsl:text> </xsl:text>
                           <xsl:apply-templates select="cat_ru:OfficeName"/>
                        </xsl:for-each>
                     </td>
                     <td>
                        <b>30 </b> Местонахождение товаров
                                <br/>
                        <xsl:for-each select="SADin:ESADinGoodsShipment/SADin:ESADinGoodsLocation">
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
   <xsl:template match="SADin:ESADinGoodsLocation">
      <xsl:if test="SADin:CustomsOffice">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:CustomsOffice"/>
      </xsl:if>
      <xsl:if test="SADin:CustomsCountryCode">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:CustomsCountryCode"/>
      </xsl:if>
      <xsl:if test="SADin:LocationName">
         <br/>
         <xsl:value-of select="SADin:LocationName"/>,
		</xsl:if>
      <xsl:if test="SADin:Address">
         <br/>
         <xsl:value-of select="SADin:Address/cat_ru:PostalCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:Address/cat_ru:CountryCode"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:Address/cat_ru:CounryName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:Address/cat_ru:Region"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:Address/cat_ru:City"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:Address/cat_ru:StreetHouse"/>
      </xsl:if>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="SADin:GoodsLocationWarehouse">
         <xsl:value-of select="SADin:GoodsLocationWarehouse/cat_ru:PrDocumentName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:GoodsLocationWarehouse/cat_ru:PrDocumentNumber"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:GoodsLocationWarehouse/cat_ru:PrDocumentDate"/>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="SADin:GoodsLocationPlace">
            <xsl:if test="SADin:GoodsLocationPlace/catESAD_cu:NumberCustomsZone">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="SADin:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>
            </xsl:if>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="SADin:GoodsLocationPlace">
         <!--N добавил,  как  в  примере. pdp -->
			N<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="SADin:GoodsLocationPlace/catESAD_cu:NumberCustomsZone"/>,
			</xsl:if>
      <xsl:if test="SADin:Transport">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <!--<xsl:choose>
											<xsl:when test="(number(SADout_CU:Transport/catESAD_cu:TransporKind)=1) or (SADout_CU:Transport/catESAD_cu:TransporKind='true') or (SADout_CU:Transport/catESAD_cu:TransporKind='t')">Ж/Д:</xsl:when>
											<xsl:otherwise>АВТО:</xsl:otherwise>
										</xsl:choose>-->
         <xsl:value-of select="SADin:Transport/catESAD_cu:TransporKind"/>:<xsl:for-each select="SADin:Transport/catESAD_cu:TransporIdentifier">
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
         <xsl:apply-templates select="//SADin:ESADinAutomobile"/>
      </table>
   </xsl:template>
   <xsl:template match="SADin:ESADinAutomobile">
      <tr>
         <td>
            <xsl:apply-templates select="../catESAD_cu:GoodsNumeric"/>
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
   <!--Служебные отметки по ДТ-->
   <xsl:template match="SADin:ESADinCommonOfficialMark">
      <h1>Служебные отметки по ДТ</h1>
      <table class="addInfo">
         <tr>
            <th>Номер графы</th>
            <th>Код типа инф-и</th>
            <th>Служебная запись / номер документа</th>
            <th>Дата проставления отметки / принятия решения о продлении срока проверки</th>
            <th>Время</th>
            <th>Сумма ден. средств / суммарный объем отделений ТС</th>
            <th>Код ВП</th>
            <th>% за предо- став- ление отсрочки</th>
            <th>Код валюты денежных средств / Код единицы измерения / Буквенный код страны / Буквенный код валюты (при указании фактурной стоимости) / Код основания продления срока выпуска товаров</th>
            <th>Наименование валюты / Кр наим-е ед изм</th>
            <th>ФИО инспектора</th>
            <th>ЛНП</th>
            <th>Разделение товарной партии</th>
            <!--<xsl:if test="<catESAD_ru:Code"><th>Код основания продления срока выпуска товаров</th></xsl:if>-->
         </tr>
         <tr>
            <td>
               <xsl:value-of select="catESAD_ru:GRNumber"/>
               <!--xsl:apply-templates select="catESAD_cu:GRNumber"/-->
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:InformationTypeCode"/>
            </td>
            <td>
               <xsl:if test="SADin:SolutionNumber">
                  <xsl:value-of select="SADin:SolutionNumber/cat_ru:CustomsCode"/>/
                 <xsl:call-template name="russian_date2">
                     <xsl:with-param name="dateIn" select="SADin:SolutionNumber/cat_ru:RegistrationDate"/>
                  </xsl:call-template>/
                 <xsl:value-of select="SADin:SolutionNumber/cat_ru:GTDNumber"/>/
                 <xsl:value-of select="SADin:SolutionNumber/catESAD_ru:Code"/>/
                 <xsl:value-of select="SADin:SolutionNumber/catESAD_ru:SolutionInformation"/>
                  <br/>
               </xsl:if>
               <xsl:apply-templates select="catESAD_ru:MarkDescription"/>
            </td>
            <td>
               <xsl:apply-templates mode="date" select="catESAD_ru:DateInf"/>
            </td>
            <td>
               <xsl:apply-templates mode="time" select="catESAD_ru:TimeInf"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:Amount"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:PaymentTypeCode"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:PostponementProcent"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:Code"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:CurrencyName"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:PersonName"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:LNP"/>
            </td>
            <td>
               <xsl:apply-templates mode="date" select="catESAD_ru:GoodsDevisionDate"/>
               <xsl:text> </xsl:text>
               <xsl:apply-templates mode="time" select="catESAD_ru:GoodsDevisionTime"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Товар-->
   <xsl:template match="SADin:ESADinGoods">
      <table>
         <tr>
            <td class="tr tb firstCol" rowspan="4">
               <b>31</b> Грузовые места и описание товаров</td>
            <td class="green">Маркировка и количество - Номера контейнеров - Количество и отличительные особенности</td>
            <td class="green tr tb  bl nopadding">
               <!--table>
						<tr>
							<td colspan="2"-->
               <b>32 </b> Товар
               
               <!--/td-->
               <br/>
               <!--/tr>
						<tr>
							<td align="center" class=" tb br"-->
               <span style="border-right:solid 1pt #000000">  <xsl:apply-templates select="catESAD_cu:GoodsNumeric"/>  </span>
               <!--/td>
							<td class="narrow"-->
								  <xsl:value-of select="catESAD_cu:GoodFeatures"/>
               <!--/td>
						</tr>
					</table-->
            </td>
            <td class="tb tr green">
               <b>33 </b> Код товара<br/>
               <xsl:value-of select="substring(SADin:GoodsTNVEDCode,1,10)"/>
            </td>
            <td class="nopadding tb tr" colspan="2" style="vertical-align: bottom;">
               <table>
                  <tr>
                     <td class="tr" colspan="2" style="height: 5px;"/>
                     <td class="tr"/>
                     <td/>
                  </tr>
                  <tr>
                     <td align="center" class="tr">
                        <!--xsl:value-of select="substring(SADin:GoodsTNVEDCode, 7, 2)"/-->
                     </td>
                     <td align="center" class="tr">
                        <!--xsl:value-of select="substring(SADin:GoodsTNVEDCode, 9)"/-->
                     </td>
                     <td align="center" class="tr">
                        <xsl:if test="SADin:AdditionalSign">
                           <xsl:value-of select="SADin:AdditionalSign"/>
                        </xsl:if>
                        <xsl:if test="SADin:IntellectPropertySign">
                           <xsl:value-of select="SADin:IntellectPropertySign"/>
                        </xsl:if>
                        <xsl:choose>
                           <xsl:when test="SADin:GoodsClassificationCode=1">О</xsl:when>
                        </xsl:choose>
                     </td>
                     <td align="center">
                        <xsl:choose>
                           <xsl:when test="SADin:GoodsAddTNVEDCode!=''">
                              <xsl:value-of select="SADin:GoodsAddTNVEDCode"/>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green tb" colspan="2" rowspan="3">
               <span class="graph">1)</span>
               <xsl:for-each select="catESAD_cu:GoodsDescription">
                  <xsl:value-of select="."/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </xsl:for-each>
               <xsl:for-each select="SADin:ESADElectricalEnergyQuantity">
                  <xsl:value-of select="catESAD_ru:TariffZoneName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="catESAD_ru:TextID"/>
                  <xsl:if test="catESAD_ru:Description">
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="catESAD_ru:Description"/>
                  </xsl:if>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="catESAD_ru:TransferEnergyQuantity"/>
                  <xsl:if test="catESAD_ru:QualifierCode">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_ru:QualifierCode"/>
                  </xsl:if>
                  <xsl:if test="catESAD_ru:QualifierName">
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="catESAD_ru:QualifierName"/>
                  </xsl:if>
                  <xsl:text>, </xsl:text>
               </xsl:for-each>
               <xsl:for-each select="SADin:GoodsGroupDescription">
                  <br/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:for-each select="catESAD_cu:GoodsDescription">
                     <xsl:value-of select="."/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:for-each>
                  <!--вставка!-->
                  <xsl:if test="catESAD_cu:RKTNVED">
                     <xsl:value-of select="catESAD_cu:RKTNVED"/>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:GoodsGroupInformation/catESAD_cu:Manufacturer">
                     <br/>Производитель
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
                  <br/>
                  <xsl:if test="../SADin:OilField"> Месторождения товара:
							<xsl:value-of select="../SADin:OilField"/>
                  </xsl:if>
               </xsl:for-each>
               <xsl:if test="SADin:OriginCountryName">
                  <br/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="SADin:OriginCountryName"/>
               </xsl:if>
               <xsl:if test="SADin:SupplementaryGoodsQuantity">
                  <br/>
                  <xsl:value-of select="SADin:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="SADin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="SADin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
               </xsl:if>
               <xsl:for-each select="SADin:SupplementaryGoodsQuantity1">
                  <br/>
                  <xsl:value-of select="cat_ru:GoodsQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
               </xsl:for-each>
               <xsl:if test="(SADin:BeginPeriodDate!='') or (SADin:EndPeriodDate!='')">
                  <br/>
                  <xsl:if test="SADin:BeginPeriodDate">
                     <span class="graph">Начало периода</span>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="SADin:BeginPeriodDate"/>
                     </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="SADin:EndPeriodDate">
                     <span class="graph">Окончание периода</span>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="SADin:EndPeriodDate"/>
                     </xsl:call-template>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="SADin:ESADGoodsPackaging">
                  <br/>
                  <span class="graph">2) </span>
                  <!--<xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=1">-->
                  <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PakageQuantity!=''">
                     <xsl:value-of select="SADin:ESADGoodsPackaging/catESAD_cu:PakageQuantity"/>
                     <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity">
                                        (<xsl:value-of select="SADin:ESADGoodsPackaging/catESAD_cu:PakagePartQuantity"/>-часть
                                        места)
                                    
                        <!--</xsl:if>-->
                                    ,
                                </xsl:if>
                     <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                        <xsl:for-each select="SADin:ESADGoodsPackaging/catESAD_cu:PackingInformation">
                           <xsl:value-of select="catESAD_cu:PackingCode"/>
                           <xsl:if test="catESAD_cu:PakingQuantity">
                              <span class="graph">-</span>
                              <xsl:value-of select="catESAD_cu:PakingQuantity"/>
                           </xsl:if>
                           <span class="graph">,</span>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PalleteInformation">
                                    Поддоны:
                                    <xsl:for-each select="SADin:ESADGoodsPackaging/catESAD_cu:PalleteInformation">
                           <xsl:if test="catESAD_cu:PalleteDescription">
                              <xsl:value-of select="catESAD_cu:PalleteDescription"/>
                           </xsl:if>
                           <span class="graph">,</span>
                           <xsl:value-of select="catESAD_cu:PalleteQuantity"/> /
                                        <xsl:value-of select="catESAD_cu:PalleteCode"/>
                        </xsl:for-each>
                     </xsl:if>
                     <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:UnitPackInfo">
                        <br/>2.1
                                    <xsl:for-each select="SADin:ESADGoodsPackaging/catESAD_cu:UnitPackInfo">
                           <xsl:value-of select="catESAD_cu:PackingCode"/>
                           <xsl:if test="catESAD_cu:PakingQuantity">
                              <span class="graph">-</span>
                              <xsl:value-of select="catESAD_cu:PakingQuantity"/>
                           </xsl:if>
                           <span class="graph">,</span>
                        </xsl:for-each>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=0">
                                без упаковки
                            </xsl:if>
                  <xsl:if test="SADin:ESADGoodsPackaging/catESAD_cu:PakageTypeCode=2">
                                без упаковки/
                                <xsl:for-each select="SADin:ESADGoodsPackaging/catESAD_cu:CargoInfo">
                        <xsl:value-of select="catESAD_cu:PackingCode"/>
                        <span class="graph">,</span>
                     </xsl:for-each>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="SADin:ESADContainer">
                  <br/>
                  <span class="graph">3) </span>
                  <xsl:value-of select="SADin:ESADContainer/catESAD_cu:ContainerQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:for-each select="SADin:ESADContainer/catESAD_cu:ContainerNumber">
                     <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
                     <xsl:if test="catESAD_cu:FullIndicator='2'">
                        <span class="graph">часть</span>
                     </xsl:if>
                     <span class="graph">,</span>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="SADin:ESADExcise">
                  <br/>
                  <span class="graph">4) </span>
                  <xsl:for-each select="SADin:ESADExcise">
                     <xsl:value-of select="catESAD_cu:ExciseSerieses"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:ExciseFirstNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:ExciseLastNumber"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="catESAD_cu:ExciseQuantity"/>
                     <span class="graph">;</span>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="SADin:GoodsItemDeliveryTerms">
                  <br/>
                  <span class="graph">5) </span>
                  <xsl:for-each select="SADin:GoodsItemDeliveryTerms">
                     <xsl:value-of select="cat_ru:DeliveryTermsStringCode"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:for-each select="cat_ru:DeliveryPlace"> - 
									<xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>
                     <xsl:if test="cat_ru:TransferPlace">
                        <xsl:value-of select="cat_ru:TransferPlace"/>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="SADin:CustomConditionDocuments">
                  <br/>
                  <span class="graph">6) </span>
                  <xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:RateOutputGoods">
						Норма:<xsl:value-of select="."/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:for-each>
                  <!--xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:ProcessingDocNumber">
							b<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:ProcessingDocNumber"/>
						</xsl:if>
						c<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="SADin:CustomConditionDocuments/catESAD_cu:ProcessingDocDate"/>
						</xsl:call-template>
						<br/-->
                  <!--xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:GoodsIdentificationMethod">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							e<xsl:value-of select="."/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:for-each-->
                  <xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:ProcessingProduct">
						Продукт переработки:	
							
                     <xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/> 
                     
                     <xsl:for-each select="catESAD_cu:GoodsDescription">
                        <xsl:value-of select="."/> 
							</xsl:for-each>
                     <xsl:if test="catESAD_cu:ProcessingGoodsQuantity">
                        <xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:GoodsQuantity"/> 
							<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierName"/> 
							<xsl:if test="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode">
									 (<xsl:value-of select="catESAD_cu:ProcessingGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)  
								</xsl:if>
                     </xsl:if>
                     <br/>
                  </xsl:for-each>
                  <xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:WasteProducts">
							Отходы:<xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:WasteProducts">
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
                  <xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:Heels">
							Остатки:<xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:Heels">
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
                  <br/>
                  <!--xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:ProcessingPlace">
							Место переработки:<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:ProcessingPlace"/>
						</xsl:if>
						<xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing">
							Адрес переработки:<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:PostalCode"/>&#160;
							<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:CountryCode"/>&#160;
							<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:CounryName"/>&#160;
							<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:Region"/>&#160;
							<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:City"/>&#160;
							<xsl:value-of select="SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:StreetHouse"/>&#160;
						</xsl:if>
						<xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:Organization">
							<xsl:apply-templates mode="org" select="SADin:CustomConditionDocuments/catESAD_cu:Organization"/><br/>
						</xsl:if-->
                  <!--xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:Substitute">
							Заменители:
							<xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:Substitute">
								<xsl:value-of select="."/>&#160;
							</xsl:for-each><br/>
						</xsl:if-->
                  <!--xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:ProcessingOperationDesc">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:value-of select="."/>
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						</xsl:for-each-->
                  <xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:GoodsIdentificationMethod">
                  Способ идентификации:
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="."/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:for-each>
               </xsl:if>
               <br/>
               <!--вставка!-->
               <xsl:if test="SADin:CustomConditionDocuments/catESAD_cu:Substitute">
							Сведения о замене иностранных товаров эквивалентными товарами:
							<xsl:for-each select="SADin:CustomConditionDocuments/catESAD_cu:Substitute">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="(SADin:DeliveryTime) or (SADin:DeliveryTimeEND)">
                  <br/>
                  <span class="graph">7) Поставка в течение</span>
						 <xsl:value-of select="SADin:DeliveryTime"/>
                  <xsl:if test="SADin:DeliveryTimeEND">
								- <xsl:value-of select="SADin:DeliveryTimeEND"/>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="SADin:QuantityFact">
                  <br/>
                  <span class="graph">8) </span>
                  <xsl:value-of select="SADin:QuantityFact"/>
               </xsl:if>
               <xsl:if test="SADin:GoodsSTZ">
                  <br/>
                  <span class="graph">11) </span>
                  <xsl:for-each select="SADin:GoodsSTZ">
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
                        <xsl:apply-templates select="SADin:OriginCountryCode"/>
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
                  <xsl:when test="SADin:Preferencii">
                     <xsl:apply-templates mode="commaSeparated" select="SADin:Preferencii"/>
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
                        <xsl:if test="SADin:ESADCustomsProcedure">
                           <xsl:apply-templates select="SADin:ESADCustomsProcedure/catESAD_cu:MainCustomsModeCode"/>
                           <xsl:apply-templates select="SADin:ESADCustomsProcedure/catESAD_cu:PrecedingCustomsModeCode"/>
                        </xsl:if>
                     </td>
                     <td align="center">
                        <xsl:apply-templates select="SADin:ESADCustomsProcedure/catESAD_cu:GoodsTransferFeature"/>
                     </td>
                  </tr>
               </table>
            </td>
            <td class="green tb tr">
               <b>38 </b> Вес нетто (кг)<br/>
               <xsl:value-of select="catESAD_cu:NetWeightQuantity"/>
               <xsl:if test="catESAD_cu:NetWeightQuantity2">
						/<xsl:value-of select="catESAD_cu:NetWeightQuantity2"/>
               </xsl:if>
            </td>
            <td class="tb tr">
               <b>39 </b>
               <i>Квота</i>
               <br/>
               <xsl:if test="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota">
                  <xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyName"/>
								(<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyCode"/>)
                    
                    </xsl:if>
               <br/>
               <!--xsl:if test="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
						<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasurementName"/>
								(<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
                    </xsl:if-->
               <xsl:for-each select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
                  <xsl:value-of select="catESAD_cu:QuotaQuantity"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="catESAD_cu:QuotaMeasurementName"/>
								(<xsl:value-of select="catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
                    </xsl:for-each>
               <!--xsl:choose>
                    
							<xsl:when test="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota">
								<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyQuantity"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyName"/>
								(<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADCurrencyQuota/catESAD_cu:QuotaCurrencyCode"/>)
							</xsl:when>
							<xsl:when test="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota">
								<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaQuantity"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasurementName"/>
								(<xsl:value-of select="SADin:ESADGoodsQuota/catESAD_cu:ESADProductQuantityQuota/catESAD_cu:QuotaMeasureUnitQualifierCode"/>)
							</xsl:when>
						</xsl:choose-->
            </td>
         </tr>
         <tr>
            <td class="green tl tb tr" colspan="3">
               <b>40 </b> Общая декларация / Предшествующий документ<br/>
               <xsl:for-each select="SADin:ESADinPrecedingDocument">
                  <xsl:if test="catESAD_cu:PrecedingDocumentID">
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentID"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:PrecedingDocumentName">
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentName"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </xsl:if>
                  <xsl:if test="catESAD_cu:PrecedingDocumentCustomsCode">
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentCustomsCode"/>
                     <xsl:text> / </xsl:text>
                  </xsl:if>
                  <xsl:call-template name="russian_date_gtd">
                     <xsl:with-param name="dateIn" select="catESAD_cu:PrecedingDocumentDate"/>
                  </xsl:call-template>
                  <xsl:text> / </xsl:text>
                  <xsl:if test="catESAD_cu:AddNumberPart">
                     <xsl:value-of select="catESAD_cu:AddNumberPart"/>
                  </xsl:if>
                  <xsl:value-of select="catESAD_cu:PrecedingDocumentNumber"/>
                  <xsl:if test="catESAD_cu:PrecedingDocumentGoodsNumeric">
                     <xsl:text> / </xsl:text>
                     <xsl:value-of select="catESAD_cu:PrecedingDocumentGoodsNumeric"/>,
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
               <b>44</b> Дополнит.<br/>информация/<br/>Представл.<br/>документы/<br/>Сертификаты<br/>и разрешения</td>
            <td class="tb green" colspan="2" rowspan="3">
               <xsl:if test="SADin:ESADinPresentedDocument">
                  <xsl:for-each select="SADin:ESADinPresentedDocument">
                     <xsl:value-of select="catESAD_cu:PresentedDocumentModeCode"/>
                     <xsl:if test="catESAD_cu:ProvidingIndicationMark">
						<xsl:text>/</xsl:text>
						<xsl:value-of select="catESAD_cu:ProvidingIndicationMark"/>
                     </xsl:if>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                     <xsl:if test="catESAD_cu:LicenseGoods">/<xsl:if test="catESAD_cu:LicenseGoods/catESAD_cu:AppNumber">
                           <xsl:value-of select="catESAD_cu:LicenseGoods/catESAD_cu:AppNumber"/>/</xsl:if>
                        <xsl:value-of select="catESAD_cu:LicenseGoods/catESAD_cu:GoodsNumericLic"/>
                     </xsl:if>
                     <xsl:if test="cat_ru:PrDocumentDate">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <!--xsl:if test="cat_ru:PrDocumentName">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="cat_ru:PrDocumentName"/>
                     </xsl:if-->
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
                     <xsl:if test="catESAD_cu:RegNumberDocument and catESAD_cu:ProvidingIndicationMark='2'">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text><xsl:value-of select="catESAD_cu:RegNumberDocument"/>
                        </xsl:if>
                     <xsl:if test="catESAD_cu:PresentingLackingDate and catESAD_cu:ProvidingIndicationMark='3'">
                        <xsl:text> Обязуюсь предоставить до </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:PresentingLackingDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CountryCode">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CountryCode"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:CustomsPaymentModeCodeType">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="catESAD_cu:CustomsPaymentModeCodeType"/>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TemporaryStorageImportDate">
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="catESAD_cu:TemporaryStorageImportDate"/>
                        </xsl:call-template>
                     </xsl:if>
                     <xsl:if test="catESAD_cu:TemporaryImportCode">
                        <xsl:text> /</xsl:text>
                        <xsl:value-of select="catESAD_cu:TemporaryImportCode"/>
                     </xsl:if>
                     <!--xsl:if test="catESAD_cu:SupplyStatus">
                        <xsl:text> /Опережающая поставка </xsl:text>
                     </xsl:if-->
                     <xsl:if test="catESAD_cu:SpecialSimplifiedCode">
                        <xsl:text> /</xsl:text>
                        <xsl:value-of select="catESAD_cu:SpecialSimplifiedCode"/>
                     </xsl:if>
                     <!--xsl:if test="catESAD_cu:TotalDocuments">
                        <xsl:text> </xsl:text>Общее количество документов:
									<xsl:value-of select="catESAD_cu:TotalDocuments"/>
                     </xsl:if-->
                     <!--xsl:if test="../SADin:CustomConditionDocuments/catESAD_cu:ProcessingDocNumber">
                     Предшествующие разрешения на переработку:
                        <xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:ProcessingDocNumber"/>
                     </xsl:if>
						c -->
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="../SADin:CustomConditionDocuments/catESAD_cu:ProcessingDocDate"/>
                     </xsl:call-template>
                     <br/>
                     <xsl:if test="../SADin:CustomConditionDocuments/catESAD_cu:Organization">
                        <xsl:apply-templates mode="org" select="../SADin:CustomConditionDocuments/catESAD_cu:Organization"/>
                        <br/>
                     </xsl:if>
                     <xsl:if test="../SADin:CustomConditionDocuments/catESAD_cu:ProcessingPlace">
							Место переработки:<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:ProcessingPlace"/>
                     </xsl:if>
                     <xsl:if test="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing">
							Адрес переработки:<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:PostalCode"/> 
							<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:CountryCode"/> 
							<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:CounryName"/> 
							<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:Region"/> 
							<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:City"/> 
							<xsl:value-of select="../SADin:CustomConditionDocuments/catESAD_cu:PlaceProcessing/cat_ru:StreetHouse"/> 
						</xsl:if>
                     <!--<xsl:for-each select="../SADin:CustomConditionDocuments/catESAD_cu:GoodsIdentificationMethod">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </xsl:for-each>-->
                     <br/>
                  </xsl:for-each>
               </xsl:if>
            </td>
            <td class="tl tb tr">
               <b>41 </b> Дополнит.единицы<br/>
               <xsl:choose>
                  <xsl:when test="SADin:SupplementaryGoodsQuantity">
                     <xsl:apply-templates select="SADin:SupplementaryGoodsQuantity/cat_ru:GoodsQuantity"/>
							/
							<xsl:apply-templates select="SADin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
							/
							<xsl:apply-templates select="SADin:SupplementaryGoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
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
                     <td class="tl">
                        <b>43 </b> Код МОС
							<br/>
                        <xsl:value-of select="SADin:CustomsCostCorrectMethod"/>
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
                     <td class="br green">Код ДИ</td>
                     <td>
                        <b>45 </b>Корректировка</td>
                  </tr>
                  <tr>
                     <td class="bl bb br green"/>
                     <td class="tb">
                        <xsl:apply-templates select="catESAD_cu:CustomsCost"/>
                     </td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td class="green tb"/>
            <td class="tl tb tr" colspan="2">
               <b>46 </b>Статистическая стоимость<br/>
               <xsl:apply-templates select="catESAD_cu:StatisticalCost"/>
            </td>
         </tr>
      </table>
   </xsl:template>
   <!--Служебные отметки по товарам-->
   <xsl:template name="goodsOfficialMarks">
      <xsl:if test="//SADin:ESADinGoodsOfficialMark">
         <h1>Служебные отметки по товарам</h1>
         <table class="addInfo">
            <tr>
               <th>№<br/>товара</th>
               <th>Код типа<br/>инф-и</th>
               <th>Служебная запись/<br/>номер документа</th>
               <th>Дата принятия решения о направлении требования / приостановлении выпуска товаров</th>
               <th>Время</th>
               <th>ФИО инспектора</th>
               <th>ЛНП</th>
               <th>Дата выполнения требований предоставления документов</th>
               <th>Время</th>
               <xsl:if test="//SADin:ESADinGoodsOfficialMark/SADin:Code">
                  <th>Код основания продления срока выпуска товаров</th>
               </xsl:if>
            </tr>
            <xsl:apply-templates select="//SADin:ESADinGoodsOfficialMark"/>
         </table>
      </xsl:if>
   </xsl:template>
   <!--Служебные отметки по товару-->
   <xsl:template match="SADin:ESADinGoodsOfficialMark">
      <tr>
         <td>
            <xsl:apply-templates select="../catESAD_cu:GoodsNumeric"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_cu:InformationTypeCode"/>
         </td>
         <td>
            <xsl:if test="SADin:SolutionNumber">
               <xsl:value-of select="SADin:SolutionNumber/cat_ru:CustomsCode"/>/
                 <xsl:call-template name="russian_date2">
                  <xsl:with-param name="dateIn" select="SADin:SolutionNumber/cat_ru:RegistrationDate"/>
               </xsl:call-template>/
                 <xsl:value-of select="SADin:SolutionNumber/cat_ru:GTDNumber"/>/
                 
                 <xsl:value-of select="SADin:SolutionNumber/catESAD_ru:Code"/>/
                 <xsl:value-of select="SADin:SolutionNumber/catESAD_ru:SolutionInformation"/>
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
         <xsl:if test="//SADin:ESADinGoodsOfficialMark/SADin:Code">
            <td>
               <xsl:value-of select="SADin:Code"/>
            </td>
         </xsl:if>
      </tr>
   </xsl:template>
   <!--Форматирует дату по стандартам русской локали-->
   <xsl:template match="*" mode="time">
      <xsl:value-of select="substring(., 1, 5)"/>
   </xsl:template>
   <!--Дополнительные сведения по внешнеторговым контрактам. Заполняется при подаче ВГТД-->
   <!--xsl:template match="SADin:ESADinGoods" mode="foreignTradeContracts">
        <h1>Данные по паспорту сделки товара № <xsl:apply-templates select="catESAD_ru:GoodsNumeric"/> (при подаче ВГТД)</h1>
        <table class="addInfo">
            <tr>
                <th>Номер паспорта сделки</th>
                <th style="width: 1%;">Номер внеш. торг. контракта</th>
                <th style="width: 1%;">Дата внеш. торг. контракта</th>
                <th style="width: 1%;">Наим-е банка, оформ-го паспорт сделки</th>
                <th>Описание поставки товаров</th>
                <th>Дополнения и приложения к основному контракту</th>
            </tr>
            <xsl:apply-templates select="SADin:ESADinContractList"/>
        </table>
    </xsl:template-->
   <!--Данные внешнеторгового контракта-->
   <!--xsl:template match="SADin:ESADinContractList">
        <tr>
            <td><xsl:apply-templates select="catESAD_ru:DealPassportNumber"/></td>
            <td><xsl:apply-templates select="catESAD_ru:ContractNumber"/></td>
            <td><xsl:apply-templates select="catESAD_ru:ContractDate" mode="date"/></td>
            <td><xsl:apply-templates select="catESAD_ru:BankName"/></td>
            <td><xsl:apply-templates select="catESAD_ru:SupplyInformations"/></td>
            <td><xsl:apply-templates select="catESAD_ru:AdditionalContract"/></td>
        </tr>
    </xsl:template-->
   <!--Описание поставки товаров-->
   <!--xsl:template match="catESAD_ru:SupplyInformations">
        <xsl:if test="position() > 1"><hr/></xsl:if>
        <xsl:apply-templates mode="commaSeparated"/>
    </xsl:template-->
   <xsl:template match="*" mode="commaSeparated">
      <xsl:if test="position() > 1">
         <xsl:text>, </xsl:text>
      </xsl:if>
      <xsl:apply-templates select="."/>
   </xsl:template>
   <!--Платежи по товару-->
   <xsl:template match="SADin:ESADinGoods" mode="payments">
      <table>
         <tr>
            <td class="tr tb">Вид</td>
            <td class="tr tb">Основа начисления</td>
            <td class="tr tb">Ставка</td>
            <td class="tr tb">Сумма</td>
            <td class="tb">СП</td>
         </tr>
         <xsl:apply-templates select="SADin:ESADinCustomsPaymentCalculation"/>
         <tr>
            <td class="tr" colspan="2"/>
            <td class="tr">Всего:</td>
            <td class="tr">
               <xsl:value-of select="sum(SADin:ESADinCustomsPaymentCalculation/catESAD_cu:PaymentAmount)"/>
            </td>
            <td/>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="SADin:ESADinCustomsPaymentCalculation">
      <tr>
         <td class="tr tb">
            <xsl:value-of select="catESAD_cu:PaymentModeCode"/>
         </td>
         <td class="tr tb">
            <xsl:value-of select="catESAD_cu:TaxBase"/>
            <xsl:if test="catESAD_cu:NumberGroup">
				 
					<xsl:value-of select="catESAD_cu:NumberGroup"/>
            </xsl:if>
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
            <xsl:value-of select="catESAD_cu:PaymentAmount"/>
         </td>
         <td class="tb">
            <xsl:value-of select="catESAD_cu:PaymentCode"/>
         </td>
      </tr>
   </xsl:template>
   <!--Все принятие решения по товарам-->
   <xsl:template name="goodsDecision">
      <h1>Принятые решения по товарам</h1>
      <table class="addInfo">
         <tr>
            <th>№<br/>товара</th>
            <th>Код<br/>решения</th>
            <th>Дата</th>
            <th>Время</th>
            <th>ЛНП</th>
            <th>Обоснование</th>
         </tr>
         <xsl:apply-templates select="//SADin:ESADinGoodsDecision"/>
      </table>
   </xsl:template>
   <!--Принятое решение по товару-->
   <xsl:template match="SADin:ESADinGoodsDecision">
      <tr>
         <td>
            <xsl:apply-templates select="../catESAD_cu:GoodsNumeric"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_ru:DecisionCode"/>
         </td>
         <td>
            <xsl:apply-templates mode="date" select="catESAD_ru:DateInf"/>
         </td>
         <td>
            <xsl:apply-templates mode="time" select="catESAD_ru:TimeInf"/>
         </td>
         <td>
            <xsl:apply-templates select="catESAD_ru:LNP"/>
         </td>
         <td>
            <xsl:for-each select="catESAD_ru:Foundation">
               <xsl:apply-templates select="."/> </xsl:for-each>
         </td>
      </tr>
   </xsl:template>
   <!--Принятое решение по декларации-->
   <xsl:template match="SADin:ESADinDeclarationDecision">
      <h1>Принятое решение по декларации</h1>
      <table class="addInfo">
         <tr>
            <th>Код решения</th>
            <th>Дата</th>
            <th>Время</th>
            <th>ЛНП</th>
            <th>Обоснование</th>
         </tr>
         <tr>
            <td>
               <xsl:apply-templates select="catESAD_ru:DecisionCode"/>
            </td>
            <td>
               <xsl:apply-templates mode="date" select="catESAD_ru:DateInf"/>
            </td>
            <td>
               <xsl:apply-templates mode="time" select="catESAD_ru:TimeInf"/>
            </td>
            <td>
               <xsl:apply-templates select="catESAD_ru:LNP"/>
            </td>
            <td>
               <xsl:for-each select="catESAD_ru:Foundation">
                  <xsl:apply-templates select="."/> </xsl:for-each>
            </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template match="*" mode="date">
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="."/>
      </xsl:call-template>
   </xsl:template>
   <!--Организация (например, отправитель или получатель)-->
   <xsl:template match="*" mode="org">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <span class="graph">(</span>
         <xsl:value-of select="cat_ru:ShortName"/>
         <span class="graph">)</span>
      </xsl:if>
      <xsl:if test="SADin:ContractorIndicator='1'"> 'контрагент'</xsl:if>
      <xsl:if test="SADin:ContractorIndicator='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
      <br/>
      <xsl:if test="catESAD_ru:Address/cat_ru:PostalCode">
         <xsl:value-of select="catESAD_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
      <!--<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,-->
      <xsl:value-of select="catESAD_ru:Address/cat_ru:CounryName"/> 
        <xsl:if test="catESAD_ru:Address/cat_ru:Region">
         <xsl:value-of select="catESAD_ru:Address/cat_ru:Region"/>,
        </xsl:if>
      <xsl:if test="catESAD_ru:Address/cat_ru:City">
         <xsl:value-of select="catESAD_ru:Address/cat_ru:City"/>,
        </xsl:if>
      <xsl:value-of select="catESAD_ru:Address/cat_ru:StreetHouse"/>
      <xsl:if test="SADin:BranchDescription">
         <br/>
         <xsl:value-of select="SADin:BranchDescription/cat_ru:OrganizationName"/>
         <br/>
         <xsl:if test="SADin:BranchDescription/cat_ru:Address/cat_ru:PostalCode">
            <xsl:value-of select="SADin:BranchDescription/cat_ru:Address/cat_ru:PostalCode"/>,
			</xsl:if>
         <!--<xsl:apply-templates select="SADout_CU:BranchDescription/cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,-->
         <xsl:value-of select="SADin:BranchDescription/cat_ru:Address/cat_ru:CounryName"/> 
			<xsl:if test="SADin:BranchDescription/cat_ru:Address/cat_ru:Region">
            <xsl:value-of select="SADin:BranchDescription/cat_ru:Address/cat_ru:Region"/>,
			</xsl:if>
         <xsl:if test="SADin:BranchDescription/cat_ru:Address/cat_ru:City">
            <xsl:value-of select="SADin:BranchDescription/cat_ru:Address/cat_ru:City"/>,
			</xsl:if>
         <xsl:value-of select="SADin:BranchDescription/cat_ru:Address/cat_ru:StreetHouse"/>
      </xsl:if>
      <!--xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
         <br/>
         <xsl:text>№ </xsl:text>
         <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
            <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
         </xsl:if>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
            <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         </xsl:if>
      </xsl:if-->
      <!--xsl:choose>
			<xsl:when test="(cat_ru:INN != '') or (cat_ru:KPP != '')">
				<br/>
				<xsl:text>№ </xsl:text>
				<xsl:if test="cat_ru:INN!=''">
					<xsl:value-of select="cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:KPP!=''">
					<xsl:text> / </xsl:text>
					<xsl:value-of select="cat_ru:KPP"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose-->
      <br/>
      <!--<xsl:apply-templates mode="commaSeparated" select="*"/>-->
      <xsl:if test="SADin:Contact">
         <br/>
      Контактные сведения:
		<xsl:for-each select="SADin:Contact/cat_ru:Phone">тел.:<xsl:value-of select="."/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </xsl:for-each>
         <xsl:if test="SADin:Contact/cat_ru:Fax">факс: <xsl:value-of select="SADin:Contact/cat_ru:Fax"/> </xsl:if>
         <xsl:if test="SADin:Contact/cat_ru:Telex">телекс: <xsl:value-of select="SADin:Contact/cat_ru:Telex"/> </xsl:if>
         <xsl:for-each select="SADin:Contact/cat_ru:E_mail">эл. почта: <xsl:value-of select="."/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </xsl:for-each>
      </xsl:if>
      <!--<xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <span class="graph">(</span>
         <xsl:value-of select="cat_ru:ShortName"/>
         <span class="graph">)</span>
      </xsl:if>
      <br/>
      <xsl:if test="SADin:ContractorIndicator='1'"> 'контрагент'</xsl:if>
      <xsl:if test="SADin:ContractorIndicator='2'"> 'РАЗНЫЕ ПО СПИСКУ'</xsl:if>
      <xsl:if test="catESAD_ru:Address | cat_ru:Address/cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:Address | catESAD_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
      <xsl:apply-templates select="catESAD_ru:Address | cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,
        <xsl:if test="catESAD_ru:Address | cat_ru:Address/cat_ru:Region">
         <xsl:value-of select="catESAD_ru:Address | cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
      <xsl:if test="catESAD_ru:Address | cat_ru:Address/cat_ru:City">
         <xsl:value-of select="catESAD_ru:Address | cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
      <xsl:value-of select="catESAD_ru:Address | cat_ru:Address/cat_ru:StreetHouse"/>
      <xsl:if test="SADin:BranchDescription">
         <br/>
         <xsl:for-each select="SADin:BranchDescription">
			Филиал:<xsl:value-of select="catESAD_ru:OrganizationName | cat_ru:OrganizationName"/>
            <br/>
            <xsl:if test="catESAD_ru:Address | cat_ru:Address/cat_ru:PostalCode">
               <xsl:value-of select="catESAD_ru:Address | cat_ru:Address/cat_ru:PostalCode"/>,
			</xsl:if>
            <xsl:apply-templates select="catESAD_ru:Address | cat_ru:Address/cat_ru:CountryCode | catESAD_cu:CountryCode"/>,
			<xsl:if test="catESAD_ru:Address | cat_ru:Address/cat_ru:Region">
               <xsl:value-of select="catESAD_ru:Address | cat_ru:Address/cat_ru:Region"/>,
			</xsl:if>
            <xsl:if test="catESAD_ru:Address | cat_ru:Address/cat_ru:City">
               <xsl:value-of select="catESAD_ru:Address | cat_ru:Address/cat_ru:City"/>,
			</xsl:if>
            <xsl:value-of select="cat_ru:Address/cat_ru:StreetHouse"/>
         </xsl:for-each>
      </xsl:if>
      <xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
         <br/>
         <xsl:text>№ </xsl:text>
         <xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
            <xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
         </xsl:if>
         <xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
            <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
         </xsl:if>
         <br/>
         <xsl:apply-templates mode="spaceSeparated" select="cat_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="catESAD_ru:ITN">
			ИТН:<xsl:value-of select="catESAD_ru:ITN"/>
      </xsl:if>
      <xsl:if test="catESAD_ru:OKATO">
			ОКАТО:<xsl:value-of select="catESAD_ru:OKATO"/>
      </xsl:if>
      <xsl:if test="SADin:BowelsINN">
         <xsl:value-of select="SADin:BowelsINN"/>
      </xsl:if>
      <xsl:if test="SADin:BowelsOKPO">
         <xsl:value-of select="SADin:BowelsOKPO"/>
      </xsl:if>
      <xsl:if test="SADin:Contact"><br/>
      Контактные сведения:
		<xsl:for-each select="SADin:Contact/cat_ru:Phone">тел.:<xsl:value-of select="."/>
		<xsl:if test="position()!=last()">,&#160;</xsl:if>
		</xsl:for-each>
		<xsl:if test="SADin:Contact/cat_ru:Fax">факс: <xsl:value-of select="SADin:Contact/cat_ru:Fax"/>&#160;</xsl:if>
		<xsl:if test="SADin:Contact/cat_ru:Telex">телекс: <xsl:value-of select="SADin:Contact/cat_ru:Telex"/>&#160;</xsl:if>
		<xsl:for-each select="SADin:Contact/cat_ru:E_mail">эл. почта: <xsl:value-of select="."/>
		<xsl:if test="position()!=last()">,&#160;</xsl:if>
		</xsl:for-each>
		</xsl:if>
   </xsl:template>
   <xsl:template match="catESAD_ru:IdentityCard">
      <xsl:apply-templates mode="commaSeparated" select="*"/>-->
   </xsl:template>
   <xsl:template match="catESAD_ru:IdentityCard">
      <xsl:apply-templates mode="commaSeparated" select="*"/>--&gt;
   </xsl:template>
   <!--xsl:template match="SADin:ESADinLoadingPlace">
        <xsl:apply-templates select="catESAD_ru:InformationTypeCode"/>
        <xsl:text> </xsl:text>
        <xsl:if test="catESAD_ru:InformationTypeCode = 31">
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
        <xsl:if test="position() > 1"><xsl:text>, </xsl:text></xsl:if>
        <xsl:if test="catESAD_ru:GoodsLoadingPlaceDesc">
            <xsl:apply-templates select="catESAD_ru:GoodsLoadingPlaceDesc"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:apply-templates select="catESAD_ru:CustomsOfficeID"/>
    </xsl:template-->
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
</xsl:stylesheet>
