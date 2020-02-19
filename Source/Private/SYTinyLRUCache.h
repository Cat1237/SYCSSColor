//
//  SYTinyLRUCache.h
//  SYCSSColor
//
//  Created by Tino on 2018/9/25.
//  Copyright © 2018年 Tino. All rights reserved.
//

#pragma once

#import <vector>

namespace SY {
    
    template<typename KeyType, typename ValueType>
    struct TinyLRUCachePolicy {
        static bool isKeyNull(const KeyType&) { return false; }
        static ValueType createValueForNullKey() { return { }; }
        static ValueType createValueForKey(const KeyType&) { return { }; }
    };
    
    template<typename KeyType, typename ValueType, size_t capacity = 4, typename Policy = TinyLRUCachePolicy<KeyType, ValueType>>
    class TinyLRUCache {
    public:
        const ValueType& get(const KeyType& key)
        {
            if (Policy::isKeyNull(key)) {
                static dispatch_once_t onceToken;
                static ValueType valueForNull_;
                dispatch_once(&onceToken, ^{
                    valueForNull_ = Policy::createValueForNullKey();

                });
                return valueForNull_;
            }
            
            for (size_t i = 0; i < _cache.size(); ++i) {
                if (_cache[i].first != key)
                    continue;
                
                if (i == _cache.size() - 1)
                    return _cache[i].second;
                
                // If the entry is not the last one, move it to the end of the cache.
                Entry entry = _cache[i];
                _cache.erase(_cache.begin() + i);
                _cache.push_back(entry);
                return _cache[_cache.size() - 1].second;
            }
            
            // _cache[0] is the LRU entry, so remove it.
            if (_cache.size() == capacity)
                _cache.erase(_cache.begin());
            
            _cache.push_back(std::make_pair(key, Policy::createValueForKey(key)));
            return _cache.back().second;
        }
        
    private:
        typedef std::pair<KeyType, ValueType> Entry;
        typedef std::vector<Entry> Cache;
        Cache _cache;
    };
}

using SY::TinyLRUCache;
using SY::TinyLRUCachePolicy;

