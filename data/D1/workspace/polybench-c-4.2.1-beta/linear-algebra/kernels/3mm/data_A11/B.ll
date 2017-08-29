; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %._crit_edge.preheader.lr.ph, label %._crit_edge55.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %._crit_edge.preheader.us.preheader, label %._crit_edge57.preheader

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count105 = zext i32 %2 to i64
  %wide.trip.count109 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv107 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next108, %._crit_edge._crit_edge.us ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv103 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next104, %._crit_edge.us ]
  %14 = mul nuw nsw i64 %indvars.iv103, %indvars.iv107
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv107, i64 %indvars.iv103
  store double %19, double* %20, align 8
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, %wide.trip.count105
  br i1 %exitcond106, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count109
  br i1 %exitcond110, label %._crit_edge55.preheader.loopexit, label %._crit_edge.preheader.us

._crit_edge55.preheader.loopexit:                 ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge55.preheader

._crit_edge55.preheader:                          ; preds = %._crit_edge55.preheader.loopexit, %9
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %._crit_edge56.preheader.lr.ph, label %._crit_edge57.preheader

._crit_edge56.preheader.lr.ph:                    ; preds = %._crit_edge55.preheader
  %22 = icmp sgt i32 %1, 0
  %23 = mul nsw i32 %1, 5
  %24 = sitofp i32 %23 to double
  br i1 %22, label %._crit_edge56.preheader.us.preheader, label %._crit_edge59.preheader

._crit_edge56.preheader.us.preheader:             ; preds = %._crit_edge56.preheader.lr.ph
  %wide.trip.count96 = zext i32 %1 to i64
  %wide.trip.count100 = zext i32 %2 to i64
  br label %._crit_edge56.preheader.us

._crit_edge56.preheader.us:                       ; preds = %._crit_edge56._crit_edge.us, %._crit_edge56.preheader.us.preheader
  %indvars.iv98 = phi i64 [ 0, %._crit_edge56.preheader.us.preheader ], [ %indvars.iv.next99, %._crit_edge56._crit_edge.us ]
  br label %._crit_edge56.us

._crit_edge56.us:                                 ; preds = %._crit_edge56.us, %._crit_edge56.preheader.us
  %indvars.iv94 = phi i64 [ 0, %._crit_edge56.preheader.us ], [ %indvars.iv.next95, %._crit_edge56.us ]
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %25 = mul nuw nsw i64 %indvars.iv.next95, %indvars.iv98
  %26 = add nuw nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %24
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv98, i64 %indvars.iv94
  store double %30, double* %31, align 8
  %exitcond97 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  br i1 %exitcond97, label %._crit_edge56._crit_edge.us, label %._crit_edge56.us

._crit_edge56._crit_edge.us:                      ; preds = %._crit_edge56.us
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %._crit_edge57.preheader.loopexit, label %._crit_edge56.preheader.us

._crit_edge57.preheader.loopexit:                 ; preds = %._crit_edge56._crit_edge.us
  br label %._crit_edge57.preheader

._crit_edge57.preheader:                          ; preds = %._crit_edge57.preheader.loopexit, %._crit_edge55.preheader, %._crit_edge.preheader.lr.ph
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %._crit_edge58.preheader.lr.ph, label %._crit_edge59.preheader

._crit_edge58.preheader.lr.ph:                    ; preds = %._crit_edge57.preheader
  %33 = icmp sgt i32 %4, 0
  %34 = mul nsw i32 %3, 5
  %35 = sitofp i32 %34 to double
  br i1 %33, label %._crit_edge58.preheader.us.preheader, label %._crit_edge59._crit_edge

._crit_edge58.preheader.us.preheader:             ; preds = %._crit_edge58.preheader.lr.ph
  %wide.trip.count87 = zext i32 %4 to i64
  %wide.trip.count91 = zext i32 %1 to i64
  br label %._crit_edge58.preheader.us

._crit_edge58.preheader.us:                       ; preds = %._crit_edge58._crit_edge.us, %._crit_edge58.preheader.us.preheader
  %indvars.iv89 = phi i64 [ 0, %._crit_edge58.preheader.us.preheader ], [ %indvars.iv.next90, %._crit_edge58._crit_edge.us ]
  br label %._crit_edge58.us

._crit_edge58.us:                                 ; preds = %._crit_edge58.us, %._crit_edge58.preheader.us
  %indvars.iv85 = phi i64 [ 0, %._crit_edge58.preheader.us ], [ %indvars.iv.next86, %._crit_edge58.us ]
  %36 = add nuw nsw i64 %indvars.iv85, 3
  %37 = mul nuw nsw i64 %36, %indvars.iv89
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %3
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %35
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv89, i64 %indvars.iv85
  store double %41, double* %42, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %._crit_edge58._crit_edge.us, label %._crit_edge58.us

._crit_edge58._crit_edge.us:                      ; preds = %._crit_edge58.us
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %._crit_edge59.preheader.loopexit, label %._crit_edge58.preheader.us

._crit_edge59.preheader.loopexit:                 ; preds = %._crit_edge58._crit_edge.us
  br label %._crit_edge59.preheader

._crit_edge59.preheader:                          ; preds = %._crit_edge59.preheader.loopexit, %._crit_edge57.preheader, %._crit_edge56.preheader.lr.ph
  %43 = icmp sgt i32 %4, 0
  br i1 %43, label %._crit_edge60.preheader.lr.ph, label %._crit_edge59._crit_edge

._crit_edge60.preheader.lr.ph:                    ; preds = %._crit_edge59.preheader
  %44 = icmp sgt i32 %3, 0
  %45 = mul nsw i32 %2, 5
  %46 = sitofp i32 %45 to double
  br i1 %44, label %._crit_edge60.preheader.us.preheader, label %._crit_edge59._crit_edge

._crit_edge60.preheader.us.preheader:             ; preds = %._crit_edge60.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count82 = zext i32 %4 to i64
  br label %._crit_edge60.preheader.us

._crit_edge60.preheader.us:                       ; preds = %._crit_edge60._crit_edge.us, %._crit_edge60.preheader.us.preheader
  %indvars.iv80 = phi i64 [ 0, %._crit_edge60.preheader.us.preheader ], [ %indvars.iv.next81, %._crit_edge60._crit_edge.us ]
  br label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %._crit_edge60.us, %._crit_edge60.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge60.preheader.us ], [ %indvars.iv.next, %._crit_edge60.us ]
  %47 = add nuw nsw i64 %indvars.iv, 2
  %48 = mul nuw nsw i64 %47, %indvars.iv80
  %49 = add nuw nsw i64 %48, 2
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %2
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %46
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv80, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge60._crit_edge.us, label %._crit_edge60.us

._crit_edge60._crit_edge.us:                      ; preds = %._crit_edge60.us
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %._crit_edge59._crit_edge.loopexit, label %._crit_edge60.preheader.us

._crit_edge59._crit_edge.loopexit:                ; preds = %._crit_edge60._crit_edge.us
  br label %._crit_edge59._crit_edge

._crit_edge59._crit_edge:                         ; preds = %._crit_edge59._crit_edge.loopexit, %._crit_edge60.preheader.lr.ph, %._crit_edge59.preheader, %._crit_edge58.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]*, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]*) #0 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %._crit_edge.preheader.lr.ph, label %._crit_edge79.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %._crit_edge.preheader.us.preheader, label %._crit_edge82.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count197 = zext i32 %0 to i64
  %xtraiter187 = and i32 %2, 1
  %lcmp.mod188 = icmp eq i32 %xtraiter187, 0
  %20 = icmp eq i32 %2, 1
  %wide.trip.count191 = zext i32 %1 to i64
  %wide.trip.count183.1 = zext i32 %2 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv195 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next196, %._crit_edge._crit_edge.us ]
  %21 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv195
  %sunkaddr.us = ptrtoint [900 x double]* %21 to i64
  br i1 %15, label %.lr.ph118.us.us.preheader, label %._crit_edge._crit_edge.us.loopexit137

.lr.ph118.us.us.preheader:                        ; preds = %._crit_edge.preheader.us
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv195, i64 0
  br label %.lr.ph118.us.us

._crit_edge._crit_edge.us.loopexit137:            ; preds = %._crit_edge.preheader.us
  %scevgep179 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv195, i64 0
  %scevgep179180 = bitcast double* %scevgep179 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep179180, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge._crit_edge.us

._crit_edge._crit_edge.us.loopexit:               ; preds = %._crit_edge119.us.us
  br label %._crit_edge._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us.loopexit, %._crit_edge._crit_edge.us.loopexit137
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next196, %wide.trip.count197
  br i1 %exitcond198, label %._crit_edge79.preheader.loopexit, label %._crit_edge.preheader.us

