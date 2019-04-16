﻿
#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ОчиститьКалендарьПрививок(Команда)
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ОчиститьКалендарьПрививокОтветНаВопрос", ЭтотОбъект);
	ПоказатьВопрос(ОписаниеОповещения, "Будут очищены все календари. Продолжить?", РежимДиалогаВопрос.ДаНет, 60);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработкаКомандФормы

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

#КонецОбласти

#Область СлужебныеПроцедурыФункции

&НаКлиенте
Процедура ОчиститьКалендарьПрививокОтветНаВопрос(РезультатВопроса, ДополнительныеПараметры) Экспорт
	
	Если РезультатВопроса = КодВозвратаДиалога.Да Тогда
		ОчиститьКалендарьПрививокСервере();	
		ТекстСообщения = НСтр("ru = 'Календари прививок очищены'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения);
	КонецЕсли; 
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ОчиститьКалендарьПрививокСервере()

	НаборЗаписей = РегистрыСведений.ПрививкиВОчереди.СоздатьНаборЗаписей();
	НаборЗаписей.Записать();
	
КонецПроцедуры

#КонецОбласти