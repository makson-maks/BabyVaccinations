﻿
#Область ОбработчикиСобытийОбъекта

Процедура ПриКопировании(ОбъектКопирования)
	
	Наименование = "";
	
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	
	Если Предопределенный Тогда
		ТекстСообщения = НСтр("ru = 'Данный календарь нельзя удалить'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения,,,,Отказ);
	Иначе
		РаботаСКалендаремСервер.ОбработатьУдалениеКалендаря(Ссылка);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти