; ModuleID = 'huffman.ll'
source_filename = "huffman.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @BZ2_hbMakeCodeLengths(i8* nocapture, i32* nocapture readonly, i32, i32) local_unnamed_addr #0 {
  %5 = alloca [260 x i32], align 16
  %6 = alloca [516 x i32], align 16
  %7 = alloca [516 x i32], align 16
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %.lr.ph56.preheader, label %.preheader22

.lr.ph56.preheader:                               ; preds = %4
  %9 = add i32 %2, -1
  %xtraiter81 = and i32 %2, 3
  %lcmp.mod82 = icmp eq i32 %xtraiter81, 0
  br i1 %lcmp.mod82, label %.lr.ph56.prol.loopexit, label %.lr.ph56.prol.preheader

.lr.ph56.prol.preheader:                          ; preds = %.lr.ph56.preheader
  br label %.lr.ph56.prol

.lr.ph56.prol:                                    ; preds = %.lr.ph56.prol.preheader, %.lr.ph56.prol
  %indvars.iv77.prol = phi i64 [ %indvars.iv.next78.prol, %.lr.ph56.prol ], [ 0, %.lr.ph56.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph56.prol ], [ %xtraiter81, %.lr.ph56.prol.preheader ]
  %10 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv77.prol
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  %.op.prol = shl i32 %11, 8
  %13 = select i1 %12, i32 256, i32 %.op.prol
  %indvars.iv.next78.prol = add nuw nsw i64 %indvars.iv77.prol, 1
  %14 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next78.prol
  store i32 %13, i32* %14, align 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph56.prol.loopexit.loopexit, label %.lr.ph56.prol, !llvm.loop !1

.lr.ph56.prol.loopexit.loopexit:                  ; preds = %.lr.ph56.prol
  br label %.lr.ph56.prol.loopexit

.lr.ph56.prol.loopexit:                           ; preds = %.lr.ph56.prol.loopexit.loopexit, %.lr.ph56.preheader
  %indvars.iv77.unr = phi i64 [ 0, %.lr.ph56.preheader ], [ %indvars.iv.next78.prol, %.lr.ph56.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %9, 3
  br i1 %15, label %.preheader22, label %.lr.ph56.preheader88

.lr.ph56.preheader88:                             ; preds = %.lr.ph56.prol.loopexit
  %wide.trip.count79.3 = zext i32 %2 to i64
  %16 = add nsw i64 %wide.trip.count79.3, -4
  %17 = sub i64 %16, %indvars.iv77.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 4
  br i1 %min.iters.check, label %.lr.ph56.preheader120, label %min.iters.checked

.lr.ph56.preheader120:                            ; preds = %middle.block, %min.iters.checked, %.lr.ph56.preheader88
  %indvars.iv77.ph = phi i64 [ %indvars.iv77.unr, %min.iters.checked ], [ %indvars.iv77.unr, %.lr.ph56.preheader88 ], [ %ind.end, %middle.block ]
  br label %.lr.ph56

min.iters.checked:                                ; preds = %.lr.ph56.preheader88
  %n.mod.vf = and i64 %19, 3
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = shl nuw i64 %18, 2
  %21 = add i64 %indvars.iv77.unr, %20
  %22 = add i64 %21, 4
  %23 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %.lr.ph56.preheader120, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %24 = shl i64 %index, 2
  %25 = add i64 %indvars.iv77.unr, %24
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  %27 = bitcast i32* %26 to <16 x i32>*
  %wide.vec = load <16 x i32>, <16 x i32>* %27, align 4
  %strided.vec = shufflevector <16 x i32> %wide.vec, <16 x i32> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec93 = shufflevector <16 x i32> %wide.vec, <16 x i32> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec94 = shufflevector <16 x i32> %wide.vec, <16 x i32> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec95 = shufflevector <16 x i32> %wide.vec, <16 x i32> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %28 = icmp eq <4 x i32> %strided.vec, zeroinitializer
  %29 = shl <4 x i32> %strided.vec, <i32 8, i32 8, i32 8, i32 8>
  %30 = select <4 x i1> %28, <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32> %29
  %31 = icmp eq <4 x i32> %strided.vec93, zeroinitializer
  %32 = shl <4 x i32> %strided.vec93, <i32 8, i32 8, i32 8, i32 8>
  %33 = select <4 x i1> %31, <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32> %32
  %34 = icmp eq <4 x i32> %strided.vec94, zeroinitializer
  %35 = shl <4 x i32> %strided.vec94, <i32 8, i32 8, i32 8, i32 8>
  %36 = select <4 x i1> %34, <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32> %35
  %37 = icmp eq <4 x i32> %strided.vec95, zeroinitializer
  %38 = shl <4 x i32> %strided.vec95, <i32 8, i32 8, i32 8, i32 8>
  %39 = select <4 x i1> %37, <4 x i32> <i32 256, i32 256, i32 256, i32 256>, <4 x i32> %38
  %40 = add nsw i64 %25, 4
  %41 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %40
  %42 = getelementptr i32, i32* %41, i64 -3
  %43 = bitcast i32* %42 to <16 x i32>*
  %44 = shufflevector <4 x i32> %30, <4 x i32> %33, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %45 = shufflevector <4 x i32> %36, <4 x i32> %39, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec = shufflevector <8 x i32> %44, <8 x i32> %45, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec, <16 x i32>* %43, align 4
  %index.next = add i64 %index, 4
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader22, label %.lr.ph56.preheader120

.preheader22.loopexit:                            ; preds = %.lr.ph56
  br label %.preheader22

.preheader22:                                     ; preds = %.preheader22.loopexit, %middle.block, %.lr.ph56.prol.loopexit, %4
  %47 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 0
  %48 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 0
  %49 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 0
  %50 = icmp slt i32 %2, 1
  %51 = icmp slt i32 %2, 1
  %52 = icmp slt i32 %2, 1
  %53 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 1
  %scevgep = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 1
  %scevgep60 = bitcast i32* %scevgep to i8*
  %54 = add i32 %2, -1
  %55 = zext i32 %54 to i64
  %56 = shl nuw nsw i64 %55, 2
  %57 = add nuw nsw i64 %56, 4
  %58 = sext i32 %2 to i64
  %59 = add i32 %2, 1
  %60 = add i32 %2, -1
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %61 = icmp eq i32 %60, 0
  %xtraiter75 = and i32 %2, 1
  %lcmp.mod76 = icmp eq i32 %xtraiter75, 0
  %62 = icmp eq i32 %60, 0
  %wide.trip.count73.1 = zext i32 %59 to i64
  %63 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 1
  %wide.trip.count.1 = zext i32 %59 to i64
  %64 = icmp slt i32 %2, 260
  %65 = icmp sgt i32 %2, 1
  %66 = sext i32 %2 to i64
  %67 = shl i32 %2, 1
  %68 = add i32 %67, -1
  %69 = add nsw i64 %wide.trip.count73.1, -2
  br label %.loopexit

.lr.ph56:                                         ; preds = %.lr.ph56.preheader120, %.lr.ph56
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.3, %.lr.ph56 ], [ %indvars.iv77.ph, %.lr.ph56.preheader120 ]
  %70 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv77
  %71 = load i32, i32* %70, align 4
  %72 = icmp eq i32 %71, 0
  %.op = shl i32 %71, 8
  %73 = select i1 %72, i32 256, i32 %.op
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %74 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next78
  store i32 %73, i32* %74, align 4
  %75 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next78
  %76 = load i32, i32* %75, align 4
  %77 = icmp eq i32 %76, 0
  %.op.1 = shl i32 %76, 8
  %78 = select i1 %77, i32 256, i32 %.op.1
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %79 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next78.1
  store i32 %78, i32* %79, align 4
  %80 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next78.1
  %81 = load i32, i32* %80, align 4
  %82 = icmp eq i32 %81, 0
  %.op.2 = shl i32 %81, 8
  %83 = select i1 %82, i32 256, i32 %.op.2
  %indvars.iv.next78.2 = add nsw i64 %indvars.iv77, 3
  %84 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next78.2
  store i32 %83, i32* %84, align 4
  %85 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next78.2
  %86 = load i32, i32* %85, align 4
  %87 = icmp eq i32 %86, 0
  %.op.3 = shl i32 %86, 8
  %88 = select i1 %87, i32 256, i32 %.op.3
  %indvars.iv.next78.3 = add nsw i64 %indvars.iv77, 4
  %89 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next78.3
  store i32 %88, i32* %89, align 4
  %exitcond80.3 = icmp eq i64 %indvars.iv.next78.3, %wide.trip.count79.3
  br i1 %exitcond80.3, label %.preheader22.loopexit, label %.lr.ph56, !llvm.loop !6

.loopexit.loopexit:                               ; preds = %.lr.ph53
  br label %.loopexit.backedge

.loopexit:                                        ; preds = %.loopexit.backedge, %.preheader22
  store i32 0, i32* %47, align 16
  store i32 0, i32* %48, align 16
  store i32 -2, i32* %49, align 16
  br i1 %50, label %.preheader20, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep60, i8 -1, i64 %57, i32 4, i1 false)
  br label %.lr.ph

.lr.ph:                                           ; preds = %105, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next, %105 ]
  %.0524 = phi i32 [ 0, %.lr.ph.preheader ], [ %90, %105 ]
  %90 = add nuw nsw i32 %.0524, 1
  %91 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv
  %92 = load i32, i32* %91, align 4
  %93 = trunc i64 %indvars.iv to i32
  br label %94

; <label>:94:                                     ; preds = %94, %.lr.ph
  %.07.sink = phi i32 [ %90, %.lr.ph ], [ %.07, %94 ]
  %.sink = phi i32 [ %93, %.lr.ph ], [ %100, %94 ]
  %.07 = phi i32 [ %90, %.lr.ph ], [ %97, %94 ]
  %95 = sext i32 %.07.sink to i64
  %96 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %95
  store i32 %.sink, i32* %96, align 4
  %97 = ashr i32 %.07, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %98
  %100 = load i32, i32* %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %101
  %103 = load i32, i32* %102, align 4
  %104 = icmp slt i32 %92, %103
  br i1 %104, label %94, label %105

; <label>:105:                                    ; preds = %94
  %106 = sext i32 %.07 to i64
  %107 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %106
  %108 = trunc i64 %indvars.iv to i32
  store i32 %108, i32* %107, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i32 %90, %2
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %105
  br i1 %64, label %.preheader21, label %.preheader21.thread

.preheader21.thread:                              ; preds = %._crit_edge
  tail call void @BZ2_bz__AssertH__fail(i32 2001) #4
  br label %.lr.ph45.preheader

.preheader21:                                     ; preds = %._crit_edge
  br i1 %65, label %.lr.ph45.preheader, label %._crit_edge46

.lr.ph45.preheader:                               ; preds = %.preheader21.thread, %.preheader21
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %.lr.ph45.preheader, %._crit_edge41
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge41 ], [ %66, %.lr.ph45.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge41 ], [ %58, %.lr.ph45.preheader ]
  %109 = load i32, i32* %53, align 4
  %110 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %indvars.iv63
  %111 = load i32, i32* %110, align 4
  store i32 %111, i32* %53, align 4
  %indvars.iv.next64 = add nsw i64 %indvars.iv63, -1
  %112 = icmp sgt i64 %indvars.iv63, 2
  br i1 %112, label %.lr.ph27, label %._crit_edge28

.lr.ph27:                                         ; preds = %.lr.ph45
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %113
  %115 = load i32, i32* %114, align 4
  br label %116

; <label>:116:                                    ; preds = %.lr.ph27, %143
  %117 = phi i32 [ 2, %.lr.ph27 ], [ %146, %143 ]
  %.0625 = phi i32 [ 1, %.lr.ph27 ], [ %.03, %143 ]
  %118 = sext i32 %117 to i64
  %119 = icmp slt i64 %118, %indvars.iv.next64
  br i1 %119, label %120, label %135

; <label>:120:                                    ; preds = %116
  %121 = or i32 %117, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %122
  %124 = load i32, i32* %123, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %125
  %127 = load i32, i32* %126, align 4
  %128 = sext i32 %117 to i64
  %129 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %128
  %130 = load i32, i32* %129, align 8
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %131
  %133 = load i32, i32* %132, align 4
  %134 = icmp slt i32 %127, %133
  %. = select i1 %134, i32 %121, i32 %117
  br label %135

; <label>:135:                                    ; preds = %120, %116
  %.03 = phi i32 [ %117, %116 ], [ %., %120 ]
  %136 = sext i32 %.03 to i64
  %137 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %136
  %138 = load i32, i32* %137, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  %142 = icmp slt i32 %115, %141
  br i1 %142, label %._crit_edge28.loopexit, label %143

; <label>:143:                                    ; preds = %135
  %144 = sext i32 %.0625 to i64
  %145 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %144
  store i32 %138, i32* %145, align 4
  %146 = shl i32 %.03, 1
  %147 = sext i32 %146 to i64
  %148 = icmp slt i64 %147, %indvars.iv63
  br i1 %148, label %116, label %._crit_edge28.loopexit

._crit_edge28.loopexit:                           ; preds = %135, %143
  %.06.lcssa.ph = phi i32 [ %.0625, %135 ], [ %.03, %143 ]
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %.lr.ph45
  %.06.lcssa = phi i32 [ 1, %.lr.ph45 ], [ %.06.lcssa.ph, %._crit_edge28.loopexit ]
  %149 = sext i32 %.06.lcssa to i64
  %150 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %149
  store i32 %111, i32* %150, align 4
  %151 = load i32, i32* %53, align 4
  %152 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %indvars.iv.next64
  %153 = load i32, i32* %152, align 4
  store i32 %153, i32* %53, align 4
  %154 = add nsw i64 %indvars.iv63, -2
  %155 = icmp slt i64 %154, 2
  br i1 %155, label %._crit_edge35, label %.lr.ph34

.lr.ph34:                                         ; preds = %._crit_edge28
  %156 = sext i32 %153 to i64
  %157 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %156
  %158 = load i32, i32* %157, align 4
  br label %159

; <label>:159:                                    ; preds = %.lr.ph34, %186
  %160 = phi i32 [ 2, %.lr.ph34 ], [ %189, %186 ]
  %.0232 = phi i32 [ 1, %.lr.ph34 ], [ %.01, %186 ]
  %161 = sext i32 %160 to i64
  %162 = icmp slt i64 %161, %154
  br i1 %162, label %163, label %178

; <label>:163:                                    ; preds = %159
  %164 = or i32 %160, 1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %165
  %167 = load i32, i32* %166, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %168
  %170 = load i32, i32* %169, align 4
  %171 = sext i32 %160 to i64
  %172 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %171
  %173 = load i32, i32* %172, align 8
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %174
  %176 = load i32, i32* %175, align 4
  %177 = icmp slt i32 %170, %176
  %.14 = select i1 %177, i32 %164, i32 %160
  br label %178

; <label>:178:                                    ; preds = %163, %159
  %.01 = phi i32 [ %160, %159 ], [ %.14, %163 ]
  %179 = sext i32 %.01 to i64
  %180 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %179
  %181 = load i32, i32* %180, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = icmp slt i32 %158, %184
  br i1 %185, label %._crit_edge35.loopexit, label %186

; <label>:186:                                    ; preds = %178
  %187 = sext i32 %.0232 to i64
  %188 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %187
  store i32 %181, i32* %188, align 4
  %189 = shl i32 %.01, 1
  %190 = sext i32 %189 to i64
  %191 = icmp sgt i64 %190, %154
  br i1 %191, label %._crit_edge35.loopexit, label %159

._crit_edge35.loopexit:                           ; preds = %178, %186
  %.02.lcssa.ph = phi i32 [ %.0232, %178 ], [ %.01, %186 ]
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %._crit_edge28
  %.02.lcssa = phi i32 [ 1, %._crit_edge28 ], [ %.02.lcssa.ph, %._crit_edge35.loopexit ]
  %192 = sext i32 %.02.lcssa to i64
  %193 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %192
  store i32 %153, i32* %193, align 4
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  %194 = sext i32 %151 to i64
  %195 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 %194
  %196 = trunc i64 %indvars.iv.next62 to i32
  store i32 %196, i32* %195, align 4
  %197 = sext i32 %109 to i64
  %198 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 %197
  %199 = trunc i64 %indvars.iv.next62 to i32
  store i32 %199, i32* %198, align 4
  %200 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %197
  %201 = load i32, i32* %200, align 4
  %202 = and i32 %201, -256
  %203 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %194
  %204 = load i32, i32* %203, align 4
  %205 = and i32 %204, -256
  %206 = add i32 %205, %202
  %207 = and i32 %201, 255
  %208 = and i32 %204, 255
  %209 = icmp ugt i32 %207, %208
  %.15 = select i1 %209, i32 %109, i32 %151
  %.pn = sext i32 %.15 to i64
  %.in.in = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %.pn
  %.in = load i32, i32* %.in.in, align 4
  %210 = and i32 %.in, 255
  %211 = add nuw nsw i32 %210, 1
  %212 = or i32 %211, %206
  %213 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next62
  store i32 %212, i32* %213, align 4
  %214 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 %indvars.iv.next62
  store i32 -1, i32* %214, align 4
  %215 = trunc i64 %indvars.iv.next62 to i32
  store i32 %215, i32* %152, align 4
  %216 = trunc i64 %indvars.iv.next64 to i32
  %217 = ashr i32 %216, 1
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %218
  %220 = load i32, i32* %219, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %221
  %223 = load i32, i32* %222, align 4
  %224 = icmp slt i32 %212, %223
  %225 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %indvars.iv.next64
  br i1 %224, label %.lr.ph40, label %._crit_edge41

.lr.ph40:                                         ; preds = %._crit_edge35
  %226 = load i32, i32* %213, align 4
  br label %227

; <label>:227:                                    ; preds = %.lr.ph40, %227
  %228 = phi i32* [ %225, %.lr.ph40 ], [ %240, %227 ]
  %229 = phi i32 [ %220, %.lr.ph40 ], [ %234, %227 ]
  %230 = phi i32 [ %217, %.lr.ph40 ], [ %231, %227 ]
  store i32 %229, i32* %228, align 4
  %231 = ashr i32 %230, 1
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %232
  %234 = load i32, i32* %233, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %235
  %237 = load i32, i32* %236, align 4
  %238 = icmp slt i32 %226, %237
  %239 = sext i32 %230 to i64
  %240 = getelementptr inbounds [260 x i32], [260 x i32]* %5, i64 0, i64 %239
  br i1 %238, label %227, label %._crit_edge41.loopexit

._crit_edge41.loopexit:                           ; preds = %227
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %._crit_edge35
  %.lcssa = phi i32* [ %225, %._crit_edge35 ], [ %240, %._crit_edge41.loopexit ]
  %241 = trunc i64 %indvars.iv.next62 to i32
  store i32 %241, i32* %.lcssa, align 4
  %242 = icmp sgt i64 %indvars.iv.next64, 1
  br i1 %242, label %.lr.ph45, label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %._crit_edge41
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.preheader21
  %.04.lcssa = phi i32 [ %2, %.preheader21 ], [ %68, %._crit_edge46.loopexit ]
  %243 = icmp slt i32 %.04.lcssa, 516
  br i1 %243, label %.preheader20, label %244

; <label>:244:                                    ; preds = %._crit_edge46
  tail call void @BZ2_bz__AssertH__fail(i32 2002) #4
  br label %.preheader20

.preheader20:                                     ; preds = %.loopexit, %244, %._crit_edge46
  br i1 %51, label %._crit_edge50.thread, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader20
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  %.011.prol = phi i32 [ %247, %.preheader.prol ], [ 1, %.preheader.prol.preheader ]
  %.010.prol = phi i32 [ %249, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %245 = sext i32 %.011.prol to i64
  %246 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 %245
  %247 = load i32, i32* %246, align 4
  %248 = icmp sgt i32 %247, -1
  %249 = add nuw nsw i32 %.010.prol, 1
  br i1 %248, label %.preheader.prol, label %250

; <label>:250:                                    ; preds = %.preheader.prol
  %251 = trunc i32 %.010.prol to i8
  store i8 %251, i8* %0, align 1
  %252 = icmp sgt i32 %.010.prol, %3
  %..012.prol = zext i1 %252 to i8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %250, %.preheader.preheader
  %indvars.iv67.unr.ph = phi i64 [ 2, %250 ], [ 1, %.preheader.preheader ]
  %.01248.unr.ph = phi i8 [ %..012.prol, %250 ], [ 0, %.preheader.preheader ]
  %..012.lcssa.unr.ph = phi i8 [ %..012.prol, %250 ], [ undef, %.preheader.preheader ]
  br i1 %61, label %._crit_edge50, label %.preheader.preheader119

.preheader.preheader119:                          ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader119, %312
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %312 ], [ %indvars.iv67.unr.ph, %.preheader.preheader119 ]
  %.01248 = phi i8 [ %..012.1, %312 ], [ %.01248.unr.ph, %.preheader.preheader119 ]
  %253 = trunc i64 %indvars.iv67 to i32
  br label %254

; <label>:254:                                    ; preds = %254, %.preheader
  %.011 = phi i32 [ %257, %254 ], [ %253, %.preheader ]
  %.010 = phi i32 [ %259, %254 ], [ 0, %.preheader ]
  %255 = sext i32 %.011 to i64
  %256 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 %255
  %257 = load i32, i32* %256, align 4
  %258 = icmp sgt i32 %257, -1
  %259 = add nuw nsw i32 %.010, 1
  br i1 %258, label %254, label %.preheader.170

.preheader.170:                                   ; preds = %254
  %260 = trunc i32 %.010 to i8
  %261 = add nsw i64 %indvars.iv67, -1
  %262 = getelementptr inbounds i8, i8* %0, i64 %261
  store i8 %260, i8* %262, align 1
  %263 = icmp sgt i32 %.010, %3
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %264 = trunc i64 %indvars.iv.next68 to i32
  br label %306

._crit_edge50.loopexit:                           ; preds = %312
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader.prol.loopexit
  %.012.lcssa = phi i8 [ %..012.lcssa.unr.ph, %.preheader.prol.loopexit ], [ %..012.1, %._crit_edge50.loopexit ]
  %265 = icmp eq i8 %.012.lcssa, 0
  br i1 %265, label %._crit_edge50.thread, label %.preheader19

.preheader19:                                     ; preds = %._crit_edge50
  br i1 %52, label %.loopexit.backedge, label %.lr.ph53.preheader

.lr.ph53.preheader:                               ; preds = %.preheader19
  br i1 %lcmp.mod76, label %.lr.ph53.prol.loopexit, label %.lr.ph53.prol

.lr.ph53.prol:                                    ; preds = %.lr.ph53.preheader
  %266 = load i32, i32* %63, align 4
  %267 = ashr i32 %266, 8
  %268 = sdiv i32 %267, 2
  %269 = shl nsw i32 %268, 8
  %270 = add nsw i32 %269, 256
  store i32 %270, i32* %63, align 4
  br label %.lr.ph53.prol.loopexit

.lr.ph53.prol.loopexit:                           ; preds = %.lr.ph53.prol, %.lr.ph53.preheader
  %indvars.iv71.unr.ph = phi i64 [ 2, %.lr.ph53.prol ], [ 1, %.lr.ph53.preheader ]
  br i1 %62, label %.loopexit.backedge, label %.lr.ph53.preheader90

.lr.ph53.preheader90:                             ; preds = %.lr.ph53.prol.loopexit
  %271 = sub nsw i64 %69, %indvars.iv71.unr.ph
  %272 = lshr i64 %271, 1
  %273 = add nuw i64 %272, 1
  %min.iters.check99 = icmp ult i64 %273, 4
  br i1 %min.iters.check99, label %.lr.ph53.preheader118, label %min.iters.checked100

min.iters.checked100:                             ; preds = %.lr.ph53.preheader90
  %n.mod.vf101 = and i64 %273, 3
  %n.vec102 = sub i64 %273, %n.mod.vf101
  %cmp.zero103 = icmp eq i64 %n.vec102, 0
  %274 = add nuw nsw i64 %indvars.iv71.unr.ph, 2
  %275 = shl nuw i64 %272, 1
  %276 = add i64 %274, %275
  %277 = shl nuw nsw i64 %n.mod.vf101, 1
  %ind.end108 = sub i64 %276, %277
  br i1 %cmp.zero103, label %.lr.ph53.preheader118, label %vector.body96.preheader

vector.body96.preheader:                          ; preds = %min.iters.checked100
  br label %vector.body96

vector.body96:                                    ; preds = %vector.body96.preheader, %vector.body96
  %index105 = phi i64 [ %index.next106, %vector.body96 ], [ 0, %vector.body96.preheader ]
  %278 = shl i64 %index105, 1
  %offset.idx110 = or i64 %indvars.iv71.unr.ph, %278
  %279 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %offset.idx110
  %280 = bitcast i32* %279 to <8 x i32>*
  %wide.vec114 = load <8 x i32>, <8 x i32>* %280, align 4
  %strided.vec115 = shufflevector <8 x i32> %wide.vec114, <8 x i32> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %strided.vec116 = shufflevector <8 x i32> %wide.vec114, <8 x i32> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %281 = ashr <4 x i32> %strided.vec115, <i32 8, i32 8, i32 8, i32 8>
  %282 = sdiv <4 x i32> %281, <i32 2, i32 2, i32 2, i32 2>
  %283 = shl nsw <4 x i32> %282, <i32 8, i32 8, i32 8, i32 8>
  %284 = add nsw <4 x i32> %283, <i32 256, i32 256, i32 256, i32 256>
  %285 = add nuw nsw i64 %offset.idx110, 1
  %286 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %285
  %287 = ashr <4 x i32> %strided.vec116, <i32 8, i32 8, i32 8, i32 8>
  %288 = sdiv <4 x i32> %287, <i32 2, i32 2, i32 2, i32 2>
  %289 = shl nsw <4 x i32> %288, <i32 8, i32 8, i32 8, i32 8>
  %290 = add nsw <4 x i32> %289, <i32 256, i32 256, i32 256, i32 256>
  %291 = getelementptr i32, i32* %286, i64 -1
  %292 = bitcast i32* %291 to <8 x i32>*
  %interleaved.vec117 = shufflevector <4 x i32> %284, <4 x i32> %290, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i32> %interleaved.vec117, <8 x i32>* %292, align 4
  %index.next106 = add i64 %index105, 4
  %293 = icmp eq i64 %index.next106, %n.vec102
  br i1 %293, label %middle.block97, label %vector.body96, !llvm.loop !8

middle.block97:                                   ; preds = %vector.body96
  %cmp.n109 = icmp eq i64 %n.mod.vf101, 0
  br i1 %cmp.n109, label %.loopexit.backedge, label %.lr.ph53.preheader118

.loopexit.backedge:                               ; preds = %middle.block97, %.lr.ph53.prol.loopexit, %.preheader19, %.loopexit.loopexit
  br label %.loopexit

.lr.ph53.preheader118:                            ; preds = %middle.block97, %min.iters.checked100, %.lr.ph53.preheader90
  %indvars.iv71.ph = phi i64 [ %indvars.iv71.unr.ph, %min.iters.checked100 ], [ %indvars.iv71.unr.ph, %.lr.ph53.preheader90 ], [ %ind.end108, %middle.block97 ]
  br label %.lr.ph53

.lr.ph53:                                         ; preds = %.lr.ph53.preheader118, %.lr.ph53
  %indvars.iv71 = phi i64 [ %indvars.iv.next72.1, %.lr.ph53 ], [ %indvars.iv71.ph, %.lr.ph53.preheader118 ]
  %294 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv71
  %295 = load i32, i32* %294, align 4
  %296 = ashr i32 %295, 8
  %297 = sdiv i32 %296, 2
  %298 = shl nsw i32 %297, 8
  %299 = add nsw i32 %298, 256
  store i32 %299, i32* %294, align 4
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %300 = getelementptr inbounds [516 x i32], [516 x i32]* %6, i64 0, i64 %indvars.iv.next72
  %301 = load i32, i32* %300, align 4
  %302 = ashr i32 %301, 8
  %303 = sdiv i32 %302, 2
  %304 = shl nsw i32 %303, 8
  %305 = add nsw i32 %304, 256
  store i32 %305, i32* %300, align 4
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, %wide.trip.count73.1
  br i1 %exitcond74.1, label %.loopexit.loopexit, label %.lr.ph53, !llvm.loop !9

._crit_edge50.thread:                             ; preds = %.preheader20, %._crit_edge50
  ret void

; <label>:306:                                    ; preds = %306, %.preheader.170
  %.011.1 = phi i32 [ %309, %306 ], [ %264, %.preheader.170 ]
  %.010.1 = phi i32 [ %311, %306 ], [ 0, %.preheader.170 ]
  %307 = sext i32 %.011.1 to i64
  %308 = getelementptr inbounds [516 x i32], [516 x i32]* %7, i64 0, i64 %307
  %309 = load i32, i32* %308, align 4
  %310 = icmp sgt i32 %309, -1
  %311 = add nuw nsw i32 %.010.1, 1
  br i1 %310, label %306, label %312

; <label>:312:                                    ; preds = %306
  %313 = trunc i32 %.010.1 to i8
  %314 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv67
  store i8 %313, i8* %314, align 1
  %315 = icmp sgt i32 %.010.1, %3
  %316 = or i1 %315, %263
  %..012.1 = select i1 %316, i8 1, i8 %.01248
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond69.1 = icmp eq i64 %indvars.iv.next68.1, %wide.trip.count.1
  br i1 %exitcond69.1, label %._crit_edge50.loopexit, label %.preheader
}

