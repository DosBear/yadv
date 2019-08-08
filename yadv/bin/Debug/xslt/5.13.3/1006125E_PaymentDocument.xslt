<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:paydo="urn:customs.ru:Information:CustomsDocuments:PaymentDocument:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="paydo:PaymentDocument">
      <html>
         <head>
            <title>Документ уплаты таможенных и иных платежей</title>
            <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
            <style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.bold2{
							font-weight: bold;
							font-family:Arial;
							font-size: 12pt; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt;
							}
							
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;

						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
         </head>
         <body>
            <div class="page">
               <table border="0" style="width:280mm">
                  <tbody>
                     <tr>
                        <td align="center">	
								Документ уплаты 
								</td>
                        <xsl:if test="paydo:PDKind = '1'">
                           <td> ДУ/ДТ </td>
                        </xsl:if>
                        <xsl:if test="paydo:PDKind = '2'">
                           <td> ДУ/ТПО </td>
                        </xsl:if>
                        <xsl:if test="paydo:PDKind = '3'">
                           <td> ДУ/ТР </td>
                        </xsl:if>
                     </tr>
                  </tbody>
               </table>
               <xsl:if test="paydo:PDKind = '1'">
                  <table border="1" style="width:280mm">
                     <tbody>
                        <tr>
                           <td align="center" colspan="5">Декларация на товары</td>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">
								Код особенности декларирования
								</td>
                           <td colspan="3">
								Регистрационный номер
								</td>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <xsl:value-of select="paydo:PDParticular"/>
                           </td>
                           <td colspan="3">
                              <xsl:value-of select="paydo:RegistrationNumber/paydo:CustomsCode"/>/
										<xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="paydo:RegistrationNumber/paydo:RegistrationDate"/>
                              </xsl:call-template>/
										<xsl:value-of select="paydo:RegistrationNumber/paydo:Number"/>
                           </td>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" colspan="8">
								Плательщик
								</td>
                        </tr>
                        <tr>
                           <td>
								Классификация плательщика
								</td>
                           <td colspan="4">
								Номер лицевого счета
								</td>
                           <td colspan="3">
								Наименование организации/ Данные <br/> физического лица
								</td>
                        </tr>
                        <xsl:for-each select="paydo:PayerInfo">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Предшествующая декларация на товары</td>
                        </tr>
                        <tr>
                           <td>Регистрационный номер</td>
                           <td colspan="2">Код бюджетной классификации</td>
                           <td>Код платежа</td>
                           <td colspan="2">Сумма</td>
                           <td colspan="2">Сумма, зачтенная в уплату</td>
                        </tr>
                        <xsl:for-each select="paydo:PrecedingDocument">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Сумма к уплате</td>
                        </tr>
                        <tr>
                           <td>Дата начисления</td>
                           <td colspan="2">Код бюджетной классификации</td>
                           <td>Код платежа</td>
                           <td colspan="2">Сумма</td>
                           <td>Тип начисления</td>
                           <td>Номер бланка КТС</td>
                        </tr>
                        <xsl:for-each select="paydo:PayableAmount">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Уплачено</td>
                        </tr>
                        <tr>
                           <td rowspan="2">Код бюджетной классификации</td>
                           <td align="center" colspan="6">Платежный документ</td>
                           <td rowspan="2">Дата уплаты</td>
                        </tr>
                        <tr>
                           <td>Тип</td>
                           <td>Номер</td>
                           <td>Дата</td>
                           <td>Общая сумма</td>
                           <td>Сумма списания</td>
                           <td>Код вида платежа</td>
                           <td>ИНН/КПП плательщика</td>
                        </tr>
                        <xsl:for-each select="paydo:Paid">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Сумма излишней уплаты, снятая с учета</td>
                        </tr>
                        <tr>
                           <td>Код бюджетной классификации</td>
                           <td>Код вида платежа</td>
                           <td align="center" colspan="3">Сумма</td>
                           <td>Дата снятия</td>
                           <td colspan="2">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <xsl:for-each select="paydo:ExcessPaymentAmount">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Незавершенные расчеты</td>
                        </tr>
                        <tr>
                           <td rowspan="2">Код бюджетной классификации</td>
                           <td rowspan="2">Код платежа</td>
                           <td align="center" colspan="5">Сумма</td>
                           <td rowspan="2">Дата</td>
                        </tr>
                        <tr>
                           <td align="center" colspan="2">задолженности</td>
                           <td align="center" colspan="3">переплаты</td>
                        </tr>
                        <xsl:for-each select="paydo:OutstandingBalances">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="5">Формирование ДУ</td>
                           <td align="center" colspan="3">Получение ДУ</td>
                        </tr>
                        <tr>
                           <td>Завершено формирование</td>
                           <td>Кол-во страниц</td>
                           <td>Дата</td>
                           <td align="center" colspan="2">ФИО, ЛНП</td>
                           <td>Дата</td>
                           <td>ФИО</td>
                           <td>Подпись</td>
                        </tr>
                        <tr>
                           <xsl:apply-templates select="paydo:Fledging"/>
                           <xsl:apply-templates select="paydo:ReceiptPD"/>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="paydo:PDKind = '2'">
                  <table border="1" style="width:280mm">
                     <tbody>
                        <tr>
                           <td align="center" colspan="5">
								Таможенный приходный ордер
								</td>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>Тип ордера</td>
                           <td colspan="2">Справочный номер</td>
                           <td colspan="5">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <xsl:value-of select="paydo:PDParticular"/>
                           </td>
                           <td colspan="2">
                              <xsl:value-of select="paydo:RegistrationNumber/paydo:CustomsCode"/>/
										<xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="paydo:RegistrationNumber/paydo:RegistrationDate"/>
                              </xsl:call-template>/
										<xsl:value-of select="paydo:RegistrationNumber/paydo:Number"/>
                           </td>
                           <td colspan="5">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" colspan="8">
								Плательщик
								</td>
                        </tr>
                        <tr>
                           <td>
								Классификация плательщика
								</td>
                           <td colspan="4">
								Номер лицевого счета
								</td>
                           <td colspan="3">
								Наименование организации/ Данные <br/> физического лица
								</td>
                        </tr>
                        <xsl:for-each select="paydo:PayerInfo">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Аннулированный таможенный приходной ордер</td>
                        </tr>
                        <tr>
                           <td>Справочный номер</td>
                           <td colspan="2">Код бюджетной классификации</td>
                           <td>Код платежа</td>
                           <td colspan="2">Сумма</td>
                           <td colspan="2">Сумма, зачтенная в уплату</td>
                        </tr>
                        <xsl:for-each select="paydo:PrecedingDocument">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="4">Сумма к уплате</td>
                           <td colspan="4">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>Код бюджетной классификации</td>
                           <td>Код платежа</td>
                           <td colspan="2">Сумма</td>
                           <td colspan="4">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <xsl:for-each select="paydo:PayableAmount">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Уплачено</td>
                        </tr>
                        <tr>
                           <td rowspan="2">Код бюджетной классификации</td>
                           <td align="center" colspan="6">Платежный документ</td>
                           <td rowspan="2">Дата уплаты</td>
                        </tr>
                        <tr>
                           <td>Тип</td>
                           <td>Номер</td>
                           <td>Дата</td>
                           <td>Общая сумма</td>
                           <td>Сумма списания</td>
                           <td>Код вида платежа</td>
                           <td>ИНН/КПП плательщика</td>
                        </tr>
                        <xsl:for-each select="paydo:Paid">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Сумма излишней уплаты, снятая с учета</td>
                        </tr>
                        <tr>
                           <td>Код бюджетной классификации</td>
                           <td>Код вида платежа</td>
                           <td align="center" colspan="3">Сумма</td>
                           <td>Дата снятия</td>
                           <td colspan="2">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <xsl:for-each select="paydo:ExcessPaymentAmount">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Незавершенные расчеты</td>
                        </tr>
                        <tr>
                           <td rowspan="2">Код бюджетной классификации</td>
                           <td rowspan="2">Код платежа</td>
                           <td align="center" colspan="5">Сумма</td>
                           <td rowspan="2">Дата</td>
                        </tr>
                        <tr>
                           <td align="center" colspan="2">задолженности</td>
                           <td align="center" colspan="3">переплаты</td>
                        </tr>
                        <xsl:for-each select="paydo:OutstandingBalances">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="5">Формирование ДУ</td>
                           <td align="center" colspan="3">Получение ДУ</td>
                        </tr>
                        <tr>
                           <td>Завершено формирование</td>
                           <td>Кол-во страниц</td>
                           <td>Дата</td>
                           <td align="center" colspan="2">ФИО, ЛНП</td>
                           <td>Дата</td>
                           <td>ФИО</td>
                           <td>Подпись</td>
                        </tr>
                        <tr>
                           <xsl:apply-templates select="paydo:Fledging"/>
                           <xsl:apply-templates select="paydo:ReceiptPD"/>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
               <xsl:if test="paydo:PDKind = '3'">
                  <table border="1" style="width:280mm">
                     <tbody>
                        <tr>
                           <td align="center" colspan="5">Таможенная расписка</td>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>Тип расписки</td>
                           <td colspan="2">Справочный номер</td>
                           <td colspan="5">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <xsl:value-of select="paydo:PDParticular"/>
                           </td>
                           <td colspan="2">
                              <xsl:value-of select="paydo:RegistrationNumber/paydo:CustomsCode"/>/
										<xsl:call-template name="russian_date2">
                                 <xsl:with-param name="dateIn" select="paydo:RegistrationNumber/paydo:RegistrationDate"/>
                              </xsl:call-template>/
										<xsl:value-of select="paydo:RegistrationNumber/paydo:Number"/>
                           </td>
                           <td colspan="5">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" colspan="8">
								Плательщик
								</td>
                        </tr>
                        <tr>
                           <td>
								Классификация плательщика
								</td>
                           <td colspan="4">
								Номер лицевого счета
								</td>
                           <td colspan="3">
								Наименование организации/ Данные <br/> физического лица
								</td>
                        </tr>
                        <xsl:for-each select="paydo:PayerInfo">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Аннулированная таможенная расписка</td>
                        </tr>
                        <tr>
                           <td>Справочный номер</td>
                           <td colspan="2">Код бюджетной классификации</td>
                           <td>Код платежа</td>
                           <td colspan="2">Сумма</td>
                           <td colspan="2">Сумма, зачтенная в обеспечение</td>
                        </tr>
                        <xsl:for-each select="paydo:PrecedingDocument">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="4">Сумма обеспечения уплаты таможенных платежей</td>
                           <td colspan="4">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>Код бюджетной классификации</td>
                           <td>Код платежа</td>
                           <td colspan="2">Сумма</td>
                           <td colspan="4">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <xsl:for-each select="paydo:PayableAmount">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="8">Уплачено по таможенной расписке</td>
                        </tr>
                        <tr>
                           <td rowspan="2">Код бюджетной классификации</td>
                           <td align="center" colspan="6">Платежный документ</td>
                           <td rowspan="2">Дата уплаты</td>
                        </tr>
                        <tr>
                           <td>Тип</td>
                           <td>Номер</td>
                           <td>Дата</td>
                           <td>Общая сумма</td>
                           <td>Сумма списания</td>
                           <td>Код вида платежа</td>
                           <td>ИНН/КПП плательщика</td>
                        </tr>
                        <xsl:for-each select="paydo:Paid">
                           <tr>
                              <xsl:apply-templates select="."/>
                           </tr>
                        </xsl:for-each>
                        <tr>
                           <td align="center" colspan="5">Формирование ДУ</td>
                           <td align="center" colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <td>Завершено формирование</td>
                           <td>Кол-во страниц</td>
                           <td>Дата</td>
                           <td align="center" colspan="2">ФИО, ЛНП</td>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                        <tr>
                           <xsl:apply-templates select="paydo:Fledging"/>
                           <td colspan="3">
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="paydo:PayerInfo">
      <xsl:if test="paydo:Classification= '1'">
         <td>
								Юридическое лицо
								</td>
      </xsl:if>
      <xsl:if test="paydo:Classification= '2'">
         <td>
								Физическое лицо
								</td>
      </xsl:if>
      <xsl:if test="paydo:Classification= '3'">
         <td>
								Таможенный представитель
								</td>
      </xsl:if>
      <td>
         <xsl:value-of select="paydo:Account/paydo:CustomsCode"/>
      </td>
      <td>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="paydo:Account/paydo:Date"/>
         </xsl:call-template>
      </td>
      <td>
         <xsl:value-of select="paydo:Account/paydo:INN"/>
      </td>
      <td>
         <xsl:value-of select="paydo:Account/paydo:KPP"/>
      </td>
      <td colspan="3">
         <xsl:value-of select="paydo:OrganizationName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:if test="paydo:ITN">
            <xsl:value-of select="paydo:ITN"/>
         </xsl:if>
         <xsl:if test="paydo:OGRNID">
            <xsl:value-of select="paydo:OGRNID"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </xsl:if>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:if test="(paydo:ResidenceStatus='1') or (paydo:ResidenceStatus='t') or (paydo:ResidenceStatus='true')">резидент</xsl:if>
         <xsl:if test="(paydo:ResidenceStatus='0') or (paydo:ResidenceStatus='f') or (paydo:ResidenceStatus='false')">нерезидент</xsl:if>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:apply-templates select="paydo:IdentityCard"/>
      </td>
   </xsl:template>
   <xsl:template match="paydo:IdentityCard">
      <xsl:apply-templates select="cat_ru:IdentityCardCode"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cat_ru:IdentityCardName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cat_ru:IdentityCardSeries"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cat_ru:IdentityCardNumber"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
      </xsl:call-template>
      <xsl:apply-templates select="paydo:OrganizationName"/>
   </xsl:template>
   <xsl:template match="paydo:PrecedingDocument">
      <td>
         <xsl:value-of select="paydo:PrecedingRegistrationNumber/paydo:CustomsCode"/>/
			<xsl:call-template name="russian_date2">
            <xsl:with-param name="dateIn" select="paydo:PrecedingRegistrationNumber/paydo:RegistrationDate"/>
         </xsl:call-template>/
			<xsl:value-of select="paydo:PrecedingRegistrationNumber/paydo:Number"/>
      </td>
      <td colspan="2">
         <xsl:value-of select="paydo:BCC"/>
      </td>
      <td>
         <table border="0">
            <tbody>
               <xsl:for-each select="paydo:Payment">
                  <tr>
                     <xsl:value-of select="paydo:PaymentModeCode"/>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
      </td>
      <td colspan="2">
         <table border="0">
            <tbody>
               <xsl:for-each select="paydo:Payment">
                  <tr>
                     <xsl:value-of select="paydo:AmountRUB"/>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
      </td>
      <td colspan="2">
         <table border="0">
            <tbody>
               <xsl:for-each select="paydo:Payment">
                  <tr>
                     <xsl:value-of select="paydo:Amount"/>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
      </td>
   </xsl:template>
   <xsl:template match="paydo:PayableAmount">
      <xsl:if test="//paydo:PDKind = '1'">
         <td>
            <xsl:if test="paydo:DateAccrual">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="paydo:DateAccrual"/>
               </xsl:call-template>
            </xsl:if>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </td>
         <td colspan="2">
            <xsl:value-of select="paydo:BCC"/>
         </td>
         <td>
            <xsl:value-of select="paydo:PaymentModeCode"/>
         </td>
         <td colspan="2">
            <xsl:value-of select="paydo:Amount"/>
            <xsl:if test="paydo:CurrencyCode">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="paydo:CurrencyCode"/>
            </xsl:if>
            <xsl:if test="paydo:CurrencyRate">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="paydo:CurrencyRate"/>
            </xsl:if>
         </td>
         <td>
            <xsl:if test="paydo:KindAccrual= '1'">ДТ</xsl:if>
            <xsl:if test="paydo:KindAccrual= '2'">КТС</xsl:if>
            <xsl:if test="paydo:KindAccrual= '3'">КДТ</xsl:if>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </td>
         <td>
            <xsl:value-of select="paydo:SerialNumber"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </td>
      </xsl:if>
      <xsl:if test="(//paydo:PDKind = '2') or (//paydo:PDKind = '3')">
         <td>
            <xsl:value-of select="paydo:BCC"/>
         </td>
         <td>
            <xsl:value-of select="paydo:PaymentModeCode"/>
         </td>
         <td colspan="2">
            <xsl:value-of select="paydo:Amount"/>
            <xsl:if test="paydo:CurrencyCode">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="paydo:CurrencyCode"/>
            </xsl:if>
            <xsl:if test="paydo:CurrencyRate">
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               <xsl:value-of select="paydo:CurrencyRate"/>
            </xsl:if>
         </td>
         <td colspan="4">
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </td>
      </xsl:if>
   </xsl:template>
   <xsl:template match="paydo:Paid">
      <td>
         <xsl:value-of select="paydo:BCC"/>
      </td>
      <td>
         <xsl:if test="paydo:PaymentDocumentType= '1'">ПП</xsl:if>
         <xsl:if test="paydo:PaymentDocumentType= '2'">ПКО</xsl:if>
         <xsl:if test="paydo:PaymentDocumentType= '3'">квит.</xsl:if>
         <xsl:if test="paydo:PaymentDocumentType= '4'">чек</xsl:if>
         <xsl:if test="paydo:PaymentDocumentType= '5'">расп.</xsl:if>
      </td>
      <td>
         <table border="0">
            <tbody>
               <xsl:for-each select="paydo:Agreement">
                  <tr>
                     <xsl:value-of select="cat_ru:PrDocumentNumber"/>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td>
         <table border="0">
            <tbody>
               <xsl:for-each select="paydo:Agreement">
                  <tr>
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                     </xsl:call-template>
                  </tr>
               </xsl:for-each>
            </tbody>
         </table>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td>
         <xsl:value-of select="paydo:TotalAmount"/>
      </td>
      <td>
         <xsl:value-of select="paydo:WriteOffs"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td>
         <xsl:value-of select="paydo:PaymentModeCode"/>
      </td>
      <td>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="paydo:DatewWiting"/>
         </xsl:call-template>
      </td>
      <td>
         <xsl:if test="paydo:PayerOrgData/paydo:PayerINN">
				ИНН <xsl:value-of select="paydo:PayerOrgData/paydo:PayerINN"/>, 
			</xsl:if>
         <xsl:if test="paydo:PayerOrgData/paydo:PayerKPP">
				КПП <xsl:value-of select="paydo:PayerOrgData/paydo:PayerKPP"/>, 
			</xsl:if>
         <xsl:if test="paydo:PayerOrgData/paydo:PayerITN">
				ИТН <xsl:value-of select="paydo:PayerOrgData/paydo:PayerITN"/>, 
			</xsl:if>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
   </xsl:template>
   <xsl:template match="paydo:ExcessPaymentAmount">
      <td>
         <xsl:value-of select="paydo:BCC"/>
      </td>
      <td>
         <xsl:value-of select="paydo:PaymentModeCode"/>
      </td>
      <td colspan="3">
         <xsl:value-of select="paydo:Amount"/>
         <xsl:if test="paydo:DeregistrationSign= '1'"> - возврат на расчетный счет плательщика</xsl:if>
         <xsl:if test="paydo:DeregistrationSign= '2'"> - зачет на лицевой счет плательщика</xsl:if>
         <xsl:if test="paydo:DeregistrationSign= '3'"> - зачет в счет погашения задолженности по уплате таможенных платежей</xsl:if>
         <xsl:if test="paydo:DeregistrationSign= '4'"> - отражение в составе прочих неналоговых 
			доходов федерального бюджета как невостребованной</xsl:if>
      </td>
      <td>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="paydo:DateDrawdown"/>
         </xsl:call-template>
      </td>
      <td colspan="2">
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
   </xsl:template>
   <xsl:template match="paydo:OutstandingBalances">
      <td>
         <xsl:value-of select="paydo:BCC"/>
      </td>
      <td>
         <xsl:value-of select="paydo:PaymentModeCode"/>
      </td>
      <td colspan="2">
         <xsl:value-of select="paydo:DeptAmount"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td colspan="3">
         <xsl:value-of select="paydo:Overpayment"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
   </xsl:template>
   <xsl:template match="paydo:Fledging">
      <td>
         <xsl:if test="(paydo:CompletionSign='1') or (paydo:CompletionSign='t') or (paydo:CompletionSign='true')">завершено</xsl:if>
         <xsl:if test="(paydo:CompletionSign='0') or (paydo:CompletionSign='f') or (paydo:CompletionSign='false')">не завершено</xsl:if>
      </td>
      <td>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="paydo:EndDate"/>
         </xsl:call-template>
      </td>
      <td colspan="2">
         <xsl:value-of select="cat_ru:PersonName"/>
         <xsl:if test="cat_ru:LNP">
				, <xsl:value-of select="cat_ru:LNP"/>
         </xsl:if>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
   </xsl:template>
   <xsl:template match="paydo:ReceiptPD">
      <td>
         <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
      <td>
         <xsl:value-of select="cat_ru:PersonSurname"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:PersonName"/>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:PersonMiddleName"/>
      </td>
      <td>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </td>
   </xsl:template>
</xsl:stylesheet>