.lr.ph118.us.us:                                  ; preds = %._crit_edge119.us.us, %.lr.ph118.us.us.preheader
  %indvars.iv189 = phi i64 [ 0, %.lr.ph118.us.us.preheader ], [ %indvars.iv.next190, %._crit_edge119.us.us ]
  %23 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv195, i64 %indvars.iv189
  store double 0.000000e+00, double* %23, align 8
  %sunkaddr68.us.us = shl nsw i64 %indvars.iv189, 3
  %sunkaddr69.us.us = add i64 %sunkaddr68.us.us, %sunkaddr.us
  %sunkaddr70.us.us = inttoptr i64 %sunkaddr69.us.us to double*
  br i1 %lcmp.mod188, label %.prol.loopexit186, label %.prol.preheader185

.prol.preheader185:                               ; preds = %.lr.ph118.us.us
  %24 = load double, double* %22, align 8
  %25 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv189
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = load double, double* %sunkaddr70.us.us, align 8
  %29 = fadd double %28, %27
  store double %29, double* %sunkaddr70.us.us, align 8
  br label %.prol.loopexit186

.prol.loopexit186:                                ; preds = %.lr.ph118.us.us, %.prol.preheader185
  %indvars.iv181.unr.ph = phi i64 [ 1, %.prol.preheader185 ], [ 0, %.lr.ph118.us.us ]
  br i1 %20, label %._crit_edge119.us.us, label %.lr.ph118.us.us.new.preheader

.lr.ph118.us.us.new.preheader:                    ; preds = %.prol.loopexit186
  %.pre = load double, double* %sunkaddr70.us.us, align 8
  br label %.lr.ph118.us.us.new

._crit_edge119.us.us.loopexit:                    ; preds = %.lr.ph118.us.us.new
  br label %._crit_edge119.us.us

._crit_edge119.us.us:                             ; preds = %._crit_edge119.us.us.loopexit, %.prol.loopexit186
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next190, %wide.trip.count191
  br i1 %exitcond192, label %._crit_edge._crit_edge.us.loopexit, label %.lr.ph118.us.us

.lr.ph118.us.us.new:                              ; preds = %.lr.ph118.us.us.new, %.lr.ph118.us.us.new.preheader
  %30 = phi double [ %.pre, %.lr.ph118.us.us.new.preheader ], [ %42, %.lr.ph118.us.us.new ]
  %indvars.iv181 = phi i64 [ %indvars.iv181.unr.ph, %.lr.ph118.us.us.new.preheader ], [ %indvars.iv.next182.1, %.lr.ph118.us.us.new ]
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv195, i64 %indvars.iv181
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv181, i64 %indvars.iv189
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr70.us.us, align 8
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv195, i64 %indvars.iv.next182
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next182, i64 %indvars.iv189
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %sunkaddr70.us.us, align 8
  %indvars.iv.next182.1 = add nuw nsw i64 %indvars.iv181, 2
  %exitcond184.1 = icmp eq i64 %indvars.iv.next182.1, %wide.trip.count183.1
  br i1 %exitcond184.1, label %._crit_edge119.us.us.loopexit, label %.lr.ph118.us.us.new

._crit_edge79.preheader.loopexit:                 ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge79.preheader

._crit_edge79.preheader:                          ; preds = %._crit_edge79.preheader.loopexit, %12
  %43 = icmp sgt i32 %1, 0
  br i1 %43, label %._crit_edge80.preheader.lr.ph, label %._crit_edge81.preheader

._crit_edge80.preheader.lr.ph:                    ; preds = %._crit_edge79.preheader
  %44 = icmp sgt i32 %3, 0
  %45 = icmp sgt i32 %4, 0
  br i1 %44, label %._crit_edge80.preheader.us.preheader, label %._crit_edge81.preheader

._crit_edge80.preheader.us.preheader:             ; preds = %._crit_edge80.preheader.lr.ph
  %46 = add i32 %3, -1
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 3
  %49 = add nuw nsw i64 %48, 8
  %wide.trip.count172 = zext i32 %1 to i64
  %xtraiter162 = and i32 %4, 1
  %lcmp.mod163 = icmp eq i32 %xtraiter162, 0
  %50 = icmp eq i32 %4, 1
  %wide.trip.count166 = zext i32 %3 to i64
  %wide.trip.count158.1 = zext i32 %4 to i64
  br label %._crit_edge80.preheader.us