declare void @BZ2_bz__AssertH__fail(i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @BZ2_hbAssignCodes(i32* nocapture, i8* nocapture readonly, i32, i32, i32) local_unnamed_addr #2 {
  %6 = icmp sle i32 %2, %3
  %7 = icmp sgt i32 %4, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %5
  %xtraiter = and i32 %4, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %8 = icmp eq i32 %4, 1
  %wide.trip.count.1 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %.016.us = phi i32 [ %26, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %.025.us = phi i32 [ %27, %._crit_edge.us ], [ %2, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %9 = load i8, i8* %1, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, %.025.us
  br i1 %11, label %12, label %.prol.loopexit

; <label>:12:                                     ; preds = %.prol.preheader
  %13 = or i32 %.016.us, 1
  store i32 %.016.us, i32* %0, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %12, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 0, %.preheader.us ], [ 1, %12 ], [ 1, %.prol.preheader ]
  %.13.us.unr.ph = phi i32 [ %.016.us, %.preheader.us ], [ %13, %12 ], [ %.016.us, %.prol.preheader ]
  %.2.us.lcssa.unr.ph = phi i32 [ undef, %.preheader.us ], [ %13, %12 ], [ %.016.us, %.prol.preheader ]
  br i1 %8, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %32
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %32 ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %.13.us = phi i32 [ %.2.us.1, %32 ], [ %.13.us.unr.ph, %.preheader.us.new.preheader ]
  %14 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %16, %.025.us
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %.preheader.us.new
  %19 = add nsw i32 %.13.us, 1
  %20 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %.13.us, i32* %20, align 4
  br label %21

; <label>:21:                                     ; preds = %18, %.preheader.us.new
  %.2.us = phi i32 [ %19, %18 ], [ %.13.us, %.preheader.us.new ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = getelementptr inbounds i8, i8* %1, i64 %indvars.iv.next
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, %.025.us
  br i1 %25, label %29, label %32

._crit_edge.us.loopexit:                          ; preds = %32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %.2.us.lcssa = phi i32 [ %.2.us.lcssa.unr.ph, %.prol.loopexit ], [ %.2.us.1, %._crit_edge.us.loopexit ]
  %26 = shl i32 %.2.us.lcssa, 1
  %27 = add nsw i32 %.025.us, 1
  %28 = icmp slt i32 %.025.us, %3
  br i1 %28, label %.preheader.us, label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %5
  ret void

; <label>:29:                                     ; preds = %21
  %30 = add nsw i32 %.2.us, 1
  %31 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  store i32 %.2.us, i32* %31, align 4
  br label %32

; <label>:32:                                     ; preds = %29, %21
  %.2.us.1 = phi i32 [ %30, %29 ], [ %.2.us, %21 ]
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @BZ2_hbCreateDecodeTables(i32* nocapture, i32* nocapture, i32* nocapture, i8* nocapture readonly, i32, i32, i32) local_unnamed_addr #2 {
  %8 = bitcast i32* %0 to i8*
  %9 = bitcast i32* %1 to i8*
  %10 = icmp slt i32 %5, %4
  br i1 %10, label %.preheader9, label %.preheader11.lr.ph

.preheader11.lr.ph:                               ; preds = %7
  %11 = icmp sgt i32 %6, 0
  br i1 %11, label %.preheader11.us.preheader, label %.preheader9.thread

.preheader11.us.preheader:                        ; preds = %.preheader11.lr.ph
  %xtraiter49 = and i32 %6, 1
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  %12 = icmp eq i32 %6, 1
  %wide.trip.count48.1 = zext i32 %6 to i64
  br label %.preheader11.us

.preheader9.thread:                               ; preds = %.preheader11.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 92, i32 4, i1 false)
  br label %.preheader6

.preheader11.us:                                  ; preds = %.preheader11.us.preheader, %._crit_edge26.us
  %.0228.us = phi i32 [ %34, %._crit_edge26.us ], [ %4, %.preheader11.us.preheader ]
  %.0327.us = phi i32 [ %.25.us.lcssa, %._crit_edge26.us ], [ 0, %.preheader11.us.preheader ]
  br i1 %lcmp.mod50, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader11.us
  %13 = load i8, i8* %3, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp eq i32 %14, %.0228.us
  br i1 %15, label %16, label %.prol.loopexit

; <label>:16:                                     ; preds = %.prol.preheader
  %17 = add nsw i32 %.0327.us, 1
  %18 = sext i32 %.0327.us to i64
  %19 = getelementptr inbounds i32, i32* %2, i64 %18
  store i32 0, i32* %19, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader11.us, %16, %.prol.preheader
  %indvars.iv46.unr.ph = phi i64 [ 0, %.preheader11.us ], [ 1, %16 ], [ 1, %.prol.preheader ]
  %.1423.us.unr.ph = phi i32 [ %.0327.us, %.preheader11.us ], [ %17, %16 ], [ %.0327.us, %.prol.preheader ]
  %.25.us.lcssa.unr.ph = phi i32 [ undef, %.preheader11.us ], [ %17, %16 ], [ %.0327.us, %.prol.preheader ]
  br i1 %12, label %._crit_edge26.us, label %.preheader11.us.new.preheader

.preheader11.us.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader11.us.new

.preheader11.us.new:                              ; preds = %.preheader11.us.new.preheader, %189
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %189 ], [ %indvars.iv46.unr.ph, %.preheader11.us.new.preheader ]
  %.1423.us = phi i32 [ %.25.us.1, %189 ], [ %.1423.us.unr.ph, %.preheader11.us.new.preheader ]
  %20 = getelementptr inbounds i8, i8* %3, i64 %indvars.iv46
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = icmp eq i32 %22, %.0228.us
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %.preheader11.us.new
  %25 = add nsw i32 %.1423.us, 1
  %26 = sext i32 %.1423.us to i64
  %27 = getelementptr inbounds i32, i32* %2, i64 %26
  %28 = trunc i64 %indvars.iv46 to i32
  store i32 %28, i32* %27, align 4
  br label %29

; <label>:29:                                     ; preds = %24, %.preheader11.us.new
  %.25.us = phi i32 [ %25, %24 ], [ %.1423.us, %.preheader11.us.new ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %30 = getelementptr inbounds i8, i8* %3, i64 %indvars.iv.next47
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, %.0228.us
  br i1 %33, label %184, label %189

._crit_edge26.us.loopexit:                        ; preds = %189
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %.prol.loopexit
  %.25.us.lcssa = phi i32 [ %.25.us.lcssa.unr.ph, %.prol.loopexit ], [ %.25.us.1, %._crit_edge26.us.loopexit ]
  %34 = add nsw i32 %.0228.us, 1
  %35 = icmp slt i32 %.0228.us, %5
  br i1 %35, label %.preheader11.us, label %.preheader9.loopexit

.preheader9.loopexit:                             ; preds = %._crit_edge26.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %7
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 92, i32 4, i1 false)
  %36 = icmp sgt i32 %6, 0
  br i1 %36, label %.lr.ph21.preheader, label %.preheader6

.lr.ph21.preheader:                               ; preds = %.preheader9
  %xtraiter40 = and i32 %6, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod41, label %.lr.ph21.prol.loopexit, label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.preheader
  %37 = load i8, i8* %3, align 1
  %38 = zext i8 %37 to i64
  %39 = add nuw nsw i64 %38, 1
  %40 = getelementptr inbounds i32, i32* %1, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %40, align 4
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.preheader, %.lr.ph21.prol
  %indvars.iv37.unr = phi i64 [ 0, %.lr.ph21.preheader ], [ 1, %.lr.ph21.prol ]
  %43 = icmp eq i32 %6, 1
  br i1 %43, label %.preheader6, label %.lr.ph21.preheader54

.lr.ph21.preheader54:                             ; preds = %.lr.ph21.prol.loopexit
  %wide.trip.count39.1 = zext i32 %6 to i64
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader54, %.lr.ph21
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph21 ], [ %indvars.iv37.unr, %.lr.ph21.preheader54 ]
  %44 = getelementptr inbounds i8, i8* %3, i64 %indvars.iv37
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i64
  %47 = add nuw nsw i64 %46, 1
  %48 = getelementptr inbounds i32, i32* %1, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %48, align 4
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %51 = getelementptr inbounds i8, i8* %3, i64 %indvars.iv.next38
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i64
  %54 = add nuw nsw i64 %53, 1
  %55 = getelementptr inbounds i32, i32* %1, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %55, align 4
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.143 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count39.1
  br i1 %exitcond.143, label %.preheader6.loopexit, label %.lr.ph21

