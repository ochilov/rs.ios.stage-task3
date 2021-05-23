#import "LevelOrderTraversal.h"

NSUInteger LevelOrderTraversalForTreeNodes(NSArray *tree, NSMutableArray<NSMutableArray *> *levelOrderedData, NSUInteger level, NSUInteger startIndex) {
	
	typedef enum {
		LeftNode,
		RightNode
	} NodeType;
	
	NSUInteger index = startIndex;
	for (NodeType nodeType = LeftNode; nodeType <= RightNode && index < tree.count; ++nodeType) {
		NSObject *node = tree[index++];
		if ([node isKindOfClass:NSNumber.class]) {
			if (levelOrderedData.count <= level) {
				[levelOrderedData addObject:[NSMutableArray new]];
			}
			[levelOrderedData[level] addObject:node];
		 
			index = LevelOrderTraversalForTreeNodes(tree, levelOrderedData, level+1, index);
		}
	}
	return index;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
	NSMutableArray<NSMutableArray *> *levelOrderedData = [NSMutableArray new];
	NSUInteger level = 0;
	LevelOrderTraversalForTreeNodes(tree, levelOrderedData, level, 0);
	return [levelOrderedData copy];
}