._crit_edge80.preheader.us:                       ; preds = %._crit_edge80._crit_edge.us, %._crit_edge80.preheader.us.preheader
  %indvars.iv170 = phi i64 [ 0, %._crit_edge80.preheader.us.preheader ], [ %indvars.iv.next171, %._crit_edge80._crit_edge.us ]
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv170
  %sunkaddr71.us = ptrtoint [1100 x double]* %51 to i64
  br i1 %45, label %.lr.ph101.us.us.preheader, label %._crit_edge80._crit_edge.us.loopexit135

.lr.ph101.us.us.preheader:                        ; preds = %._crit_edge80.preheader.us
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv170, i64 0
  br label %.lr.ph101.us.us

._crit_edge80._crit_edge.us.loopexit135:          ; preds = %._crit_edge80.preheader.us
  %scevgep154 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv170, i64 0
  %scevgep154155 = bitcast double* %scevgep154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154155, i8 0, i64 %49, i32 8, i1 false)
  br label %._crit_edge80._crit_edge.us

._crit_edge80._crit_edge.us.loopexit:             ; preds = %._crit_edge102.us.us
  br label %._crit_edge80._crit_edge.us

._crit_edge80._crit_edge.us:                      ; preds = %._crit_edge80._crit_edge.us.loopexit, %._crit_edge80._crit_edge.us.loopexit135
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond173 = icmp eq i64 %indvars.iv.next171, %wide.trip.count172
  br i1 %exitcond173, label %._crit_edge81.preheader.loopexit, label %._crit_edge80.preheader.us

.lr.ph101.us.us:                                  ; preds = %._crit_edge102.us.us, %.lr.ph101.us.us.preheader
  %indvars.iv164 = phi i64 [ 0, %.lr.ph101.us.us.preheader ], [ %indvars.iv.next165, %._crit_edge102.us.us ]
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv170, i64 %indvars.iv164
  store double 0.000000e+00, double* %53, align 8
  %sunkaddr72.us.us = shl nsw i64 %indvars.iv164, 3
  %sunkaddr73.us.us = add i64 %sunkaddr72.us.us, %sunkaddr71.us
  %sunkaddr74.us.us = inttoptr i64 %sunkaddr73.us.us to double*
  br i1 %lcmp.mod163, label %.prol.loopexit161, label %.prol.preheader160

.prol.preheader160:                               ; preds = %.lr.ph101.us.us
  %54 = load double, double* %52, align 8
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv164
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = load double, double* %sunkaddr74.us.us, align 8
  %59 = fadd double %58, %57
  store double %59, double* %sunkaddr74.us.us, align 8
  br label %.prol.loopexit161

.prol.loopexit161:                                ; preds = %.lr.ph101.us.us, %.prol.preheader160
  %indvars.iv156.unr.ph = phi i64 [ 1, %.prol.preheader160 ], [ 0, %.lr.ph101.us.us ]
  br i1 %50, label %._crit_edge102.us.us, label %.lr.ph101.us.us.new.preheader

.lr.ph101.us.us.new.preheader:                    ; preds = %.prol.loopexit161
  %.pre200 = load double, double* %sunkaddr74.us.us, align 8
  br label %.lr.ph101.us.us.new

._crit_edge102.us.us.loopexit:                    ; preds = %.lr.ph101.us.us.new
  br label %._crit_edge102.us.us

._crit_edge102.us.us:                             ; preds = %._crit_edge102.us.us.loopexit, %.prol.loopexit161
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %._crit_edge80._crit_edge.us.loopexit, label %.lr.ph101.us.us

