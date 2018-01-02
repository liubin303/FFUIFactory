//
//  NSObject+AssociatedObjects.h
//  FFUIFactory
//
//  Created by 刘彬 on 2016/10/20.
//  Copyright © 2016年 Wanda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObjects)

/*!
 *  @brief  关联策略：strong, nonatomic
 *
 *  @param object 被关联对象
 *  @param key   key
 */
- (void)associateStrongNonatomicObject:(id)object withKey:(const void *)key;

/*!
 *  @brief  关联策略：strong, atomic
 *
 *  @param object 被关联对象
 *  @param key   key
 *
 */
- (void)associateStrongAtomicObject:(id)object withKey:(const void *)key;

/*!
 *  @brief  关联策略：copy, nonatomic
 *
 *  @param object 被关联对象
 *  @param key   key
 *
 */
- (void)associateCopyNonatomicObject:(id)object withKey:(const void *)key;

/*!
 *  @brief  关联策略：copy, atomic
 *
 *  @param object 被关联对象
 *  @param key   key
 *
 */
- (void)associateCopyAtomicObject:(id)object withKey:(const void *)key;

/*!
 *  @brief  关联策略：Assign
 *
 *  @param object 被关联对象
 *  @param key   key
 *
 */
- (void)associateAssignObject:(id)object withKey:(const void *)key;

/*!
 *  @brief  获取关联对象
 *
 *  @param key keu
 *
 *  @return 被关联对象的value
 *
 */
- (id)associatedObjectForKey:(const void *)key;

/*!
 *  @brief  移除所有关联对象
 *
 */
- (void)removeAllAssociatedObjects;

@end
