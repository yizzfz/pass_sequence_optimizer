; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 2000, i32* %5, align 4
  %7 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %8 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %7, i8** %8, align 8
  %9 = bitcast i8* %7 to [2000 x double]*
  call void @init_array([2000 x double]* %9)
  call void (...) @polybench_timer_start() #4
  %10 = load i32, i32* %5, align 4
  %11 = bitcast i8* %7 to [2000 x double]*
  call void @kernel_lu(i32 %10, [2000 x double]* %11)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %12 = load i32, i32* %3, align 4
  %13 = icmp sgt i32 %12, 42
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %2
  %15 = load i8**, i8*** %4, align 8
  %16 = load i8*, i8** %15, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %5, align 4
  %20 = bitcast [2000 x [2000 x double]]** %6 to [2000 x double]**
  %21 = load [2000 x double]*, [2000 x double]** %20, align 8
  call void @print_array(i32 %19, [2000 x double]* %21)
  br label %22

; <label>:22:                                     ; preds = %14, %18, %2
  %23 = bitcast [2000 x [2000 x double]]** %6 to i8**
  %24 = load i8*, i8** %23, align 8
  call void @free(i8* %24) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [2000 x double]*, align 8
  %4 = alloca i32, align 4
  %5 = alloca [2000 x [2000 x double]]*, align 8
  store i32 2000, i32* %2, align 4
  store [2000 x double]* %0, [2000 x double]** %3, align 8
  br label %.preheader15

.preheader15:                                     ; preds = %1, %.loopexit181
  %indvars.iv6297 = phi i64 [ 1, %1 ], [ %indvars.iv.next63, %.loopexit181 ]
  %indvars.iv6495 = phi i64 [ 0, %1 ], [ %indvars.iv.next65, %.loopexit181 ]
  %6 = sub i64 1999, %indvars.iv6495
  %7 = add i64 %6, -4
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %10 = sub i64 1999, %indvars.iv6495
  br label %11

; <label>:11:                                     ; preds = %.preheader15, %11
  %indvars.iv4888 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next49, %11 ]
  %12 = sub nsw i64 0, %indvars.iv4888
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 2000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fadd double %16, 1.000000e+00
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %indvars.iv4888
  store double %17, double* %18, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv4888, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %indvars.iv6297
  br i1 %exitcond, label %19, label %11

; <label>:19:                                     ; preds = %11
  %indvars.iv.next5589 = add nuw nsw i64 %indvars.iv6495, 1
  %20 = icmp slt i64 %indvars.iv.next5589, 2000
  br i1 %20, label %.lr.ph92, label %.loopexit181