.lr.ph101.us.us.new:                              ; preds = %.lr.ph101.us.us.new, %.lr.ph101.us.us.new.preheader
  %60 = phi double [ %.pre200, %.lr.ph101.us.us.new.preheader ], [ %72, %.lr.ph101.us.us.new ]
  %indvars.iv156 = phi i64 [ %indvars.iv156.unr.ph, %.lr.ph101.us.us.new.preheader ], [ %indvars.iv.next157.1, %.lr.ph101.us.us.new ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv170, i64 %indvars.iv156
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv156, i64 %indvars.iv164
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %sunkaddr74.us.us, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv170, i64 %indvars.iv.next157
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next157, i64 %indvars.iv164
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %sunkaddr74.us.us, align 8
  %indvars.iv.next157.1 = add nuw nsw i64 %indvars.iv156, 2
  %exitcond159.1 = icmp eq i64 %indvars.iv.next157.1, %wide.trip.count158.1
  br i1 %exitcond159.1, label %._crit_edge102.us.us.loopexit, label %.lr.ph101.us.us.new

._crit_edge81.preheader.loopexit:                 ; preds = %._crit_edge80._crit_edge.us
  br label %._crit_edge81.preheader

._crit_edge81.preheader:                          ; preds = %._crit_edge81.preheader.loopexit, %._crit_edge80.preheader.lr.ph, %._crit_edge79.preheader
  br i1 %13, label %._crit_edge82.preheader.lr.ph, label %._crit_edge81._crit_edge

._crit_edge82.preheader.lr.ph:                    ; preds = %._crit_edge81.preheader, %._crit_edge.preheader.lr.ph
  %73 = icmp sgt i32 %3, 0
  %74 = icmp sgt i32 %1, 0
  br i1 %73, label %._crit_edge82.preheader.us.preheader, label %._crit_edge81._crit_edge

._crit_edge82.preheader.us.preheader:             ; preds = %._crit_edge82.preheader.lr.ph
  %75 = add i32 %3, -1
  %76 = zext i32 %75 to i64
  %77 = shl nuw nsw i64 %76, 3
  %78 = add nuw nsw i64 %77, 8
  %wide.trip.count147 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %79 = icmp eq i32 %1, 1
  %wide.trip.count142 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %._crit_edge82.preheader.us

._crit_edge82.preheader.us:                       ; preds = %._crit_edge82._crit_edge.us, %._crit_edge82.preheader.us.preheader
  %indvars.iv145 = phi i64 [ 0, %._crit_edge82.preheader.us.preheader ], [ %indvars.iv.next146, %._crit_edge82._crit_edge.us ]
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv145
  %sunkaddr75.us = ptrtoint [1100 x double]* %80 to i64
  br i1 %74, label %.lr.ph.us.us.preheader, label %._crit_edge82._crit_edge.us.loopexit133

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge82.preheader.us
  %81 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv145, i64 0
  br label %.lr.ph.us.us

._crit_edge82._crit_edge.us.loopexit133:          ; preds = %._crit_edge82.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv145, i64 0
  %scevgep139 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep139, i8 0, i64 %78, i32 8, i1 false)
  br label %._crit_edge82._crit_edge.us

._crit_edge82._crit_edge.us.loopexit:             ; preds = %._crit_edge85.us.us
  br label %._crit_edge82._crit_edge.us

._crit_edge82._crit_edge.us:                      ; preds = %._crit_edge82._crit_edge.us.loopexit, %._crit_edge82._crit_edge.us.loopexit133
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, %wide.trip.count147
  br i1 %exitcond148, label %._crit_edge81._crit_edge.loopexit, label %._crit_edge82.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge85.us.us, %.lr.ph.us.us.preheader
  %indvars.iv140 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next141, %._crit_edge85.us.us ]
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv145, i64 %indvars.iv140
  store double 0.000000e+00, double* %82, align 8
  %sunkaddr76.us.us = shl nsw i64 %indvars.iv140, 3
  %sunkaddr77.us.us = add i64 %sunkaddr76.us.us, %sunkaddr75.us
  %sunkaddr78.us.us = inttoptr i64 %sunkaddr77.us.us to double*
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %83 = load double, double* %81, align 8
  %84 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv140
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %sunkaddr78.us.us, align 8
  %88 = fadd double %87, %86
  store double %88, double* %sunkaddr78.us.us, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %79, label %._crit_edge85.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %.pre201 = load double, double* %sunkaddr78.us.us, align 8
  br label %.lr.ph.us.us.new

._crit_edge85.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge85.us.us

._crit_edge85.us.us:                              ; preds = %._crit_edge85.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond, label %._crit_edge82._crit_edge.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %89 = phi double [ %.pre201, %.lr.ph.us.us.new.preheader ], [ %101, %.lr.ph.us.us.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %90 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv145, i64 %indvars.iv
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv140
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %89, %94
  store double %95, double* %sunkaddr78.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %96 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv145, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv140
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fadd double %95, %100
  store double %101, double* %sunkaddr78.us.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge85.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge81._crit_edge.loopexit:                ; preds = %._crit_edge82._crit_edge.us
  br label %._crit_edge81._crit_edge

._crit_edge81._crit_edge:                         ; preds = %._crit_edge81._crit_edge.loopexit, %._crit_edge82.preheader.lr.ph, %._crit_edge81.preheader
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge12.us._crit_edge

._crit_edge12.us._crit_edge:                      ; preds = %._crit_edge12.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge12.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge12.us

; <label>:16:                                     ; preds = %._crit_edge12.us._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us._crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge12.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge12.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
