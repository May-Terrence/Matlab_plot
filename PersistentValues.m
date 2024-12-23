classdef PersistentValues < handle
    properties
        % persistentVariable ����Ϊ˽�����ԣ���ȷ��ֻ������ķ����ڲ�����
        persistentVariable
    end
    
    methods
        % ���캯��
        function obj = PersistentValues(initialValue)
            obj.persistentVariable = initialValue;
        end
        
        % �޸ı���ֵ�ķ���
        function modifyVariable(obj, newValue)
            obj.persistentVariable = newValue;
        end
        
        % ��ʾ����ֵ�ķ���
        function showVariable(obj)
            disp(['Persistent Variable = ', num2str(obj.persistentVariable)]);
        end
    end
end
