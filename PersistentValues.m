classdef PersistentValues < handle
    properties
        % persistentVariable 声明为私有属性，以确保只能在类的方法内部访问
        persistentVariable
    end
    
    methods
        % 构造函数
        function obj = PersistentValues(initialValue)
            obj.persistentVariable = initialValue;
        end
        
        % 修改变量值的方法
        function modifyVariable(obj, newValue)
            obj.persistentVariable = newValue;
        end
        
        % 显示变量值的方法
        function showVariable(obj)
            disp(['Persistent Variable = ', num2str(obj.persistentVariable)]);
        end
    end
end
