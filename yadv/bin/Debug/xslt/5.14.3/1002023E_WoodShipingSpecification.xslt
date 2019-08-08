<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru wss" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:wss="urn:customs.ru:Information:CommercialFinanceDocuments:WoodShipingSpecification:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="wss:WoodShipingSpecification">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {}
                    div.page {
                        width: 297mm;
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

                       td {border:
                        font-family: Arial, serif;
                        font-size: 10pt;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    graphBold {
							font-family: Arial;
							font-size: 7pt;
							font-weight: bold;
							}
                    </style>
         <table style="width:280mm">
            <tr>
               <td align="center" class="graph12">
                  <b>Отгрузочная спецификация №<u>
                        <xsl:value-of select="wss:SpecificationNumber"/>
                     </u>
                  </b>
               </td>
               <td>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
            <tr>
               <td>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
               <td align="left">ГОСТ:<xsl:value-of select="wss:StandartsInfo/wss:GovermentStandart"/>
               </td>
            </tr>
            <tr>
               <td align="left">
					Контракт:<xsl:value-of select="wss:Contract/cat_ru:PrDocumentName"/> 
					от<xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="wss:Contract/cat_ru:PrDocumentDate"/>
                  </xsl:call-template> 
					№<xsl:value-of select="wss:Contract/cat_ru:PrDocumentNumber"/>
               </td>
               <td align="left">Дата отгрузки:
					<xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="wss:UnloadingDate"/>
                  </xsl:call-template>
               </td>
               <td align="left">Порода:<xsl:value-of select="wss:StandartsInfo/wss:WoodSpecies"/>
               </td>
            </tr>
            <tr>
               <td align="left">
						Отправитель:<xsl:value-of select="wss:Sender/cat_ru:OrganizationName"/> 
						<xsl:for-each select="wss:Sender/wss:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
               <td align="left">Вагон№:<xsl:for-each select="wss:WagonNumber">
                     <xsl:value-of select="."/> </xsl:for-each>
               </td>
               <td align="left">Влажность:<xsl:value-of select="wss:StandartsInfo/wss:Wetness"/>
               </td>
            </tr>
            <tr>
               <td align="left">
					Станция отправления:<xsl:value-of select="wss:Sender/wss:StationName"/>
               </td>
               <td align="left">Ж/д накл. №:<xsl:value-of select="wss:RailbillNumber"/>
               </td>
               <td align="left">Переводной коэффициент:<xsl:value-of select="wss:StandartsInfo/wss:ConversRate"/>
               </td>
            </tr>
            <tr>
               <td align="left">
					Адрес получателя:
					<xsl:for-each select="wss:Recipient/wss:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
               <td align="left">Доп. маркировка:<xsl:value-of select="wss:AdditionalMarking"/>
               </td>
               <td align="left">Масса груза в тоннах:<xsl:value-of select="wss:StandartsInfo/wss:Tonnage"/>
               </td>
            </tr>
            <tr>
               <td align="left" colspan="3">
					Станция назначения, получатель:<xsl:value-of select="wss:Recipient/wss:StationName"/>, <xsl:value-of select="wss:Recipient/cat_ru:OrganizationName"/>
               </td>
            </tr>
         </table>
         <table border="1" cellpadding="0" cellspacing="0" style="width:280mm;">
            <tbody>
               <tr>
                  <td align="center" style="width:15mm">Пакет №</td>
                  <td align="center" style="width:25mm">Порода</td>
                  <td align="center" style="width:25mm">Сорт</td>
                  <td align="center" style="width:20mm">Толщина</td>
                  <td align="center" style="width:20mm">Ширина</td>
                  <td align="center" style="width:30mm">Длина</td>
                  <td align="center" style="width:30mm">Количество</td>
                  <td align="center" colspan="4" style="width:65mm">Итого</td>
                  <td align="center" style="width:30mm">Приложение</td>
               </tr>
               <tr>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td align="center" style="width:15mm">шт.</td>
                  <td align="center" style="width:15mm">куб.м.</td>
                  <td style="width:5mm">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td align="center" style="width:30mm">по сортам, по длинам</td>
                  <td align="center" style="width:30mm">Реквизиты</td>
               </tr>
               <xsl:for-each select="wss:GoodsInfo">
                  <tr>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:PackNum"/>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:Species"/>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:Grade"/>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:Depth"/>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:Width"/>
                     </td>
                     <xsl:choose>
                        <xsl:when test="count(wss:Length)=1">
                           <td>
                              <xsl:value-of select="wss:Length/wss:StandartValue"/>
                           </td>
                           <td>
                              <xsl:value-of select="wss:Length/wss:Quantity"/>
                           </td>
                        </xsl:when>
                        <xsl:otherwise>
                           <td colspan="2" style="vertical-align: top">
                              <table border="1" cellpadding="0" cellspacing="0" style="width:100%; empty-cells: show;  border-collapse:collapse; position: relative; border: 0">
                                 <tbody>
                                    <xsl:for-each select="wss:Length">
                                       <xsl:choose>
                                          <xsl:when test="position() = 1">
                                             <tr>
                                                <td style="width:50%; padding-left:3mm; border-top: 0; border-bottom:0; border-left:0; border-right: 2 solid gray">
                                                   <xsl:value-of select="wss:StandartValue"/> м<br/>
                                                   <br/>
                                                </td>
                                                <td style="width:50%; padding-left:4mm; border-top: 0; border-right:0; border-bottom:0; border-left: 2 solid gray">
                                                   <xsl:value-of select="wss:Quantity"/> шт<br/>
                                                   <br/>
                                                </td>
                                             </tr>
                                          </xsl:when>
                                          <xsl:otherwise>
                                             <tr>
                                                <td style="width:50%; padding-left:3mm; border-top:1 solid gray; border-left:0; border-bottom:0; border-right: 2 solid gray">
                                                   <xsl:value-of select="wss:StandartValue"/> м <br/>
                                                   <br/>
                                                </td>
                                                <td style="width:50%; padding-left:4mm; border-top:1 solid gray; border-right:0; border-bottom:0; border-left: 2 solid gray">
                                                   <xsl:value-of select="wss:Quantity"/> шт<br/>
                                                   <br/>
                                                </td>
                                             </tr>
                                          </xsl:otherwise>
                                       </xsl:choose>
                                    </xsl:for-each>
                                 </tbody>
                              </table>
                           </td>
                        </xsl:otherwise>
                     </xsl:choose>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:Quantity"/>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:value-of select="wss:Volume"/>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                     </td>
                     <td style="word-wrap: break-word;">
                        <xsl:for-each select="wss:Details">
                           <xsl:value-of select="."/> </xsl:for-each>
                     </td>
                     <td style="empty-cells:show ; word-wrap: break-word;"> <xsl:for-each select="wss:Requisites">
                           <xsl:value-of select="."/> </xsl:for-each>
                     </td>
                  </tr>
               </xsl:for-each>
               <tr>
                  <td colspan="5">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td rowspan="3">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td rowspan="3">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td colspan="3" rowspan="3" style="word-wrap: break-word;">
							Начальник цеха:
							<xsl:value-of select="wss:Foreman/cat_ru:PersonSurname"/> 
							<xsl:value-of select="wss:Foreman/cat_ru:PersonName"/> 
							<xsl:value-of select="wss:Foreman/cat_ru:PersonMiddleName"/>
                     <br/>
							Мастер погрузки:
							<xsl:value-of select="wss:Loader/cat_ru:PersonSurname"/> 
							<xsl:value-of select="wss:Loader/cat_ru:PersonName"/> 
							<xsl:value-of select="wss:Loader/cat_ru:PersonMiddleName"/>
                     <br/>
							Учетчик:
							<xsl:value-of select="wss:CheckMan/cat_ru:PersonSurname"/> 
							<xsl:value-of select="wss:CheckMan/cat_ru:PersonName"/> 
							<xsl:value-of select="wss:CheckMan/cat_ru:PersonMiddleName"/>
                     <br/>
                  </td>
               </tr>
               <tr>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
               </tr>
               <tr>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
               </tr>
               <tr>
                  <td align="left" colspan="5" style="vertical-align: top">Итого:</td>
                  <td colspan="2" style="vertical-align: top">
                     <table border="1" cellpadding="0" cellspacing="0" style="width:100%; empty-cells: show;  border-collapse:collapse; position: relative; border: 0">
                        <tbody>
                           <xsl:for-each select="wss:TotalLength">
                              <xsl:choose>
                                 <xsl:when test="position() = 1">
                                    <tr>
                                       <td style="width:50%; padding-left:3mm; border-top: 0; border-bottom:0; border-left:0; border-right: 2 solid gray">
                                          <xsl:value-of select="wss:StandartValue"/> м<br/>
                                          <br/>
                                       </td>
                                       <td style="width:50%; padding-left:4mm; border-top: 0; border-right:0; border-bottom:0; border-left: 2 solid gray">
                                          <xsl:value-of select="wss:Quantity"/> шт<br/>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <tr>
                                       <td style="width:50%; padding-left:3mm; border-top:1 solid gray; border-left:0; border-bottom:0; border-right: 2 solid gray">
                                          <xsl:value-of select="wss:StandartValue"/> м <br/>
                                          <br/>
                                       </td>
                                       <td style="width:50%; padding-left:4mm; border-top:1 solid gray; border-right:0; border-bottom:0; border-left: 2 solid gray">
                                          <xsl:value-of select="wss:Quantity"/> шт<br/>
                                          <br/>
                                       </td>
                                    </tr>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </xsl:for-each>
                        </tbody>
                     </table>
                  </td>
                  <td style="vertical-align: top">
                     <xsl:value-of select="wss:TotalQuantity"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td style="vertical-align: top">
                     <xsl:value-of select="wss:TotalVolume"/>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td colspan="2">
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
                  <td>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  </td>
               </tr>
            </tbody>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