.preheader6.loopexit:                             ; preds = %.lr.ph21
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.lr.ph21.prol.loopexit, %.preheader9.thread, %.preheader9
  %58 = load i32, i32* %1, align 4
  %59 = getelementptr inbounds i32, i32* %1, i64 1
  %60 = load i32, i32* %59, align 4
  %61 = add nsw i32 %60, %58
  store i32 %61, i32* %59, align 4
  %62 = getelementptr inbounds i32, i32* %1, i64 2
  %63 = load i32, i32* %62, align 4
  %64 = add nsw i32 %63, %61
  store i32 %64, i32* %62, align 4
  %65 = getelementptr inbounds i32, i32* %1, i64 3
  %66 = load i32, i32* %65, align 4
  %67 = add nsw i32 %66, %64
  store i32 %67, i32* %65, align 4
  %68 = getelementptr inbounds i32, i32* %1, i64 4
  %69 = load i32, i32* %68, align 4
  %70 = add nsw i32 %69, %67
  store i32 %70, i32* %68, align 4
  %71 = getelementptr inbounds i32, i32* %1, i64 5
  %72 = load i32, i32* %71, align 4
  %73 = add nsw i32 %72, %70
  store i32 %73, i32* %71, align 4
  %74 = getelementptr inbounds i32, i32* %1, i64 6
  %75 = load i32, i32* %74, align 4
  %76 = add nsw i32 %75, %73
  store i32 %76, i32* %74, align 4
  %77 = getelementptr inbounds i32, i32* %1, i64 7
  %78 = load i32, i32* %77, align 4
  %79 = add nsw i32 %78, %76
  store i32 %79, i32* %77, align 4
  %80 = getelementptr inbounds i32, i32* %1, i64 8
  %81 = load i32, i32* %80, align 4
  %82 = add nsw i32 %81, %79
  store i32 %82, i32* %80, align 4
  %83 = getelementptr inbounds i32, i32* %1, i64 9
  %84 = load i32, i32* %83, align 4
  %85 = add nsw i32 %84, %82
  store i32 %85, i32* %83, align 4
  %86 = getelementptr inbounds i32, i32* %1, i64 10
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %87, %85
  store i32 %88, i32* %86, align 4
  %89 = getelementptr inbounds i32, i32* %1, i64 11
  %90 = load i32, i32* %89, align 4
  %91 = add nsw i32 %90, %88
  store i32 %91, i32* %89, align 4
  %92 = getelementptr inbounds i32, i32* %1, i64 12
  %93 = load i32, i32* %92, align 4
  %94 = add nsw i32 %93, %91
  store i32 %94, i32* %92, align 4
  %95 = getelementptr inbounds i32, i32* %1, i64 13
  %96 = load i32, i32* %95, align 4
  %97 = add nsw i32 %96, %94
  store i32 %97, i32* %95, align 4
  %98 = getelementptr inbounds i32, i32* %1, i64 14
  %99 = load i32, i32* %98, align 4
  %100 = add nsw i32 %99, %97
  store i32 %100, i32* %98, align 4
  %101 = getelementptr inbounds i32, i32* %1, i64 15
  %102 = load i32, i32* %101, align 4
  %103 = add nsw i32 %102, %100
  store i32 %103, i32* %101, align 4
  %104 = getelementptr inbounds i32, i32* %1, i64 16
  %105 = load i32, i32* %104, align 4
  %106 = add nsw i32 %105, %103
  store i32 %106, i32* %104, align 4
  %107 = getelementptr inbounds i32, i32* %1, i64 17
  %108 = load i32, i32* %107, align 4
  %109 = add nsw i32 %108, %106
  store i32 %109, i32* %107, align 4
  %110 = getelementptr inbounds i32, i32* %1, i64 18
  %111 = load i32, i32* %110, align 4
  %112 = add nsw i32 %111, %109
  store i32 %112, i32* %110, align 4
  %113 = getelementptr inbounds i32, i32* %1, i64 19
  %114 = load i32, i32* %113, align 4
  %115 = add nsw i32 %114, %112
  store i32 %115, i32* %113, align 4
  %116 = getelementptr inbounds i32, i32* %1, i64 20
  %117 = load i32, i32* %116, align 4
  %118 = add nsw i32 %117, %115
  store i32 %118, i32* %116, align 4
  %119 = getelementptr inbounds i32, i32* %1, i64 21
  %120 = load i32, i32* %119, align 4
  %121 = add nsw i32 %120, %118
  store i32 %121, i32* %119, align 4
  %122 = getelementptr inbounds i32, i32* %1, i64 22
  %123 = load i32, i32* %122, align 4
  %124 = add nsw i32 %123, %121
  store i32 %124, i32* %122, align 4
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 92, i32 4, i1 false)
  %125 = icmp slt i32 %5, %4
  br i1 %125, label %.preheader, label %.lr.ph17.preheader

