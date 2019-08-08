<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru arcc" version="1.0" xmlns:arcc="urn:customs.ru:Information:CommercialFinanceDocuments:ApplicationReturnCreditingCash:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template name="Date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/> 
		<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
		<xsl:value-of select="substring($dateIn, 1, 4)"/> г.
	</xsl:template>
	<xsl:template name="Date_2">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="substring($dateIn, 1, 4)"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:value-of select="substring ($dateIn, 9, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 6, 2)"/>
		<xsl:text/>
		<xsl:value-of select="substring($dateIn, 3, 2)"/>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/>, 
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>, 
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
	</xsl:template>
	<!--xsl:variable name="type" select="arcc:ReturnCrediting"/-->
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="arcc:ApplicationReturnCreditingCash">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
			body {
			background: #cccccc;
			}
                    div.page {
                        width: 180mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    </style>
			<body>
				<xsl:variable name="vozvrzach">
					<xsl:if test="arcc:ReturnCrediting = 0">возврат</xsl:if>
					<xsl:if test="arcc:ReturnCrediting = 1">зачет</xsl:if>
				</xsl:variable>
				<div class="page">
					<table width="100%">
						<tbody>
							<tr>
								<td width="50%"/>
								<td width="50%">
									<table>
										<tbody>
											<tr valign="top">
												<td>Начальнику</td>
												<td align="center" class="underlined">
													<xsl:value-of select="arcc:Customs/cat_ru:OfficeName"/>
												</td>
											</tr>
											<tr align="center">
												<td/>
												<td class="graph8">(наименование таможенного органа)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr align="center">
								<td>
									<xsl:if test="arcc:CashType=1">
										Заявление о возврате авансовых платежей
									</xsl:if>
									<xsl:if test="arcc:CashType=2">
										Заявление о <xsl:value-of select="$vozvrzach"/>е излишне уплаченных или излишне взысканных<br/>сумм таможенных пошлин, налогов и иных денежных средств
									</xsl:if>
									<xsl:if test="arcc:CashType=3">
										Заявление о <xsl:value-of select="$vozvrzach"/>е денежного залога
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td class="underlined">
									<xsl:apply-templates mode="organization" select="arcc:ApplicantInfo"/>
								</td>
							</tr>
							<tr align="center">
								<td class="graph8">(наименование, ИНН, КПП, адрес организации или инициалы, фамилия, адрес физического лица)</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="arcc:CashType=1">
						<table width="100%">
							<tbody>
								<tr>
									<td>
										в соответствии со статьей 122 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" просит вернуть
										 по коду бюджетной классификации платежных документов на банковский счет 
										<xsl:apply-templates select="arcc:BankInformation"/> авансовые платежи, внесенные по платежным документам
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:for-each select="arcc:PaymentDocument">
											<xsl:apply-templates select="." mode="document"/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph8" align="center">(указываются номер, дата и сумма платежного документа)</td>
								</tr>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td style="width:25mm;">в связи с</td>
									<td class="underlined">
										<xsl:value-of select="arcc:ReasonReturningCrediting"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td class="graph8">(указывается основание для возврата, в том числе ошибочное перечисление)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="arcc:CashType=2">
						<table width="100%">
							<tbody>
								<tr>
									<td>
										<xsl:text>в соответствии со статьями 129, 147, 148 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" просит вернуть по коду бюджетной классификации платежных документов на банковский счет </xsl:text>
										<xsl:apply-templates select="arcc:BankInformation"/>
										<xsl:text> либо зачесть в счет исполнения обязанностей по уплате  таможенных платежей, пеней, процентов по документу </xsl:text>
										<xsl:apply-templates mode="document" select="arcc:DocPaymentOfCustoms"/>
										<xsl:text> таможенные платежи, внесенные </xsl:text>
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:apply-templates mode="organization" select="arcc:PayerInfo"/>
									</td>
								</tr>
								<tr align="center">
									<td class="graph8">(указывается наименование, организационно-правовая форма организации или инициалы, фамилия физического лица, внесшего таможенные платежи)</td>
								</tr>
								<tr>
									<td>
										по платежным документам
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:for-each select="arcc:PaymentDocument">
											<xsl:apply-templates select="." mode="document"/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr align="center">
									<td class="graph8">(указываются номер, дата и сумма платежного документа)</td>
								</tr>
								<tr>
									<td>
										и исчисленные
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:apply-templates select="arcc:DocCalcPayment" mode="document"/>
									</td>
								</tr>
								<tr align="center">
									<td class="graph8">(указывается номер документа, в соответствии с которым исчислялись таможенные платежи)</td>
								</tr>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td style="width:25mm;">в связи с</td>
									<td class="underlined">
										<xsl:value-of select="arcc:ReasonReturningCrediting"/>
									</td>
								</tr>
								<tr align="center">
									<td/>
									<td class="graph8">(указывается факт, в соответствии с которым исчислялись таможенные платежи)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="arcc:CashType=3">
						<table width="100%">
							<tbody>
								<tr>
									<td>
										<xsl:text>в соответствии со статьей 149 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" просит вернуть по коду бюджетной классификации платежных документов на банковский счет </xsl:text>
										<xsl:apply-templates select="arcc:BankInformation"/>
										<xsl:text> либо зачесть в счет авансовых платежей </xsl:text>
										<xsl:value-of select="arcc:ConditionCrediting"/>
										<xsl:text> денежный залог, внесенный по платежным документам </xsl:text>
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:for-each select="arcc:PaymentDocument">
											<xsl:apply-templates select="." mode="document"/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr align="center">
									<td class="graph8">(указываются номер, дата и сумма платежного документа)</td>
								</tr>
								<tr>
									<td>
										и исчисленный
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:apply-templates select="arcc:CustomsReceipt" mode="document"/>
									</td>
								</tr>
								<tr align="center">
									<td class="graph8">(указывается номер таможенный расписки, в соответствии с которой исчиялялся денежный залог)</td>
								</tr>
								<tr>
									<td>
										в связи с исполнением (прекращением) обязательства, обеспеченного денежным залогом, что подтверждается
									</td>
								</tr>
								<tr>
									<td class="underlined">
										<xsl:for-each select="arcc:DocConfCease">
											<xsl:apply-templates select="." mode="document"/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr align="center">
									<td class="graph8">(указываются документы, подтверждающие исполнение (прекращение) обязательства, обеспеченного денежным залогом)</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table width="100%">
						<tbody>
							<tr>
								<td style="width:25mm;">в размере</td>
								<td class="underlined">
									<xsl:for-each select="arcc:AmountCash">
										<br>
											<xsl:if test="arcc:BCC">
												<xsl:text>КБК: </xsl:text>
												<xsl:value-of select="arcc:BCC"/>&#160;</xsl:if>
											<xsl:if test="arcc:PaymentModeCode">(<xsl:value-of select="arcc:PaymentModeCode"/>)&#160;</xsl:if>
											<xsl:value-of select="arcc:Amount"/>
											<xsl:if test="arcc:Currency">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="arcc:Currency"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
											<xsl:if test="position()!=last()">,&#160;</xsl:if>
										</br>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td/>
								<td class="graph8">(сумма денежных средств к возврату)</td>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr valign="top">
								<td width="35%">Перечень прилагаемых документов</td>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td>1)</td>
												<td class="underlined">
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td/>
												<td class="graph8">
													(указываются документы, прилагаемые к заявлению)
												</td>
											</tr>
											<tr>
												<td>2)</td>
												<td class="underlined">
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr>
								<td>
									Настоящим заявляю, что в данный таможенный орган ранее представлялись следующие документы:
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="top">
												<td>1)</td>
												<td class="underlined">
													<xsl:for-each select="arcc:AttachedDocuments">
														<xsl:apply-templates mode="document" select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr align="center">
												<td/>
												<td class="graph8">(указываются документы из предусмотренных частями 4 - 7 статьи 122 Федерального закона от 27 ноября 2010 г. № 311-ФЗ "О таможенном регулировании в Российской Федерации" и наименование и реквизиты документов, при подаче которых в данный таможенный орган представлялись поименованные документы)</td>
											</tr>
											<tr valign="top">
												<td>2)</td>
												<td class="underlined">
													<xsl:for-each select="arcc:GTDID">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									и в них отсутствуют изменения.
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="40%" class="underlined"/>
								<td width="20%"/>
								<td width="40%" align="center" class="underlined">
									<xsl:apply-templates select="arcc:ApplicantSignature"/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td class="graph8">(подпись руководителя организации или уполномоченного от имени организации лица либо физического лица)</td>
								<td/>
								<td class="graph8">(инициалы, фамилия)</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="Date">
										<xsl:with-param name="dateIn" select="arcc:ApplicantSignature/cat_ru:IssueDate"/>
									</xsl:call-template>
								</td>
								<td/>
								<td/>
							</tr>
							<tr>
								<td>
									М.П.<sup>1</sup>
								</td>
								<td/>
								<td/>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div class="underlined" style="width:50mm;"/>
					<br/>
					<span class="graph8">
						<sup>1</sup>Если в соответствии с законодательством Российской Федерации лицо, подавшее заявление, должно иметь печать.</span>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="arcc:BankInformation">
		<xsl:value-of select="cat_ru:BankName"/>
		<xsl:if test="cat_ru:BankAccount">
			<xsl:text> номер счета: </xsl:text>
			<xsl:for-each select="cat_ru:BankAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:BankAccountDescription">
			<xsl:text> тип счета: </xsl:text>
			<xsl:apply-templates select="cat_ru:BankAccountDescription"/>
		</xsl:if>
		<xsl:if test="cat_ru:BankMFO">
			<xsl:text> МФО </xsl:text>
			<xsl:value-of select="cat_ru:BankMFO"/>
		</xsl:if>
		<xsl:if test="cat_ru:OKPOID">
			<xsl:text> ОКПО </xsl:text>
			<xsl:value-of select="cat_ru:OKPOID"/>
		</xsl:if>
		<xsl:if test="cat_ru:BICID">
			<xsl:text> БИК </xsl:text>
			<xsl:value-of select="cat_ru:BICID"/>
		</xsl:if>
		<xsl:if test="cat_ru:SWIFTID">
			<xsl:text> SWIFT </xsl:text>
			<xsl:value-of select="cat_ru:SWIFTID"/>
		</xsl:if>
		<xsl:if test="cat_ru:CorrAccount">
			<xsl:text> корр.счет </xsl:text>
			<xsl:value-of select="cat_ru:CorrAccount"/>
		</xsl:if>
		<xsl:if test="cat_ru:TransitCurrencyAccount">
			<xsl:text> валютный счет (транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:TransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
			<xsl:text> валютный счет (специальный транзитный): </xsl:text>
			<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="arcc:OKTMO">
			<xsl:text> ОКТМО: </xsl:text>
			<xsl:value-of select="arcc:OKTMO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="arcc:ApplicantSignature">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="arcc:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="Date_2">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="arcc:PaymentModeCode">
			<xsl:text> код платежа </xsl:text>
			<xsl:value-of select="arcc:PaymentModeCode"/>
		</xsl:if>
		<xsl:if test="arcc:Amount">
			<xsl:text> сумма </xsl:text>
			<xsl:value-of select="arcc:Amount"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0 or string-length(cat_ru:ShortName) &gt; 0">
			<span>,&#160;</span>
		</xsl:if>
		<xsl:apply-templates select="arcc:IdentityCard"/>
		<xsl:if test="string-length(arcc:IdentityCard) &gt; 0 or string-length(cat_ru:RFOrganizationFeatures) &gt; 0">
			<xsl:text>,&#160;</xsl:text>
		</xsl:if>
		<xsl:if test="arcc:Birthdate">дата рождения: <xsl:call-template name="Date">
				<xsl:with-param select="arcc:Birthdate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="arcc:OKSM">(<xsl:value-of select="arcc:OKSM"/>)</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Address"/>
		<xsl:if test="arcc:OKTMO">
			<xsl:if test="string-length(cat_ru:Address) &gt; 0 or string-length(arcc:Birthdate) &gt; 0 or string-length(cat_ru:RFOrganizationFeatures) &gt; 0">
				<xsl:text>,&#160;</xsl:text>
			</xsl:if> ОКТМО:<xsl:value-of select="arcc:OKTMO"/>
		</xsl:if>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="arcc:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="Date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:OrganizationName"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
