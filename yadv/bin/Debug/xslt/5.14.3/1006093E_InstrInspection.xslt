<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="ii cat_ru catESAD_ru" version="1.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ii="urn:customs.ru:Information:CustomsDocuments:InstrInspection:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
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
   <xsl:template match="ii:InstrInspection">
      <html>
         <head>
            <title>Информация  о необходимости проведения таможенного контроля</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
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
				<h2>
				<xsl:choose>
					<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Уведомление о проведении таможенного осмотра</xsl:when>
					<xsl:otherwise>Поручение на проведение досмотра</xsl:otherwise>
				</xsl:choose>
				</h2>
               <br/>
               <table border="0" cellpadding="3" cellspacing="0" width="100%">
                  <tbody>
                     <tr>
                        <td class="graphNo" colspan="2" style="width:180mm;">
									<xsl:choose>
										<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Дата проведения осмотра </xsl:when>
										<xsl:otherwise>Дата проведения досмотра </xsl:otherwise>
									</xsl:choose>
									<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ii:InspectionDate"/>
                           </xsl:call-template>
                           <br/>
                           <xsl:if test="ii:InspectionTime">
									<xsl:choose>
										<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Время, до которого должен быть проведен осмотр </xsl:when>
										<xsl:otherwise>Время, до которого должен быть проведен досмотр </xsl:otherwise>
									</xsl:choose>
									<xsl:value-of select="ii:InspectionTime"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">
									<xsl:choose>
										<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Должностные лица, назначенные на проведение таможенного осмотра: </xsl:when>
										<xsl:otherwise>Должностные лица, назначенные на проведение таможенного досмотра: </xsl:otherwise>
									</xsl:choose>
							</span> 
									<xsl:for-each select="ii:CustomsPersons">
                              <xsl:value-of select="cat_ru:PersonName"/>
                              <xsl:if test="cat_ru:LNP">(<xsl:value-of select="cat_ru:LNP"/>)</xsl:if>
                              <xsl:if test="position()!=last()">, </xsl:if>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <xsl:if test="ii:InstrNumber">
                        <tr>
                           <td class="graphNo" style="width:120mm;">
										Регистрационный номер документа:
									</td>
                           <td class="graph" style="width:60mm;">
                              <xsl:value-of select="ii:InstrNumber/cat_ru:CustomsCode"/>
                              <xsl:text> / </xsl:text>
                              <xsl:call-template name="russian_date_gtd">
                                 <xsl:with-param name="dateIn" select="ii:InstrNumber/cat_ru:RegistrationDate"/>
                              </xsl:call-template>
                              <xsl:text> / </xsl:text>
                              <xsl:value-of select="ii:InstrNumber/cat_ru:GTDNumber"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graphNo" style="width:120mm;">
									<xsl:choose>
										<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Номер декларации на товары, по которой необходимо произвести осмотр товаров </xsl:when>
										<xsl:otherwise>Номер документа (ДТ/Заявления), по которому необходимо произвести досмотр товаров </xsl:otherwise>
									</xsl:choose>
								</td>
                        <td class="graph" style="width:60mm;">
                           <xsl:value-of select="ii:DTNumber/cat_ru:CustomsCode"/>
                           <xsl:text> / </xsl:text>
                           <xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="ii:DTNumber/cat_ru:RegistrationDate"/>
                           </xsl:call-template>
                           <xsl:text> / </xsl:text>
                           <xsl:if test="ii:DTNumber/ii:AddNumber">
							   <xsl:value-of select="ii:DTNumber/ii:AddNumber"/>
                           </xsl:if>
                           <xsl:value-of select="ii:DTNumber/cat_ru:GTDNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
									Дата создания документа:<xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="ii:InstrInfo/ii:InstrDate"/>
                           </xsl:call-template>
									Время создания документа <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="ii:InstrInfo/ii:InstrTime"/>
                           <xsl:if test="ii:FormSign">
                           <br/>
                           Форма контроля:<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">осмотр</xsl:when>
									<xsl:otherwise>досмотр</xsl:otherwise>
								</xsl:choose>
                           </xsl:if>
                        </td>
                     </tr>
                     <xsl:if test="ii:Declarant">
						<tr>
							<td class="graph" colspan="2" style="width:180mm;">
							   <span class="graphNo">Декларант товаров</span>
							   <xsl:apply-templates select="ii:Declarant"/>
							</td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Объект осмотра: </xsl:when>
									<xsl:otherwise>Объект досмотра: </xsl:otherwise>
								</xsl:choose>
                           </span>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="ii:InspectionObject/ii:ObjectType=1">
									 товар
									</xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:ObjectType=2">
									 транспортное средство
									</xsl:if>
                           <br/>
                           <span class="graphNo">Страна отправителя:</span>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="ii:InspectionObject/ii:ConsigCountryName">
                              <xsl:value-of select="ii:InspectionObject/ii:ConsigCountryName"/>
                           </xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:ConsigCountryCode">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="ii:InspectionObject/ii:ConsigCountryCode"/>)
									</xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:DeliveryPlace">
                              <br/>
                              <span class="graphNo"> Место доставки: </span>
                              <xsl:value-of select="ii:InspectionObject/ii:DeliveryPlace"/>
                           </xsl:if>
                           <br/>
                           <span class="graphNo">Страна назначения:</span>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="ii:InspectionObject/ii:DelivCountryName">
                              <xsl:value-of select="ii:InspectionObject/ii:DelivCountryName"/>
                           </xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:DelivCountryCode">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="ii:InspectionObject/ii:DelivCountryCode"/>)
									</xsl:if>
                           <br/>
                           <span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Код таможенного органа осмотра: </xsl:when>
									<xsl:otherwise>Код таможенного органа досмотра: </xsl:otherwise>
								</xsl:choose>
                           </span>
                           <xsl:value-of select="ii:InspectionObject/ii:InspCustCode"/>
                           <br/>
                           <xsl:if test="ii:InspectionObject/ii:InspDescription">
                              <span class="graphNo">Дополнительные сведения: </span>
                              <xsl:for-each select="ii:InspectionObject/ii:InspDescription">
                                 <xsl:value-of select="."/>
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </xsl:for-each>
                              <br/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Сведения о лице, обладающем полномочиями в отношении товаров и (или) транспортных средств</span>
                           <xsl:apply-templates select="ii:InspectionObject/ii:PersonInspection"/>
                        </td>
                     </tr>
                     <xsl:if test="ii:InspectionObject/ii:InspTransportMeans">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <br/>
                              <span class="graphNo">Транспортные средства/контейнеры </span>
                           </td>
                        </tr>
                        <xsl:if test="ii:InspectionObject/ii:InspTransportMeans/ii:TransportMeans">
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <span class="graphNo">Сведения о транспортном средстве: </span>
                              </td>
                           </tr>
                           <xsl:if test="(ii:InspectionObject/ii:InspTransportMeans/ii:TransportMeans/cat_ru:TransportModeCode) or (ii:InspectionObject/ii:InspTransportMeans/ii:TransportMeans/cat_ru:TransportNationalityCode)">
                              <tr>
                                 <td class="graph" colspan="2" style="width:180mm;">
                                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                       <tbody>
                                          <tr>
                                             <td align="center" class="graph" style="width:90mm;">Код вида транспортного средства по классификатору видов транспорта и транспортировки товаров</td>
                                             <td align="center" class="graph" style="width:90mm;">Буквенный код страны принадлежности транспортных средств по классификатору стран мира</td>
                                          </tr>
                                          <tr>
                                             <td align="center" class="graph">
                                                <xsl:value-of select="ii:InspectionObject/ii:InspTransportMeans/ii:TransportMeans/cat_ru:TransportModeCode"/>
                                             </td>
                                             <td align="center" class="graph">
                                                <xsl:value-of select="ii:InspectionObject/ii:InspTransportMeans/ii:TransportMeans/cat_ru:TransportNationalityCode"/>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="2" height="15px"/>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:30mm;">Идентификатор (номер) транспортного средства</td>
                                          <td align="center" class="graph" style="width:30mm;">Код марки транспортного средства</td>
                                          <td align="center" class="graph" style="width:30mm;">Код транспортного средства</td>
                                          <td align="center" class="graph" style="width:30mm;">Код страны принадлежности транспортного средства</td>
                                          <!--td style="width:30mm;" class="graph" align="center">Признак транспортного средства (основное/прицепное)</td-->
                                       </tr>
                                       <xsl:for-each select="ii:InspectionObject/ii:InspTransportMeans/ii:TransportMeans/ii:TransportMean">
                                          <tr>
                                             <td align="center" class="graph" style="width:30mm;">
                                                <xsl:value-of select="cat_ru:TransportIdentifier"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:30mm;">
                                                <xsl:value-of select="cat_ru:TransportMarkCode"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:30mm;">
                                                <xsl:value-of select="cat_ru:TransportKindCode"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <td align="center" class="graph" style="width:30mm;">
                                                <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                             <!--td style="width:30mm;" class="graph" align="center">
																<xsl:if test="cat_ru:TransportSign='true'">
															основное
															</xsl:if>
																<xsl:if test="cat_ru:TransportSign='false'"> прицепное</xsl:if>
															</td-->
                                          </tr>
                                       </xsl:for-each>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="ii:InspectionObject/ii:InspTransportMeans/ii:InspContainer">
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <span class="graphNo">Сведения о контейнерах: </span>
                              </td>
                           </tr>
                           <tr>
                              <td class="graph" colspan="2" style="width:180mm;">
                                 <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:90mm;">Номер (идентификатор) контейнера</td>
                                          <td align="center" class="graph" style="width:90mm;">Признак заполнения контейнера</td>
                                       </tr>
                                       <xsl:for-each select="ii:InspectionObject/ii:InspTransportMeans/ii:InspContainer">
                                          <tr>
                                             <td align="center" class="graph" style="width:90mm;">
                                                <xsl:value-of select="catESAD_cu:ContainerIdentificaror"/>
                                             </td>
                                             <td align="center" class="graph" style="width:90mm;">
                                                <xsl:if test="catESAD_cu:FullIndicator=1">
																	Товар занимает весь контейнер.
																</xsl:if>
                                                <xsl:if test="catESAD_cu:FullIndicator=2">
																	Товар занимает часть контейнера.
																</xsl:if>
                                                <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                             </td>
                                          </tr>
                                       </xsl:for-each>
                                    </tbody>
                                 </table>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:if>
                     <xsl:if test="ii:InspectionObject/ii:InspDocuments">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <br/>
                              <span class="graphNo">Сведения о документах: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:80mm;">Наименование документа</td>
                                       <td align="center" class="graph" style="width:40mm;">Номер документа</td>
                                       <td align="center" class="graph" style="width:30mm;">Дата документа</td>
                                       <td align="center" class="graph" style="width:30mm;">Код вида документа</td>
                                    </tr>
                                    <xsl:for-each select="ii:InspectionObject/ii:InspDocuments">
                                       <tr>
                                          <td align="center" class="graph" style="width:80mm;">
                                             <xsl:value-of select="cat_ru:PrDocumentName"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:40mm;">
                                             <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:call-template name="russian_date">
                                                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                             </xsl:call-template>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                          <td align="center" class="graph" style="width:30mm;">
                                             <xsl:value-of select="ii:PresentedDocumentModeCode"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ii:InspectionObject/ii:RiskProfile">
                        <tr>
                           <td class="graph" colspan="2">
                              <span class="graphNo">Номер профиля риска: </span>
                              <xsl:for-each select="ii:InspectionObject/ii:RiskProfile">
                                 <xsl:value-of select="ii:RiskProfileKind"/>/<xsl:value-of select="ii:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                                    <xsl:with-param name="dateIn" select="ii:RegistryDate"/>
                                 </xsl:call-template>/<xsl:value-of select="ii:SequenceNumber"/>
                                 <xsl:if test="ii:DescriptionMeasure">
									 /примечание к мере профиля риска: <xsl:value-of select="ii:DescriptionMeasure"/>
                                 </xsl:if>
                                 <xsl:if test="position()!=last()">; </xsl:if>
                              </xsl:for-each>
                              <xsl:choose>
                                 <xsl:when test="(ii:ShortFormSign='1') or (ii:ShortFormSign='t') or (ii:ShortFormSign='true')"> - возможно составление описательной части АТДО в сокращенной форме.</xsl:when>
                                 <xsl:otherwise/>
                              </xsl:choose>
                           </td>
                        </tr>
                     </xsl:if>
                     <xsl:if test="ii:InspectionObject/ii:PresenceNecessityList">
                        <tr>
							<td class="graph" colspan="2">
							<span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Перечень лиц, присутствие (участие) которых необходимо при (в) проведении таможенного осмотра: </xsl:when>
									<xsl:otherwise>Перечень лиц, присутствие (участие) которых необходимо при (в) проведении таможенного досмотра: </xsl:otherwise>
								</xsl:choose>
							</span>
							<xsl:for-each select="ii:InspectionObject/ii:PresenceNecessityList">
							   <br/>Наименование таможенного органа (иного контролирующего органа/организации): <xsl:apply-templates select="ii:ControlOrganization"/>
							    <br/>
							    <xsl:for-each select="ii:ControlPerson">
							     <xsl:apply-templates select="."/>
							    <xsl:if test="ii:Contact">
		                        (контактные сведения:
		                        <xsl:for-each select="ii:Contact">
		                        <xsl:if test="cat_ru:Phone">тел.: <xsl:for-each select="cat_ru:Phone"><xsl:value-of select="."/><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each></xsl:if>
		                        <xsl:if test="cat_ru:Fax">факс: <xsl:value-of select="cat_ru:Fax"/>&#160;</xsl:if>
		                        <xsl:if test="cat_ru:Telex">телекс: <xsl:value-of select="cat_ru:Telex"/>&#160;</xsl:if>
		                        <xsl:if test="cat_ru:E_mail">эл. почта: <xsl:for-each select="cat_ru:E_mail"><xsl:value-of select="."/><xsl:if test="position()!=last()">,&#160;</xsl:if></xsl:for-each></xsl:if></xsl:for-each>)
		                        </xsl:if><xsl:if test="position()!=last()">; </xsl:if>
							    </xsl:for-each>
							    <xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
							</td>
						</tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <br/>
                           <span class="graphNo">Сведения о товарах: </span>
							<table border="1" cellpadding="3" cellspacing="0" width="100%">
                                    <tbody>
                                       <tr>
                                          <td align="center" class="graph" style="width:30mm;">Номер товара</td>
                                          <td align="center" class="graph" style="width:30mm;">Описание</td>
                                          <td align="center" class="graph" style="width:30mm;">Сопроводительный документ</td>
                                          <td align="center" class="graph" style="width:30mm;">Кол-во грузовых мест</td>
                                          <td align="center" class="graph" style="width:30mm;">Вес брутто (кг)</td>
                                          <td align="center" class="graph" style="width:30mm;">Вес нетто (кг)</td>
                                       </tr>
                                       <xsl:for-each select="ii:InspectionObject/ii:InspGoods">
										    <tr>
												<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:GoodsNumeric"/></td>
												<td align="center" class="graph" style="width:30mm;"><xsl:apply-templates select="ii:GoodsDescription"/></td>
												<td align="center" class="graph" style="width:30mm;">
													<xsl:for-each select="ii:BillDoc/*">
														<xsl:choose>
															<xsl:when test="contains(local-name(.),'Date')">
																<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
															</xsl:when>
															<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
														</xsl:choose>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</td>
												<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:PakageQuantity"/></td>
												<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:GrossWeightQuantity"/></td>
												<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:NetWeightQuantity"/></td>
											</tr>
                                       </xsl:for-each>
                                       <tr>
											<td class="graph" colspan="3"></td>
											<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:InspectionObject/ii:PakageQuantity"/></td>
											<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:InspectionObject/ii:GrossWeightQuantity"/></td>
											<td align="center" class="graph" style="width:30mm;"><xsl:value-of select="ii:InspectionObject/ii:NetWeightQuantity"/></td>
										</tr>
                                    </tbody>
                            </table>
                        </td>
                     </tr>
                     <xsl:if test="ii:InspectionObject/ii:InspGoodsLocation">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <br/>
                              <span class="graphNo">Местонахождение товаров: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <xsl:apply-templates select="ii:InspectionObject/ii:InspGoodsLocation"/>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <br/>
                           <span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Сведения об особенностях осмотра </xsl:when>
									<xsl:otherwise>Сведения об особенностях досмотра </xsl:otherwise>
								</xsl:choose>
                           </span>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Цель осмотра: </xsl:when>
									<xsl:otherwise>Цель досмотра: </xsl:otherwise>
								</xsl:choose>
                           </span>
                           <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:GoodsIdent=1) or (ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:GoodsIdent='t') or (ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:GoodsIdent='true')">
											Идентификация товаров.
										</xsl:if>
                           <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:SpotCheck=1) or (ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:SpotCheck='t') or (ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:SpotCheck='true')">
											Выборочная проверка.
										</xsl:if>
                           <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:OtherGoals=1) or (ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:OtherGoals='t') or (ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:OtherGoals='true')">
											Прочее.
										</xsl:if>
                           <xsl:for-each select="ii:InspectionObject/ii:InspDetails/ii:InspGoal/ii:GoalsDesc">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Объем осмотра: </xsl:when>
									<xsl:otherwise>Объем досмотра: </xsl:otherwise>
								</xsl:choose>
                           </span>
                           <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspEffort/ii:EffortPercent=1">
											10%.
										</xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspEffort/ii:EffortPercent=2">
											50%.
										</xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspEffort/ii:EffortPercent=3">
											100%.
										</xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">
								<xsl:choose>
									<xsl:when test="ii:FormSign='0' or ii:FormSign='false' or ii:FormSign='f' or ii:FormSign='FALSE'">Степень осмотра: </xsl:when>
									<xsl:otherwise>Степень досмотра: </xsl:otherwise>
								</xsl:choose>
                           </span>
                           <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:WithdrWeight=2">
											Выборочное взвешивание.
										</xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:WithdrWeight=1">
											Полное взвешивание.
										</xsl:if>
                           <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:WithdrWeight=3">
											Без взвешивание.
										</xsl:if>
                           <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:OtherLevel=1) or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:OtherLevel='t') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:OtherLevel='true')">
											Прочее.
										</xsl:if>
                           <xsl:for-each select="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:LevelDescription">
                              <xsl:value-of select="."/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </xsl:for-each>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Пересчет грузовых мест: </span>
                           <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountPack/ii:ReCount=1) or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountPack/ii:ReCount='t') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountPack/ii:ReCount='true')">
                              <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountPack/ii:WSelectOpenFlag">
												с частичным вскрытием.
											</xsl:if>
                              <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountPack/ii:WFullOpenFlag">
												со вскрытием всех грузовых мест.
											</xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Пересчет количества предметов в грузовых местах: </span>
                           <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountItem/ii:ReCountGoods=1) or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountItem/ii:ReCountGoods='t') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountItem/ii:ReCountGoods='true')">
                              <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountItem/ii:SelectPackFlag">
												пересчет выборочно.
											</xsl:if>
                              <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:ReCountItem/ii:FullCountFlag">
												пересчет во всех грузовых местах.
											</xsl:if>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                      <!--<td align="left" class="normal2" style="width:2mm">
                      [<xsl:choose>
						<xsl:when test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding">X</xsl:when>
						<xsl:otherwise>-</xsl:otherwise>
					</xsl:choose>]</td>-->
                        <td class="graph" style="width:180mm;" colspan="2">
                           [<xsl:choose>
						<xsl:when test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding">X</xsl:when>
						<xsl:otherwise>-</xsl:otherwise>
					</xsl:choose>]&#160;<span class="graphNo">Измерение и определение характеристик товаров <xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='0') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='f') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='false')"><u>(с частичной разборкой</u>/ с полной разборкой): </xsl:if><xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='1') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='t') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='true')">(с частичной разборкой/<u> с полной разборкой</u>): </xsl:if> </span>
                           <!--<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods=1) or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='t') or (ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:FeatureFindingGoods='true')">-->
                              <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:WTakeSampleFlag">
												Измерение и определение характеристик товаров со взятием проб и образцов.
											</xsl:if>
                              <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:InspLavel/ii:FeatureFinding/ii:NoTakeSampleFlag">
												Измерение и определение характеристик товаров без взятия проб и образцов.
											</xsl:if>
                     <!--      </xsl:if>-->
                        </td>
                     </tr>
                     <!--tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<br/>
										<span class="graphNo">Применение ТСТК:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:NoTSTKFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UNoTSTKFlag='true')">
											без применения ТСТК.
										</xsl:if>
									</td>
								</tr-->
                     <!--tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение средств дозиметрического контроля:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DosimetryControlFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DosimetryControlFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DosimetryControlFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DosimetryControlFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr-->
                     <!--tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение рентгеноустановки:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:X-rayMachineFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:X-rayMachineFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:X-rayMachineFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:X-rayMachineFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение металлодетектора (портативного, стационарного):</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:MetalLocatorFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:MetalLocatorFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:MetalLocatorFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:MetalLocatorFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение средств идентификации документов, денежных знаков, ценных бумаг и валюты:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DocumentIdentFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DocumentIdentFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DocumentIdentFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DocumentIdentFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение средств идентификации драгоценных металлов и камней:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:GemIdentFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:GemIdentFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:GemIdentFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:GemIdentFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение средствдистанционного обнаружения и идентификации наркотических веществ:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DrugIdentFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DrugIdentFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DrugIdentFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:DrugIdentFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение фото-, аудио-, видеозаписывающей и др. аппаратуры:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseMediaFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseMediaFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseMediaFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseMediaFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="width:180mm;" class="graph" colspan="2">
										<span class="graphNo">Применение щупов, досмотровых зеркал, наборов инструментов:</span>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseToolsFlag=1) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseToolsFlag='true')">
											да.
										</xsl:if>
										<xsl:if test="(ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseToolsFlag=0) or (ii:InspectionObject/ii:InspDetails/ii:UseTSTK/ii:UseToolsFlag='false')">
											нет.
										</xsl:if>
									</td>
								</tr-->
                     <table border="0" style="width:190mm">
                        <tbody>
                           <tr>
                              <td style="width:2mm">
                                 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              </td>
                              <td class="graph10Bold" style="width:188mm">
                                    Применение ТСТК:
                                </td>
                           </tr>
                           <xsl:for-each select="ii:InspectionObject/ii:InspDetails">
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '01'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '01')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 1 досмотровая рентгенотелевизионная техника:
											<xsl:if test="ii:UseTSTK[ii:TSTKCode= '01']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '01']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '02'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '02')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 2 флюороскопическая досмотровая техника:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '02']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '02']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '03'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '03')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 3 инспекционно-досмотровые комплексы:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '03']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '03']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '04'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '04')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 4 средства поиска:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '04']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '04']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '05'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '05')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 5 редства нанесения и считывания специальных меток:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '05']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '05']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '06'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '06')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 6 досмотровый инструмент:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '06']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '06']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '08'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '08')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 8 технические средства подповерхностного зондирования:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '08']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '08']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '09'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '09')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 9 технические средства идентификации:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '09']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '09']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '10'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '10')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 10 химические средства идентификации:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '10']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '10']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '11'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '11')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 11 технические средства документирования:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '11']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '11']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '12'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '12')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 12 технические средства контроля носителей аудио- и видеоинформации:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '12']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '12']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '13'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '13')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 13 технические средства таможенного контроля количественных и качественных показателей лесо- и пиломатериалов:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '13']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '13']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '14'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '14')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 14 приборы взвешивания:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '14']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '14']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '15'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '15')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">- 15 технические средства таможенного контроля делящихся и радиоактивных материалов и обеспечения радиационной безопасности:
												<xsl:if test="ii:UseTSTK[ii:TSTKCode= '15']/ii:Comments">
                                       <u>
                                          <xsl:for-each select="ii:UseTSTK[ii:TSTKCode= '15']/ii:Comments">
                                             <xsl:value-of select="."/>
                                          </xsl:for-each>
                                       </u>
                                    </xsl:if>
                                 </td>
                              </tr>
                              <tr>
                                 <td align="left" class="normal2" style="width:8mm">[<xsl:if test="ii:UseTSTK/ii:TSTKCode= '16'">X</xsl:if><xsl:if test="not(ii:UseTSTK/ii:TSTKCode= '16')">–</xsl:if>]</td>
                                 <td class="graphMain" style="width:188mm">
																	- 16 без применения технических средств таможенного контроля
																</td>
                              </tr>
                           </xsl:for-each>
                        </tbody>
                     </table>
                     <xsl:if test="ii:VOIActNumber">
						 <br/>
						 <table border="0" style="width:190mm">
							<tr>
							   <td class="graphNo" style="width:120mm;">Регистрационный номер акта осмотра с ИДК:</td>
							   <td class="graph" style="width:60mm;">
								   <xsl:for-each select="ii:VOIActNumber">
									  <xsl:value-of select="cat_ru:CustomsCode"/>
									  <xsl:text> / </xsl:text>
									  <xsl:call-template name="russian_date_gtd">
										 <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
									  </xsl:call-template>
									  <xsl:text> / </xsl:text>
									  <xsl:value-of select="cat_ru:GTDNumber"/>
								  </xsl:for-each>
							   </td>
							</tr>
						 </table>   
                     </xsl:if>
                     <xsl:if test="ii:InspectionObject/ii:InspDetails/ii:UseIdent">
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <br/>
                              <span class="graphNo">Применение средств идентификации: </span>
                           </td>
                        </tr>
                        <tr>
                           <td class="graph" colspan="2" style="width:180mm;">
                              <table border="1" cellpadding="3" cellspacing="0" width="100%">
                                 <tbody>
                                    <tr>
                                       <td align="center" class="graph" style="width:90mm;">Описание средства идентификации</td>
                                       <td align="center" class="graph" style="width:90mm;">Количество средств идентификации</td>
                                    </tr>
                                    <xsl:for-each select="ii:InspectionObject/ii:InspDetails/ii:UseIdent/ii:IdentUnit">
                                       <tr>
                                          <td align="center" class="graph" style="width:90mm;">
                                             <xsl:value-of select="ii:IdentDescription"/>
                                          </td>
                                          <td align="center" class="graph" style="width:90mm;">
                                             <xsl:value-of select="ii:IdentQuantity"/>
                                             <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                          </td>
                                       </tr>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <br/>
                           <span class="graphNo">Должностное лицо:</span>
                           <xsl:value-of select="ii:InstrInfo/ii:CustomsOfficer/cat_ru:PersonName"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:value-of select="ii:InstrInfo/ii:CustomsOfficer/ii:PersonPost"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="ii:InstrInfo/ii:CustomsOfficer/cat_ru:LNP">
										ЛНП<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="ii:InstrInfo/ii:CustomsOfficer/cat_ru:LNP"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="width:180mm;">
                           <span class="graphNo">Таможенный орган: </span>
                           <xsl:value-of select="ii:InstrInfo/ii:Customs/cat_ru:Code"/>
                           <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           <xsl:if test="ii:InstrInfo/ii:Customs/cat_ru:OfficeName">
                              <xsl:value-of select="ii:InstrInfo/ii:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!--div class="page" style="text-align:left;">
				<span class="graphNo">Примечание к мере профиля риска: </span><br/>
				<xsl:value-of select="ii:InspectionObject/ii:DescriptionMeasure"/>
            </div-->
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ii:PersonInspection|ii:Declarant">
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="./cat_ru:OrganizationName"/>
      <xsl:if test="./cat_ru:ShortName">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										(<xsl:value-of select="./cat_ru:ShortName"/>)
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
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
      <xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
         <br/>
      </xsl:if>
   </xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   <xsl:template match="cat_ru:Address">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cat_ru:Address/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="RUScat_ru:IdentityCard">
      <xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
      <xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
      <xsl:if test="RUScat_ru:IdentityCardCode or RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
		  <xsl:text>, </xsl:text>
       </xsl:if>	        
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
   </xsl:template>
   <xsl:template match="RUScat_ru:IdentityCard/*">
      <xsl:if test="preceding-sibling::*[1]">, </xsl:if>
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="ii:InspGoodsLocation">
      <xsl:if test="catESAD_ru:InformationTypeCode">
			Код информации
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="catESAD_ru:InformationTypeCode"/>
         <br/>
      </xsl:if>
      <xsl:if test="catESAD_ru:WarehousePlace">
         <!--xsl:if test="catESAD_ru:WarehousePlace/catESAD_ru:DocumentModeCode=2">
				Свидетельство о включении в Реестр
			</xsl:if>
         <xsl:if test="catESAD_ru:WarehousePlace/catESAD_ru:DocumentModeCode=1">
				Лицензия 
			</xsl:if-->
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			№ <xsl:value-of select="catESAD_ru:WarehousePlace/catESAD_ru:CertificateNumber"/>
         <xsl:if test="catESAD_ru:WarehousePlace/catESAD_ru:CertificateDate">
									от
				<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="catESAD_ru:WarehousePlace/catESAD_ru:CertificateDate"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:if test="catESAD_ru:WarehousePlace/catESAD_ru:CustomsOfficeID">
            <br/>
				Код таможенного органа, в зоне деятельности которого находится СВХ
				<xsl:value-of select="catESAD_ru:WarehousePlace/catESAD_ru:CustomsOfficeID"/>
         </xsl:if>
      </xsl:if>
      <!--xsl:if test="ii:GoodsLocationPlace"-->
         <xsl:if test="catESAD_ru:InspPlaceDesc">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:for-each select="catESAD_ru:InspPlaceDesc">
				<xsl:value-of select="."/>
            </xsl:for-each>
         </xsl:if>
         <xsl:if test="cat_ru:Code">
			Код таможенного органа, в регионе деятельности которого находится место нахождения товаров <xsl:value-of select="cat_ru:Code"/>
            <br/>
         </xsl:if>
         <!--xsl:if test="ii:GoodsLocationPlace/catESAD_ru:RailwayStationCode">
				Код ж/д станции <xsl:value-of select="ii:GoodsLocationPlace/catESAD_ru:RailwayStationCode"/>
         </xsl:if-->
         <xsl:if test="catESAD_ru:InspPlaceName">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				Название ж/д станции <xsl:value-of select="catESAD_ru:InspPlaceName"/>
         </xsl:if>
         <br/>
         <xsl:apply-templates select="catESAD_ru:InspAddress"/>
      <!--/xsl:if-->
   </xsl:template>
   
	<xsl:template match="catESAD_ru:InspAddress">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
   
   <xsl:template match="ii:ControlOrganization">
	<!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
	<xsl:value-of select="cat_ru:OrganizationName"/>
	<xsl:if test="cat_ru:ShortName">
		<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
		<xsl:value-of select="cat_ru:ShortName"/>
		<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
	</xsl:if><br/>
	
	<xsl:choose>
		<xsl:when test="cat_ru:RFOrganizationFeatures"><xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/></xsl:when>
		<xsl:when test="cat_ru:RKOrganizationFeatures"><xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/></xsl:when>
		<xsl:when test="cat_ru:RBOrganizationFeatures"><xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/></xsl:when>
	</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
	<xsl:if test="cat_ru:OGRN">
		<span>ОГРН: <xsl:value-of select="cat_ru:OGRN" /></span><br/>
	</xsl:if>
	<xsl:if test="cat_ru:INN">
		<span>ИНН: <xsl:value-of select="cat_ru:INN" /></span><br/>
	</xsl:if>
	<xsl:if test="cat_ru:KPP">
		<span>	КПП: <xsl:value-of select="cat_ru:KPP" /></span><br/>
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:RBOrganizationFeatures">
	<xsl:if test="cat_ru:UNP">
		<span>УНП: <xsl:value-of select="cat_ru:UNP" /></span><br/>
	</xsl:if>
	<xsl:if test="cat_ru:RBIdentificationNumber">
		<span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber" /></span><br/>
	</xsl:if>
</xsl:template>

<xsl:template match="cat_ru:RKOrganizationFeatures">
	<xsl:if test="cat_ru:BIN">
		<span>БИН: <xsl:value-of select="cat_ru:BIN" /></span><br/>
	</xsl:if>
	<xsl:if test="cat_ru:IIN">
		<span>ИИН: <xsl:value-of select="cat_ru:IIN" /></span><br/>
	</xsl:if>
	<xsl:for-each select="cat_ru:ITN">
		<span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode" />/<xsl:value-of select="cat_ru:KATOCode" />/<xsl:value-of select="cat_ru:RNN" /><xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
			</span><br/>
	</xsl:for-each>
</xsl:template>
<xsl:template match="ii:ControlPerson"><!--ФИО, должность-->
	<xsl:value-of select="cat_ru:PersonSurname"/>
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	<xsl:value-of select="cat_ru:PersonName"/>
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	<xsl:value-of select="cat_ru:PersonMiddleName"/>
	<xsl:if test="cat_ru:PersonPost">, должность - <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
</xsl:template>
</xsl:stylesheet>