.lr.ph17.preheader:                               ; preds = %.preheader6
  %126 = sext i32 %4 to i64
  %127 = sext i32 %5 to i64
  %128 = add nsw i64 %127, 1
  %129 = sub nsw i64 %128, %126
  %xtraiter55 = and i64 %129, 1
  %lcmp.mod56 = icmp eq i64 %xtraiter55, 0
  br i1 %lcmp.mod56, label %.lr.ph17.prol.loopexit, label %.lr.ph17.prol.preheader

.lr.ph17.prol.preheader:                          ; preds = %.lr.ph17.preheader
  br label %.lr.ph17.prol

.lr.ph17.prol:                                    ; preds = %.lr.ph17.prol.preheader
  %indvars.iv.next31.prol = add nsw i64 %126, 1
  %130 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next31.prol
  %131 = load i32, i32* %130, align 4
  %132 = getelementptr inbounds i32, i32* %1, i64 %126
  %133 = load i32, i32* %132, align 4
  %134 = sub nsw i32 %131, %133
  %135 = add nsw i32 %134, -1
  %136 = getelementptr inbounds i32, i32* %0, i64 %126
  store i32 %135, i32* %136, align 4
  %137 = shl i32 %134, 1
  br label %.lr.ph17.prol.loopexit

.lr.ph17.prol.loopexit:                           ; preds = %.lr.ph17.preheader, %.lr.ph17.prol
  %indvars.iv30.unr = phi i64 [ %126, %.lr.ph17.preheader ], [ %indvars.iv.next31.prol, %.lr.ph17.prol ]
  %.016.unr = phi i32 [ 0, %.lr.ph17.preheader ], [ %137, %.lr.ph17.prol ]
  %138 = icmp eq i32 %5, %4
  br i1 %138, label %.preheader.loopexit, label %.lr.ph17.preheader.new

.lr.ph17.preheader.new:                           ; preds = %.lr.ph17.prol.loopexit
  br label %.lr.ph17

.preheader.loopexit.unr-lcssa:                    ; preds = %.lr.ph17
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.lr.ph17.prol.loopexit, %.preheader.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader6
  %139 = icmp sgt i32 %5, %4
  br i1 %139, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %140 = sext i32 %4 to i64
  %141 = sub i32 %5, %4
  %142 = add i32 %5, -1
  %xtraiter = and i32 %141, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %indvars.iv.next.prol = add nsw i64 %140, 1
  %143 = getelementptr inbounds i32, i32* %0, i64 %140
  %144 = load i32, i32* %143, align 4
  %145 = shl i32 %144, 1
  %146 = add i32 %145, 2
  %147 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next.prol
  %148 = load i32, i32* %147, align 4
  %149 = sub i32 %146, %148
  store i32 %149, i32* %147, align 4
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr = phi i64 [ %140, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol ]
  %150 = icmp eq i32 %142, %4
  br i1 %150, label %._crit_edge, label %.lr.ph.preheader53

.lr.ph.preheader53:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = sext i32 %5 to i64
  br label %.lr.ph

.lr.ph17:                                         ; preds = %.lr.ph17, %.lr.ph17.preheader.new
  %indvars.iv30 = phi i64 [ %indvars.iv30.unr, %.lr.ph17.preheader.new ], [ %indvars.iv.next31.1, %.lr.ph17 ]
  %.016 = phi i32 [ %.016.unr, %.lr.ph17.preheader.new ], [ %168, %.lr.ph17 ]
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %151 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next31
  %152 = load i32, i32* %151, align 4
  %153 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv30
  %154 = load i32, i32* %153, align 4
  %155 = sub nsw i32 %152, %154
  %156 = add nsw i32 %155, %.016
  %157 = add nsw i32 %156, -1
  %158 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv30
  store i32 %157, i32* %158, align 4
  %159 = shl i32 %156, 1
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %160 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next31.1
  %161 = load i32, i32* %160, align 4
  %162 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next31
  %163 = load i32, i32* %162, align 4
  %164 = sub nsw i32 %161, %163
  %165 = add nsw i32 %164, %159
  %166 = add nsw i32 %165, -1
  %167 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next31
  store i32 %166, i32* %167, align 4
  %168 = shl i32 %165, 1
  %169 = icmp slt i64 %indvars.iv.next31, %127
  br i1 %169, label %.lr.ph17, label %.preheader.loopexit.unr-lcssa

.lr.ph:                                           ; preds = %.lr.ph.preheader53, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader53 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %170 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %171 = load i32, i32* %170, align 4
  %172 = shl i32 %171, 1
  %173 = add i32 %172, 2
  %174 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next
  %175 = load i32, i32* %174, align 4
  %176 = sub i32 %173, %175
  store i32 %176, i32* %174, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %177 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %178 = load i32, i32* %177, align 4
  %179 = shl i32 %178, 1
  %180 = add i32 %179, 2
  %181 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next.1
  %182 = load i32, i32* %181, align 4
  %183 = sub i32 %180, %182
  store i32 %183, i32* %181, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  ret void

; <label>:184:                                    ; preds = %29
  %185 = add nsw i32 %.25.us, 1
  %186 = sext i32 %.25.us to i64
  %187 = getelementptr inbounds i32, i32* %2, i64 %186
  %188 = trunc i64 %indvars.iv.next47 to i32
  store i32 %188, i32* %187, align 4
  br label %189

; <label>:189:                                    ; preds = %184, %29
  %.25.us.1 = phi i32 [ %185, %184 ], [ %.25.us, %29 ]
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.152 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count48.1
  br i1 %exitcond.152, label %._crit_edge26.us.loopexit, label %.preheader11.us.new
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = distinct !{!9, !7, !4, !5}
