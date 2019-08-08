<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:arcn="urn:customs.ru:Information:TransportDocuments:Railway:ArrivalConfirmation:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <!-- Шаблон для типа ArrivalConfirmationType -->
  <xsl:template match="arcn:ArrivalConfirmation">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }

				.low 
				{
                  font-family: Arial;
                  font-size: 8pt;
				}

                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Подтверждение о прибытии</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:value-of select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
		<xsl:apply-templates select="arcn:NotifDate"/>
          <xsl:if test="arcn:Comment">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Комментарий</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="arcn:Comment" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcn:ReasonReg">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Основание регистрации прибытия</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:value-of select="arcn:ReasonReg" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcn:Confirmation">
            <div class="title marg-top">Регистрационный номер подтверждения о прибытии</div>
            <div>
              <xsl:apply-templates select="arcn:Confirmation">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:TD">
            <div class="title marg-top">Номер транзитной декларации</div>
            <div>
              <xsl:apply-templates select="arcn:TD">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:TIRID">
            <div class="title marg-top">Номер книжки МДП</div>
            <div>
              <xsl:apply-templates select="arcn:TIRID">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата и время представления ТД и иных документов</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_datetime">
					<xsl:with-param name="dateIn" select="arcn:SubmissionDocumentsDateTime"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата и время регистрации прибытия транспортного средства</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_datetime">
					<xsl:with-param name="dateIn" select="arcn:ArrivalRegistrationDateTime"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <xsl:if test="arcn:Carrier">
            <div class="title marg-top">Перевозчик</div>
            <div>
              <xsl:apply-templates select="arcn:Carrier">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:TransportIdentifier">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Номер транспортного средства</td>
                <td class="graphMain value" style="width:50%">
                  <xsl:for-each select="arcn:TransportIdentifier">
                    <xsl:value-of select="." />
                    <xsl:if test="position()!=last()">
                      <xsl:text>, </xsl:text>
                    </xsl:if>
                  </xsl:for-each>
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcn:ProducedDocuments">
            <div class="title marg-top">Представленные документы</div>
            <div>
              <xsl:apply-templates select="arcn:ProducedDocuments">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:InspectionResult">
            <div class="title marg-top">Результаты таможенного осмотра транспортного средства</div>
            <div>
              <xsl:apply-templates select="arcn:InspectionResult">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:LocationPlace">
            <div class="title marg-top">Местонахождение товаров и транспортного средства</div>
            <div>
              <xsl:apply-templates select="arcn:LocationPlace">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:IdentRemovalIndicator">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Признак, определяющий возможность снятия средств идентификации</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:choose>
                    <xsl:when test="arcn:IdentRemovalIndicator='0'">
                      <xsl:text>не разрешено</xsl:text>
                    </xsl:when>
                    <xsl:when test="arcn:IdentRemovalIndicator='1'">
                      <xsl:text>разрешено</xsl:text>
                    </xsl:when>
                    <xsl:when test="arcn:IdentRemovalIndicator='2'">
                      <xsl:text>разрешено только должностным лицам таможенного органа</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="arcn:IdentRemovalIndicator" />
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcn:UnloadingIndicator">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Признак, определяющий возможность выгрузки товаров</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:choose>
                    <xsl:when test="arcn:UnloadingIndicator='0'">
                      <xsl:text>не разрешено</xsl:text>
                    </xsl:when>
                    <xsl:when test="arcn:UnloadingIndicator='1'">
                      <xsl:text>разрешено</xsl:text>
                    </xsl:when>
                    <xsl:when test="arcn:UnloadingIndicator='2'">
                      <xsl:text>обязательно</xsl:text>
                    </xsl:when>
                    <xsl:when test="arcn:UnloadingIndicator='3'">
                      <xsl:text>обязательно в присутствии должностных лиц таможенного органа</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="arcn:UnloadingIndicator" />
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcn:MovingToWarehouseIndicator">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Признак, определяющий возможность перемещения товаров из места нахождения на склад временного хранения</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:choose>
                    <xsl:when test="arcn:MovingToWarehouseIndicator='0'">
                      <xsl:text>невозможно</xsl:text>
                    </xsl:when>
                    <xsl:when test="arcn:MovingToWarehouseIndicator='1'">
                      <xsl:text>возможно</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="arcn:MovingToWarehouseIndicator" />
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="arcn:Warehouse">
            <div class="title marg-top">Информация о складе временного хранения</div>
            <div>
              <xsl:apply-templates select="arcn:Warehouse">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="arcn:PlacingToWarehouseDateTime">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Дата и время размещения товаров на складе временного хранения</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:call-template name="russian_datetime">
					  <xsl:with-param name="dateIn" select="arcn:PlacingToWarehouseDateTime"/>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
          </xsl:if>
          <br/>
          <br/>
          <xsl:apply-templates select="arcn:CustomsPerson"/>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="*" mode="RUAddress">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:AddressKindCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="RUScat_ru:AddressKindCode='1' or RUScat_ru:AddressKindCode='2' or RUScat_ru:AddressKindCode='3'">
                  <xsl:text>Вид адреса</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>Кодовое обозначение вида адреса</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="RUScat_ru:AddressKindCode='1'">
                  <xsl:text>адрес регистрации</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='2'">
                  <xsl:text>фактический адрес</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='3'">
                  <xsl:text>почтовый адрес</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="RUScat_ru:AddressKindCode" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:District">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:District" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Town">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Город</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Town" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:House">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:House" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Room">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Room" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AddressText">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:AddressText" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKTMO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OKTMO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKATO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OKATO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:KLADR">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код КЛАДР</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:KLADR" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOGUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:AOGUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:AOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostOfficeBoxId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:PostOfficeBoxId" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон с дублирующимся match закомментирован -->
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="cat_ru:Address|arcn:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CUOrganizationType -->
  <xsl:template match="arcn:Carrier">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:SubjectAddressDetails">
        <div class="title marg-top">Адрес организации</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:SubjectAddressDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
        <div class="title marg-top">Документ, удостоверяющий личность</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:IdentityCard">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="cat_ru:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="arcn:Confirmation">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="arcn:Customs">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:Code" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:OfficeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OfficeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsPersonType -->
   <xsl:template match="arcn:CustomsPerson">
      <table>
         <tbody>
            <tr>
               <td align="center" class="value graphMain" width="65%">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td  width="10%"/>
               <td align="center" class="value graphMain" width="25%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="low">(Ф.И.О. должностного лица ТО, выдавшего Подтверждение)</td>
               <td/>
               <td align="center" class="low">(ЛНП)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
  <!-- Шаблон для типа arcn:SealType -->
  <xsl:template match="arcn:IdentAppliedInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="arcn:IdentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(arcn:Quantity, '.', ',')" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:SealType -->
  <xsl:template match="arcn:IdentBrokenInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="arcn:IdentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(arcn:Quantity, '.', ',')" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:SealType -->
  <xsl:template match="arcn:IdentRemovalInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="arcn:IdentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="translate(arcn:Quantity, '.', ',')" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:InspectionResultsType -->
  <xsl:template match="arcn:InspectionResult">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Признак наличия повреждений гр. отделения ТС</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="arcn:CargoHoldDamageIndicator='0' or arcn:CargoHoldDamageIndicator='false' or arcn:CargoHoldDamageIndicator='FALSE' or arcn:CargoHoldDamageIndicator='f'">
                <xsl:text>нет</xsl:text>
              </xsl:when>
              <xsl:when test="arcn:CargoHoldDamageIndicator='1' or arcn:CargoHoldDamageIndicator='true' or arcn:CargoHoldDamageIndicator='TRUE' or arcn:CargoHoldDamageIndicator='t'">
                <xsl:text>да</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="arcn:CargoHoldDamageIndicator" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Признак нарушения средства идентификации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="arcn:IdentBrokenIndicator='0' or arcn:IdentBrokenIndicator='false' or arcn:IdentBrokenIndicator='FALSE' or arcn:IdentBrokenIndicator='f'">
                <xsl:text>нет</xsl:text>
              </xsl:when>
              <xsl:when test="arcn:IdentBrokenIndicator='1' or arcn:IdentBrokenIndicator='true' or arcn:IdentBrokenIndicator='TRUE' or arcn:IdentBrokenIndicator='t'">
                <xsl:text>да</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="arcn:IdentBrokenIndicator" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <xsl:if test="arcn:IdentBrokenInfo">
        <div class="title marg-top">Нарушеные средства идентификации</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер средства идентификации</td>
              <td class="graphMain bordered">Количество</td>
            </tr>
            <xsl:for-each select="arcn:IdentBrokenInfo">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Признак снятия средств идентификации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="arcn:IdentRemovalIndicator='0' or arcn:IdentRemovalIndicator='false' or arcn:IdentRemovalIndicator='FALSE' or arcn:IdentRemovalIndicator='f'">
                <xsl:text>нет</xsl:text>
              </xsl:when>
              <xsl:when test="arcn:IdentRemovalIndicator='1' or arcn:IdentRemovalIndicator='true' or arcn:IdentRemovalIndicator='TRUE' or arcn:IdentRemovalIndicator='t'">
                <xsl:text>да</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="arcn:IdentRemovalIndicator" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <xsl:if test="arcn:IdentRemovalInfo">
        <div class="title marg-top">Снятые средства идентификации</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер средства идентификации</td>
              <td class="graphMain bordered">Количество</td>
            </tr>
            <xsl:for-each select="arcn:IdentRemovalInfo">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Признак наложеных средств идентификации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:choose>
              <xsl:when test="arcn:IdentAppliedIndicator='0' or arcn:IdentAppliedIndicator='false' or arcn:IdentAppliedIndicator='FALSE' or arcn:IdentAppliedIndicator='f'">
                <xsl:text>нет</xsl:text>
              </xsl:when>
              <xsl:when test="arcn:IdentAppliedIndicator='1' or arcn:IdentAppliedIndicator='true' or arcn:IdentAppliedIndicator='TRUE' or arcn:IdentAppliedIndicator='t'">
                <xsl:text>да</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="arcn:IdentAppliedIndicator" />
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
      </table>
      <xsl:if test="arcn:IdentAppliedInfo">
        <div class="title marg-top">Наложеные средства идентификации</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер средства идентификации</td>
              <td class="graphMain bordered">Количество</td>
            </tr>
            <xsl:for-each select="arcn:IdentAppliedInfo">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:LocationPlaceType -->
  <xsl:template match="arcn:LocationPlace">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="arcn:Customs">
        <div class="title marg-top">Код и наименование таможенного органа</div>
        <div>
          <xsl:apply-templates select="arcn:Customs">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="arcn:Address">
        <div class="title marg-top">Адрес</div>
        <div>
          <xsl:apply-templates select="arcn:Address" mode="RUAddress">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="arcn:ProducedDocument">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:value-of select="cat_ru:PrDocumentName" />
        </td>
        <td class="graphMain bordered">
          <xsl:value-of select="cat_ru:PrDocumentNumber" />
        </td>
        <td class="graphMain bordered">
          <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
          </xsl:call-template>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:ProducedDocumentsType -->
  <xsl:template match="arcn:ProducedDocuments">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Количество представленных документов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="arcn:ProducedDocumentsQuantity" />
          </td>
        </tr>
      </table>
      <xsl:if test="arcn:ProducedDocument">
        <div class="title marg-top">Представленный документ</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Наименование документа</td>
              <td class="graphMain bordered">Номер документа</td>
              <td class="graphMain bordered">Дата документа</td>
            </tr>
            <xsl:for-each select="arcn:ProducedDocument">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="arcn:TD">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:call-template name="russian_date">
              <xsl:with-param name="dateIn" select="cat_ru:RegistrationDate" />
            </xsl:call-template>
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:GTDNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:TIRIDType -->
  <xsl:template match="arcn:TIRID">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер книжки МДП.</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="arcn:TIRID" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Серия книжки МДП.</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="arcn:TIRSeries" />
          </td>
        </tr>
      </table>
      <xsl:if test="arcn:TIRPageNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер листа книжки МДП.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="arcn:TIRPageNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа arcn:SVHType -->
  <xsl:template match="arcn:Warehouse">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="arcn:WarehouseName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование склада временного хранения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="arcn:WarehouseName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="arcn:Address">
        <div class="title marg-top">Адрес склада временного хранения</div>
        <div>
          <xsl:apply-templates mode="RUAddress" select="arcn:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Номер документа о включении в реестр владельцев складов временного хранения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="arcn:WarehouseLicenceID" />
          </td>
        </tr>
      </table>
      <xsl:if test="arcn:WarehouseLicenceDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата включения в реестр владельцев складов временного хранения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="arcn:WarehouseLicenceDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="cat_ru:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <xsl:template match="RUScat_ru:SubjectAddressDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="cat_ru:Contact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:value-of select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
  <xsl:template match="RUScat_ru:IdentityCard">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:call-template name="russian_date">
                <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate" />
              </xsl:call-template>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="RUScat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:value-of select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
   <xsl:template match="arcn:NotifDate">
      <div align="right">
         <table>
            <tbody>
               <tr>
                  <td width="60%"/>
                  <td align="center" class="value graphMain">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                     <xsl:value-of select="substring(//arcn:NotifTime, 1, 5)"/>
                  </td>
               </tr>
               <tr>
                  <td width="60%"/>
                  <td align="center" class="low" style="border:0;">(Дата, время подачи уведомления)</td>
               </tr>
            </tbody>
         </table>
      </div>
   </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>