.lr.ph92:                                         ; preds = %19
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph92
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next5589, %n.vec
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter186 = and i64 %9, 3
  %lcmp.mod187 = icmp eq i64 %xtraiter186, 0
  br i1 %lcmp.mod187, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter188 = phi i64 [ %prol.iter188.sub, %vector.body.prol ], [ %xtraiter186, %vector.body.prol.preheader ]
  %21 = add i64 %indvars.iv.next5589, %index.prol
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %21
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter188.sub = add i64 %prol.iter188, -1
  %prol.iter188.cmp = icmp eq i64 %prol.iter188.sub, 0
  br i1 %prol.iter188.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %26 = icmp ult i64 %7, 12
  br i1 %26, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %27 = add i64 %indvars.iv.next5589, %index
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %index.next = add i64 %index, 4
  %32 = add i64 %indvars.iv.next5589, %index.next
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %34, align 8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %36, align 8
  %index.next.1 = add i64 %index, 8
  %37 = add i64 %indvars.iv.next5589, %index.next.1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next.2 = add i64 %index, 12
  %42 = add i64 %indvars.iv.next5589, %index.next.2
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %46, align 8
  %index.next.3 = add i64 %index, 16
  %47 = icmp eq i64 %index.next.3, %n.vec
  br i1 %47, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %.loopexit181, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph92
  %indvars.iv.next5590.ph = phi i64 [ %indvars.iv.next5589, %min.iters.checked ], [ %indvars.iv.next5589, %.lr.ph92 ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv.next5590 = phi i64 [ %indvars.iv.next55, %scalar.ph ], [ %indvars.iv.next5590.ph, %scalar.ph.preheader ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %indvars.iv.next5590
  store double 0.000000e+00, double* %48, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv.next5590, 1
  %49 = icmp slt i64 %indvars.iv.next55, 2000
  br i1 %49, label %scalar.ph, label %.loopexit181.loopexit, !llvm.loop !6

.loopexit181.loopexit:                            ; preds = %scalar.ph
  br label %.loopexit181

.loopexit181:                                     ; preds = %.loopexit181.loopexit, %middle.block, %19
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6495, i64 %indvars.iv6495
  store double 1.000000e+00, double* %50, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv6495, 1
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv6297, 1
  %51 = icmp slt i64 %indvars.iv.next65, 2000
  br i1 %51, label %.preheader15, label %52

; <label>:52:                                     ; preds = %.loopexit181
  %53 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %54 = bitcast [2000 x [2000 x double]]** %5 to i8**
  store i8* %53, i8** %54, align 8
  %55 = load i32, i32* %2, align 4
  %.promoted28 = load i32, i32* %4, align 4
  %56 = sext i32 %55 to i64
  %57 = sext i32 %55 to i64
  %58 = icmp sgt i32 %55, 0
  br i1 %58, label %.preheader14.preheader, label %.preheader13

.preheader14.preheader:                           ; preds = %52
  %59 = add nsw i64 %56, -4
  %60 = lshr i64 %59, 2
  %61 = add nuw nsw i64 %60, 1
  %62 = icmp sgt i32 %55, 0
  %min.iters.check102 = icmp ult i32 %55, 4
  %63 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %n.vec105 = and i64 %56, -4
  %cmp.zero106 = icmp eq i64 %n.vec105, 0
  %xtraiter184 = and i64 %61, 3
  %lcmp.mod185 = icmp eq i64 %xtraiter184, 0
  %64 = icmp ult i64 %59, 12
  %cmp.n111 = icmp eq i64 %56, %n.vec105
  %65 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %66 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %67 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %68 = bitcast i8* %53 to [2000 x [2000 x double]]*
  %69 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br label %.preheader14

.preheader14:                                     ; preds = %.preheader14.preheader, %102
  %indvars.iv4685 = phi i64 [ %indvars.iv.next47, %102 ], [ 0, %.preheader14.preheader ]
  br i1 %62, label %.lr.ph82, label %102

.lr.ph82:                                         ; preds = %.preheader14
  br i1 %min.iters.check102, label %scalar.ph101.preheader, label %min.iters.checked103

scalar.ph101.preheader:                           ; preds = %middle.block100, %min.iters.checked103, %.lr.ph82
  %indvars.iv4481.ph = phi i64 [ 0, %min.iters.checked103 ], [ 0, %.lr.ph82 ], [ %n.vec105, %middle.block100 ]
  br label %scalar.ph101

min.iters.checked103:                             ; preds = %.lr.ph82
  br i1 %cmp.zero106, label %scalar.ph101.preheader, label %vector.body99.preheader

vector.body99.preheader:                          ; preds = %min.iters.checked103
  br i1 %lcmp.mod185, label %vector.body99.prol.loopexit, label %vector.body99.prol.preheader

vector.body99.prol.preheader:                     ; preds = %vector.body99.preheader
  br label %vector.body99.prol

vector.body99.prol:                               ; preds = %vector.body99.prol, %vector.body99.prol.preheader
  %index108.prol = phi i64 [ %index.next109.prol, %vector.body99.prol ], [ 0, %vector.body99.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body99.prol ], [ %xtraiter184, %vector.body99.prol.preheader ]
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv4685, i64 %index108.prol
  %71 = bitcast double* %70 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %71, align 8
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %73, align 8
  %index.next109.prol = add i64 %index108.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body99.prol.loopexit.unr-lcssa, label %vector.body99.prol, !llvm.loop !8

vector.body99.prol.loopexit.unr-lcssa:            ; preds = %vector.body99.prol
  br label %vector.body99.prol.loopexit

vector.body99.prol.loopexit:                      ; preds = %vector.body99.preheader, %vector.body99.prol.loopexit.unr-lcssa
  %index108.unr = phi i64 [ 0, %vector.body99.preheader ], [ %index.next109.prol, %vector.body99.prol.loopexit.unr-lcssa ]
  br i1 %64, label %middle.block100, label %vector.body99.preheader.new

vector.body99.preheader.new:                      ; preds = %vector.body99.prol.loopexit
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99, %vector.body99.preheader.new
  %index108 = phi i64 [ %index108.unr, %vector.body99.preheader.new ], [ %index.next109.3, %vector.body99 ]
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv4685, i64 %index108
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %75, align 8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %77, align 8
  %index.next109 = add i64 %index108, 4
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv4685, i64 %index.next109
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %79, align 8
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %81, align 8
  %index.next109.1 = add i64 %index108, 8
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv4685, i64 %index.next109.1
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %83, align 8
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %85, align 8
  %index.next109.2 = add i64 %index108, 12
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv4685, i64 %index.next109.2
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %87, align 8
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %89, align 8
  %index.next109.3 = add i64 %index108, 16
  %90 = icmp eq i64 %index.next109.3, %n.vec105
  br i1 %90, label %middle.block100.unr-lcssa, label %vector.body99, !llvm.loop !9

middle.block100.unr-lcssa:                        ; preds = %vector.body99
  br label %middle.block100

middle.block100:                                  ; preds = %vector.body99.prol.loopexit, %middle.block100.unr-lcssa
  br i1 %cmp.n111, label %._crit_edge83, label %scalar.ph101.preheader

.preheader13.loopexit:                            ; preds = %102
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.loopexit, %52
  %storemerge7.lcssa29.lcssa = phi i32 [ %.promoted28, %52 ], [ %indvars.iv44.lcssa, %.preheader13.loopexit ]
  store i32 %storemerge7.lcssa29.lcssa, i32* %4, align 4
  %91 = load i32, i32* %2, align 4
  %92 = load [2000 x double]*, [2000 x double]** %3, align 8
  %93 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %5, align 8
  %94 = sext i32 %91 to i64
  %95 = sext i32 %91 to i64
  %96 = sext i32 %91 to i64
  %97 = icmp sgt i32 %91, 0
  br i1 %97, label %.preheader12.preheader, label %.preheader10

.preheader12.preheader:                           ; preds = %.preheader13
  %98 = icmp sgt i32 %91, 0
  %99 = icmp sgt i32 %91, 0
  %min.iters.check119 = icmp ult i32 %91, 4
  %n.vec122 = and i64 %94, -4
  %cmp.zero123 = icmp eq i64 %n.vec122, 0
  %cmp.n140 = icmp eq i64 %94, %n.vec122
  br label %.preheader12

scalar.ph101:                                     ; preds = %scalar.ph101.preheader, %scalar.ph101
  %indvars.iv4481 = phi i64 [ %indvars.iv.next45, %scalar.ph101 ], [ %indvars.iv4481.ph, %scalar.ph101.preheader ]
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv4685, i64 %indvars.iv4481
  store double 0.000000e+00, double* %100, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv4481, 1
  %101 = icmp slt i64 %indvars.iv.next45, %56
  br i1 %101, label %scalar.ph101, label %._crit_edge83.loopexit, !llvm.loop !10

._crit_edge83.loopexit:                           ; preds = %scalar.ph101
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %._crit_edge83.loopexit, %middle.block100
  %indvars.iv.next45.lcssa = phi i64 [ %n.vec105, %middle.block100 ], [ %indvars.iv.next45, %._crit_edge83.loopexit ]
  %phitmp = trunc i64 %indvars.iv.next45.lcssa to i32
  br label %102

; <label>:102:                                    ; preds = %._crit_edge83, %.preheader14
  %indvars.iv44.lcssa = phi i32 [ %phitmp, %._crit_edge83 ], [ 0, %.preheader14 ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4685, 1
  %103 = icmp slt i64 %indvars.iv.next47, %57
  br i1 %103, label %.preheader14, label %.preheader13.loopexit

.preheader12:                                     ; preds = %.preheader12.preheader, %158
  %storemerge6.lcssa20.lcssa2379 = phi i32 [ %storemerge6.lcssa20.lcssa, %158 ], [ %storemerge7.lcssa29.lcssa, %.preheader12.preheader ]
  %indvars.iv4277 = phi i64 [ %indvars.iv.next43, %158 ], [ 0, %.preheader12.preheader ]
  %scevgep128 = getelementptr [2000 x double], [2000 x double]* %92, i64 0, i64 %indvars.iv4277
  %104 = add i64 %indvars.iv4277, -1999
  %scevgep130 = getelementptr [2000 x double], [2000 x double]* %92, i64 %94, i64 %104
  br i1 %98, label %.preheader11.preheader, label %158

.preheader11.preheader:                           ; preds = %.preheader12
  br label %.preheader11

.preheader10.loopexit:                            ; preds = %158
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader13
  %storemerge6.lcssa20.lcssa23.lcssa = phi i32 [ %storemerge7.lcssa29.lcssa, %.preheader13 ], [ %storemerge6.lcssa20.lcssa, %.preheader10.loopexit ]
  store i32 %storemerge6.lcssa20.lcssa23.lcssa, i32* %4, align 4
  %105 = load i32, i32* %2, align 4
  %106 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %5, align 8
  %107 = load [2000 x double]*, [2000 x double]** %3, align 8
  %108 = sext i32 %105 to i64
  %109 = sext i32 %105 to i64
  %110 = icmp sgt i32 %105, 0
  br i1 %110, label %.preheader.preheader, label %.loopexit179

.preheader.preheader:                             ; preds = %.preheader10
  %111 = add nsw i64 %108, -4
  %112 = lshr i64 %111, 2
  %113 = icmp sgt i32 %105, 0
  %min.iters.check149 = icmp ult i32 %105, 4
  %n.vec152 = and i64 %108, -4
  %cmp.zero153 = icmp eq i64 %n.vec152, 0
  %114 = and i64 %112, 1
  %lcmp.mod = icmp eq i64 %114, 0
  %115 = icmp eq i64 %112, 0
  %cmp.n172 = icmp eq i64 %108, %n.vec152
  br label %.preheader

.preheader11:                                     ; preds = %.preheader11.preheader, %.loopexit180
  %indvars.iv4073 = phi i64 [ %indvars.iv.next41, %.loopexit180 ], [ 0, %.preheader11.preheader ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv4073, i64 0
  %scevgep126 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv4073, i64 %94
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %indvars.iv4073, i64 %indvars.iv4277
  br i1 %99, label %.lr.ph71, label %.loopexit180

.lr.ph71:                                         ; preds = %.preheader11
  br i1 %min.iters.check119, label %scalar.ph118.preheader, label %min.iters.checked120

min.iters.checked120:                             ; preds = %.lr.ph71
  br i1 %cmp.zero123, label %scalar.ph118.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked120
  %bound0 = icmp ult double* %scevgep, %scevgep130
  %bound1 = icmp ult double* %scevgep128, %scevgep126
  %found.conflict = and i1 %bound0, %bound1
  %bound0133 = icmp ult double* %scevgep, %116
  %bound1134 = icmp ult double* %116, %scevgep126
  %found.conflict135 = and i1 %bound0133, %bound1134
  %conflict.rdx = or i1 %found.conflict, %found.conflict135
  br i1 %conflict.rdx, label %scalar.ph118.preheader, label %vector.body116.preheader

vector.body116.preheader:                         ; preds = %vector.memcheck
  br label %vector.body116

vector.body116:                                   ; preds = %vector.body116.preheader, %vector.body116
  %index137 = phi i64 [ %index.next138, %vector.body116 ], [ 0, %vector.body116.preheader ]
  %117 = or i64 %index137, 1
  %118 = or i64 %index137, 2
  %119 = or i64 %index137, 3
  %120 = load double, double* %116, align 8, !alias.scope !11
  %121 = insertelement <2 x double> undef, double %120, i32 0
  %122 = shufflevector <2 x double> %121, <2 x double> undef, <2 x i32> zeroinitializer
  %123 = insertelement <2 x double> undef, double %120, i32 0
  %124 = shufflevector <2 x double> %123, <2 x double> undef, <2 x i32> zeroinitializer
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %index137, i64 %indvars.iv4277
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %117, i64 %indvars.iv4277
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %118, i64 %indvars.iv4277
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %119, i64 %indvars.iv4277
  %129 = load double, double* %125, align 8, !alias.scope !14
  %130 = load double, double* %126, align 8, !alias.scope !14
  %131 = load double, double* %127, align 8, !alias.scope !14
  %132 = load double, double* %128, align 8, !alias.scope !14
  %133 = insertelement <2 x double> undef, double %129, i32 0
  %134 = insertelement <2 x double> %133, double %130, i32 1
  %135 = insertelement <2 x double> undef, double %131, i32 0
  %136 = insertelement <2 x double> %135, double %132, i32 1
  %137 = fmul <2 x double> %122, %134
  %138 = fmul <2 x double> %124, %136
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv4073, i64 %index137
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !16, !noalias !18
  %141 = getelementptr double, double* %139, i64 2
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !16, !noalias !18
  %143 = fadd <2 x double> %wide.load, %137
  %144 = fadd <2 x double> %wide.load145, %138
  %145 = bitcast double* %139 to <2 x double>*
  store <2 x double> %143, <2 x double>* %145, align 8, !alias.scope !16, !noalias !18
  %146 = bitcast double* %141 to <2 x double>*
  store <2 x double> %144, <2 x double>* %146, align 8, !alias.scope !16, !noalias !18
  %index.next138 = add i64 %index137, 4
  %147 = icmp eq i64 %index.next138, %n.vec122
  br i1 %147, label %middle.block117, label %vector.body116, !llvm.loop !19

middle.block117:                                  ; preds = %vector.body116
  br i1 %cmp.n140, label %.loopexit180, label %scalar.ph118.preheader

scalar.ph118.preheader:                           ; preds = %middle.block117, %vector.memcheck, %min.iters.checked120, %.lr.ph71
  %indvars.iv3870.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked120 ], [ 0, %.lr.ph71 ], [ %n.vec122, %middle.block117 ]
  br label %scalar.ph118

scalar.ph118:                                     ; preds = %scalar.ph118.preheader, %scalar.ph118
  %indvars.iv3870 = phi i64 [ %indvars.iv.next39, %scalar.ph118 ], [ %indvars.iv3870.ph, %scalar.ph118.preheader ]
  %148 = load double, double* %116, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %92, i64 %indvars.iv3870, i64 %indvars.iv4277
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv4073, i64 %indvars.iv3870
  %153 = load double, double* %152, align 8
  %154 = fadd double %153, %151
  store double %154, double* %152, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3870, 1
  %155 = icmp slt i64 %indvars.iv.next39, %94
  br i1 %155, label %scalar.ph118, label %.loopexit180.loopexit, !llvm.loop !20

.loopexit180.loopexit:                            ; preds = %scalar.ph118
  br label %.loopexit180

.loopexit180:                                     ; preds = %.loopexit180.loopexit, %middle.block117, %.preheader11
  %indvars.iv38.lcssa = phi i64 [ 0, %.preheader11 ], [ %n.vec122, %middle.block117 ], [ %indvars.iv.next39, %.loopexit180.loopexit ]
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv4073, 1
  %156 = icmp slt i64 %indvars.iv.next41, %95
  br i1 %156, label %.preheader11, label %._crit_edge75

._crit_edge75:                                    ; preds = %.loopexit180
  %157 = trunc i64 %indvars.iv38.lcssa to i32
  br label %158

; <label>:158:                                    ; preds = %._crit_edge75, %.preheader12
  %storemerge6.lcssa20.lcssa = phi i32 [ %157, %._crit_edge75 ], [ %storemerge6.lcssa20.lcssa2379, %.preheader12 ]
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4277, 1
  %159 = icmp slt i64 %indvars.iv.next43, %96
  br i1 %159, label %.preheader12, label %.preheader10.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv3667 = phi i64 [ %indvars.iv.next37, %.loopexit ], [ 0, %.preheader.preheader ]
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 0
  %scevgep157 = getelementptr [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 %108
  %scevgep159 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 0
  %scevgep161 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 %108
  br i1 %113, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  br i1 %min.iters.check149, label %scalar.ph148.preheader, label %min.iters.checked150

min.iters.checked150:                             ; preds = %.lr.ph
  br i1 %cmp.zero153, label %scalar.ph148.preheader, label %vector.memcheck167

vector.memcheck167:                               ; preds = %min.iters.checked150
  %bound0163 = icmp ult double* %scevgep155, %scevgep161
  %bound1164 = icmp ult double* %scevgep159, %scevgep157
  %memcheck.conflict166 = and i1 %bound0163, %bound1164
  br i1 %memcheck.conflict166, label %scalar.ph148.preheader, label %vector.body146.preheader

vector.body146.preheader:                         ; preds = %vector.memcheck167
  br i1 %lcmp.mod, label %vector.body146.prol.preheader, label %vector.body146.prol.loopexit.unr-lcssa

vector.body146.prol.preheader:                    ; preds = %vector.body146.preheader
  br label %vector.body146.prol

vector.body146.prol:                              ; preds = %vector.body146.prol.preheader
  %160 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 0
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load177.prol = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !21
  %162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 2
  %163 = bitcast double* %162 to <2 x i64>*
  %wide.load178.prol = load <2 x i64>, <2 x i64>* %163, align 8, !alias.scope !21
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 0
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load177.prol, <2 x i64>* %165, align 8, !alias.scope !24, !noalias !21
  %166 = getelementptr [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 2
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %wide.load178.prol, <2 x i64>* %167, align 8, !alias.scope !24, !noalias !21
  br label %vector.body146.prol.loopexit.unr-lcssa

vector.body146.prol.loopexit.unr-lcssa:           ; preds = %vector.body146.preheader, %vector.body146.prol
  %index169.unr.ph = phi i64 [ 4, %vector.body146.prol ], [ 0, %vector.body146.preheader ]
  br label %vector.body146.prol.loopexit

vector.body146.prol.loopexit:                     ; preds = %vector.body146.prol.loopexit.unr-lcssa
  br i1 %115, label %middle.block147, label %vector.body146.preheader.new

vector.body146.preheader.new:                     ; preds = %vector.body146.prol.loopexit
  br label %vector.body146

vector.body146:                                   ; preds = %vector.body146, %vector.body146.preheader.new
  %index169 = phi i64 [ %index169.unr.ph, %vector.body146.preheader.new ], [ %index.next170.1, %vector.body146 ]
  %168 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 %index169
  %169 = bitcast double* %168 to <2 x i64>*
  %wide.load177 = load <2 x i64>, <2 x i64>* %169, align 8, !alias.scope !21
  %170 = getelementptr double, double* %168, i64 2
  %171 = bitcast double* %170 to <2 x i64>*
  %wide.load178 = load <2 x i64>, <2 x i64>* %171, align 8, !alias.scope !21
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 %index169
  %173 = bitcast double* %172 to <2 x i64>*
  store <2 x i64> %wide.load177, <2 x i64>* %173, align 8, !alias.scope !24, !noalias !21
  %174 = getelementptr double, double* %172, i64 2
  %175 = bitcast double* %174 to <2 x i64>*
  store <2 x i64> %wide.load178, <2 x i64>* %175, align 8, !alias.scope !24, !noalias !21
  %index.next170 = add i64 %index169, 4
  %176 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 %index.next170
  %177 = bitcast double* %176 to <2 x i64>*
  %wide.load177.1 = load <2 x i64>, <2 x i64>* %177, align 8, !alias.scope !21
  %178 = getelementptr double, double* %176, i64 2
  %179 = bitcast double* %178 to <2 x i64>*
  %wide.load178.1 = load <2 x i64>, <2 x i64>* %179, align 8, !alias.scope !21
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 %index.next170
  %181 = bitcast double* %180 to <2 x i64>*
  store <2 x i64> %wide.load177.1, <2 x i64>* %181, align 8, !alias.scope !24, !noalias !21
  %182 = getelementptr double, double* %180, i64 2
  %183 = bitcast double* %182 to <2 x i64>*
  store <2 x i64> %wide.load178.1, <2 x i64>* %183, align 8, !alias.scope !24, !noalias !21
  %index.next170.1 = add i64 %index169, 8
  %184 = icmp eq i64 %index.next170.1, %n.vec152
  br i1 %184, label %middle.block147.unr-lcssa, label %vector.body146, !llvm.loop !26

middle.block147.unr-lcssa:                        ; preds = %vector.body146
  br label %middle.block147

middle.block147:                                  ; preds = %vector.body146.prol.loopexit, %middle.block147.unr-lcssa
  br i1 %cmp.n172, label %.loopexit, label %scalar.ph148.preheader

scalar.ph148.preheader:                           ; preds = %middle.block147, %vector.memcheck167, %min.iters.checked150, %.lr.ph
  %indvars.iv66.ph = phi i64 [ 0, %vector.memcheck167 ], [ 0, %min.iters.checked150 ], [ 0, %.lr.ph ], [ %n.vec152, %middle.block147 ]
  br label %scalar.ph148

scalar.ph148:                                     ; preds = %scalar.ph148.preheader, %scalar.ph148
  %indvars.iv66 = phi i64 [ %indvars.iv.next, %scalar.ph148 ], [ %indvars.iv66.ph, %scalar.ph148.preheader ]
  %185 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv3667, i64 %indvars.iv66
  %186 = bitcast double* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %107, i64 %indvars.iv3667, i64 %indvars.iv66
  %189 = bitcast double* %188 to i64*
  store i64 %187, i64* %189, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv66, 1
  %190 = icmp slt i64 %indvars.iv.next, %108
  br i1 %190, label %scalar.ph148, label %.loopexit.loopexit, !llvm.loop !27

.loopexit.loopexit:                               ; preds = %scalar.ph148
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block147, %.preheader
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3667, 1
  %191 = icmp slt i64 %indvars.iv.next37, %109
  br i1 %191, label %.preheader, label %.loopexit179.loopexit

.loopexit179.loopexit:                            ; preds = %.loopexit
  br label %.loopexit179

.loopexit179:                                     ; preds = %.loopexit179.loopexit, %.preheader10
  %192 = bitcast [2000 x [2000 x double]]** %5 to i8**
  %193 = load i8*, i8** %192, align 8
  call void @free(i8* %193) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_lu(i32, [2000 x double]* nocapture) #2 {
  %3 = sext i32 %0 to i64
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader6.preheader, label %.loopexit60

.preheader6.preheader:                            ; preds = %2
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %.loopexit58
  %indvars.iv3853 = phi i64 [ %indvars.iv.next39, %.loopexit58 ], [ 0, %.preheader6.preheader ]
  %exitcond2442 = icmp eq i64 %indvars.iv3853, 0
  br i1 %exitcond2442, label %.loopexit59, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader6
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 0
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %.loopexit57
  %indvars.iv1943 = phi i64 [ %indvars.iv.next20, %.loopexit57 ], [ 0, %.preheader5.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv1943
  %exitcond40 = icmp eq i64 %indvars.iv1943, 0
  br i1 %exitcond40, label %.loopexit57, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5
  %xtraiter = and i64 %indvars.iv1943, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %8 = load double, double* %6, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv1943
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = load double, double* %7, align 8
  %13 = fsub double %12, %11
  store double %13, double* %7, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %14 = icmp eq i64 %indvars.iv1943, 1
  br i1 %14, label %.loopexit57.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv41
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv1943
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = load double, double* %7, align 8
  %21 = fsub double %20, %19
  store double %21, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv41, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv1943
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %7, align 8
  %28 = fsub double %27, %26
  store double %28, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv41, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1943
  br i1 %exitcond.1, label %.loopexit57.loopexit.unr-lcssa, label %.lr.ph

.loopexit57.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %.loopexit57.loopexit

.loopexit57.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %.loopexit57.loopexit.unr-lcssa
  br label %.loopexit57

.loopexit57:                                      ; preds = %.loopexit57.loopexit, %.preheader5
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1943, i64 %indvars.iv1943
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv1943
  %32 = load double, double* %31, align 8
  %33 = fdiv double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1943, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %indvars.iv3853
  br i1 %exitcond24, label %.loopexit59.loopexit, label %.preheader5

.loopexit59.loopexit:                             ; preds = %.loopexit57
  br label %.loopexit59

.loopexit59:                                      ; preds = %.loopexit59.loopexit, %.preheader6
  %34 = icmp slt i64 %indvars.iv3853, %3
  br i1 %34, label %.preheader.preheader, label %.loopexit58

.preheader.preheader:                             ; preds = %.loopexit59
  %exitcond2945 = icmp eq i64 %indvars.iv3853, 0
  %xtraiter61 = and i64 %indvars.iv3853, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter61, 0
  %35 = icmp eq i64 %indvars.iv3853, 1
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv3249 = phi i64 [ %indvars.iv.next33, %.loopexit ], [ %indvars.iv3853, %.preheader.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv3249
  br i1 %exitcond2945, label %.loopexit, label %.lr.ph47.preheader

.lr.ph47.preheader:                               ; preds = %.preheader
  br i1 %lcmp.mod62, label %.lr.ph47.prol.loopexit.unr-lcssa, label %.lr.ph47.prol.preheader

.lr.ph47.prol.preheader:                          ; preds = %.lr.ph47.preheader
  br label %.lr.ph47.prol

.lr.ph47.prol:                                    ; preds = %.lr.ph47.prol.preheader
  %38 = load double, double* %36, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv3249
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = load double, double* %37, align 8
  %43 = fsub double %42, %41
  store double %43, double* %37, align 8
  br label %.lr.ph47.prol.loopexit.unr-lcssa

.lr.ph47.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph47.preheader, %.lr.ph47.prol
  %indvars.iv2546.unr.ph = phi i64 [ 1, %.lr.ph47.prol ], [ 0, %.lr.ph47.preheader ]
  br label %.lr.ph47.prol.loopexit

.lr.ph47.prol.loopexit:                           ; preds = %.lr.ph47.prol.loopexit.unr-lcssa
  br i1 %35, label %.loopexit.loopexit, label %.lr.ph47.preheader.new

.lr.ph47.preheader.new:                           ; preds = %.lr.ph47.prol.loopexit
  br label %.lr.ph47

.lr.ph47:                                         ; preds = %.lr.ph47, %.lr.ph47.preheader.new
  %indvars.iv2546 = phi i64 [ %indvars.iv2546.unr.ph, %.lr.ph47.preheader.new ], [ %indvars.iv.next26.1, %.lr.ph47 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv2546
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2546, i64 %indvars.iv3249
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %37, align 8
  %50 = fsub double %49, %48
  store double %50, double* %37, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2546, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3853, i64 %indvars.iv.next26
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv3249
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %37, align 8
  %57 = fsub double %56, %55
  store double %57, double* %37, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv2546, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv3853
  br i1 %exitcond29.1, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph47

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph47
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph47.prol.loopexit, %.loopexit.loopexit.unr-lcssa
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3249, 1
  %58 = icmp slt i64 %indvars.iv.next33, %3
  br i1 %58, label %.preheader, label %.loopexit58.loopexit

.loopexit58.loopexit:                             ; preds = %.loopexit
  br label %.loopexit58

.loopexit58:                                      ; preds = %.loopexit58.loopexit, %.loopexit59
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv3853, 1
  %59 = icmp slt i64 %indvars.iv.next39, %4
  br i1 %59, label %.preheader6, label %.loopexit60.loopexit

.loopexit60.loopexit:                             ; preds = %.loopexit58
  br label %.loopexit60

.loopexit60:                                      ; preds = %.loopexit60.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = sext i32 %0 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader.preheader, label %.loopexit10

.preheader.preheader:                             ; preds = %2
  %11 = icmp sgt i32 %0, 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv47 = phi i64 [ %indvars.iv.next5, %.loopexit ], [ 0, %.preheader.preheader ]
  %12 = mul nsw i64 %indvars.iv47, %9
  br i1 %11, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %19
  %indvars.iv6 = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.lr.ph.preheader ]
  %13 = add nsw i64 %12, %indvars.iv6
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %.lr.ph
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %.lr.ph, %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv6
  %22 = load double, double* %21, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %24 = icmp slt i64 %indvars.iv.next, %7
  br i1 %24, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %19
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv47, 1
  %25 = icmp slt i64 %indvars.iv.next5, %8
  br i1 %25, label %.preheader, label %.loopexit10.loopexit

.loopexit10.loopexit:                             ; preds = %.loopexit
  br label %.loopexit10

.loopexit10:                                      ; preds = %.loopexit10.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !4, !5}
!10 = distinct !{!10, !7, !4, !5}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = !{!17}
!17 = distinct !{!17, !13}
!18 = !{!15, !12}
!19 = distinct !{!19, !4, !5}
!20 = distinct !{!20, !4, !5}
!21 = !{!22}
!22 = distinct !{!22, !23}
!23 = distinct !{!23, !"LVerDomain"}
!24 = !{!25}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !4, !5}
