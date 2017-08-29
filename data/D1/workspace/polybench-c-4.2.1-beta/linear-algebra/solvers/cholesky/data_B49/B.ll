; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader14.lr.ph:
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40..lr.ph36_crit_edge, %.preheader14.lr.ph
  %indvars.iv89 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next90, %._crit_edge40..lr.ph36_crit_edge ]
  %indvars.iv87 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next88, %._crit_edge40..lr.ph36_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv89, 2001
  %3 = add nuw nsw i64 %2, 1
  %4 = sub i64 1998, %indvars.iv89
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %7 = add nuw nsw i64 %6, 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %8 = icmp slt i64 %indvars.iv.next90, 2000
  br i1 %8, label %._crit_edge40.thread, label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv71 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next72, %._crit_edge ]
  %9 = sub nsw i64 0, %indvars.iv71
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv71
  store double %14, double* %15, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next72, %indvars.iv87
  br i1 %exitcond78, label %.preheader13, label %._crit_edge

._crit_edge40.thread:                             ; preds = %.preheader13
  %16 = bitcast double* %scevgep83 to i8*
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %7, i32 8, i1 false)
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %17, align 8
  br label %._crit_edge40..lr.ph36_crit_edge

._crit_edge40:                                    ; preds = %.preheader13
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %18, align 8
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond92, label %.preheader12.us.preheader, label %._crit_edge40..lr.ph36_crit_edge

._crit_edge40..lr.ph36_crit_edge:                 ; preds = %._crit_edge40.thread, %._crit_edge40
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br label %.lr.ph36

.preheader12.us.preheader:                        ; preds = %._crit_edge40
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us, %.preheader12.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next68.7, %._crit_edge33.us ]
  %20 = mul nuw nsw i64 %indvars.iv67, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68 = or i64 %indvars.iv67, 1
  %21 = mul nuw nsw i64 %indvars.iv.next68, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.1 = or i64 %indvars.iv67, 2
  %22 = mul nuw nsw i64 %indvars.iv.next68.1, 16000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.2 = or i64 %indvars.iv67, 3
  %23 = mul nuw nsw i64 %indvars.iv.next68.2, 16000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.3 = or i64 %indvars.iv67, 4
  %24 = mul nuw nsw i64 %indvars.iv.next68.3, 16000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.4 = or i64 %indvars.iv67, 5
  %25 = mul nuw nsw i64 %indvars.iv.next68.4, 16000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.5 = or i64 %indvars.iv67, 6
  %26 = mul nuw nsw i64 %indvars.iv.next68.5, 16000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.6 = or i64 %indvars.iv67, 7
  %27 = mul nuw nsw i64 %indvars.iv.next68.6, 16000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.7 = add nuw nsw i64 %indvars.iv67, 8
  %exitcond70.7 = icmp eq i64 %indvars.iv.next68.7, 2000
  br i1 %exitcond70.7, label %.preheader9.us.us.preheader.preheader, label %._crit_edge33.us

.preheader9.us.us.preheader.preheader:            ; preds = %._crit_edge33.us
  %28 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %.preheader9.us.us.preheader.preheader, %._crit_edge22.us
  %indvars.iv59 = phi i64 [ %29, %._crit_edge22.us ], [ 0, %.preheader9.us.us.preheader.preheader ]
  %scevgep98 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv59
  %29 = add nuw nsw i64 %indvars.iv59, 1
  %scevgep100 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %29
  %30 = bitcast double* %scevgep100 to i8*
  %31 = bitcast double* %scevgep98 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %exitcond62 = icmp eq i64 %29, 2000
  br i1 %exitcond62, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next56, %._crit_edge20.us.us ]
  %32 = mul nuw nsw i64 %indvars.iv55, 16000
  %scevgep96 = getelementptr i8, i8* %19, i64 %32
  %33 = add nuw nsw i64 %32, 16000
  %scevgep97 = getelementptr i8, i8* %19, i64 %33
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv59
  %bound0 = icmp ult i8* %scevgep96, %30
  %bound1 = icmp ult i8* %31, %scevgep97
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %34 to i8*
  %bound0103 = icmp ult i8* %scevgep96, %bc
  %bound1104 = icmp ult i8* %bc, %scevgep97
  %found.conflict105 = and i1 %bound0103, %bound1104
  %conflict.rdx = or i1 %found.conflict, %found.conflict105
  br i1 %conflict.rdx, label %._crit_edge93.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9.us.us
  br label %vector.body

._crit_edge93.preheader:                          ; preds = %.preheader9.us.us
  br label %._crit_edge93

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %35 = or i64 %index, 1
  %36 = or i64 %index, 2
  %37 = or i64 %index, 3
  %38 = load double, double* %34, align 8, !alias.scope !1
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv59
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %35, i64 %indvars.iv59
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %36, i64 %indvars.iv59
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %37, i64 %indvars.iv59
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = load double, double* %43, align 8, !alias.scope !4
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %48, i32 1
  %53 = fmul <2 x double> %40, %50
  %54 = fmul <2 x double> %40, %52
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv55, i64 %index
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %59 = fadd <2 x double> %wide.load, %53
  %60 = fadd <2 x double> %wide.load107, %54
  store <2 x double> %59, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %60, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %._crit_edge20.us.us.loopexit136, label %vector.body, !llvm.loop !9

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge93
  br label %._crit_edge20.us.us

._crit_edge20.us.us.loopexit136:                  ; preds = %vector.body
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit136, %._crit_edge20.us.us.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond58, label %._crit_edge22.us, label %.preheader9.us.us

._crit_edge93:                                    ; preds = %._crit_edge93, %._crit_edge93.preheader
  %indvars.iv51 = phi i64 [ 0, %._crit_edge93.preheader ], [ %indvars.iv.next52.1, %._crit_edge93 ]
  %62 = load double, double* %34, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv59
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv55, i64 %indvars.iv51
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %69 = load double, double* %34, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next52, i64 %indvars.iv59
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next52
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 2000
  br i1 %exitcond54.1, label %._crit_edge20.us.us.loopexit, label %._crit_edge93, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv47 = phi i64 [ %76, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep113 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  %scevgep113114 = bitcast double* %scevgep113 to i8*
  %76 = add nuw nsw i64 %indvars.iv47, 1
  %scevgep115 = getelementptr [2000 x double], [2000 x double]* %1, i64 %76, i64 0
  %scevgep115116 = bitcast double* %scevgep115 to i8*
  %77 = mul nuw nsw i64 %indvars.iv47, 16000
  %scevgep117 = getelementptr i8, i8* %19, i64 %77
  %78 = add nuw nsw i64 %77, 16000
  %scevgep118 = getelementptr i8, i8* %19, i64 %78
  %bound0119 = icmp ult i8* %scevgep113114, %scevgep118
  %bound1120 = icmp ult i8* %scevgep117, %scevgep115116
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  br i1 %memcheck.conflict122, label %._crit_edge94.preheader, label %vector.body108.preheader

vector.body108.preheader:                         ; preds = %.preheader.us
  br label %vector.body108

._crit_edge94.preheader:                          ; preds = %.preheader.us
  br label %._crit_edge94

vector.body108:                                   ; preds = %vector.body108, %vector.body108.preheader
  %index125 = phi i64 [ 0, %vector.body108.preheader ], [ %index.next126.1, %vector.body108 ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %index125
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load133 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load134 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %index125
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load133, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load134, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %index.next126 = or i64 %index125, 4
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %index.next126
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load133.1 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load134.1 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %index.next126
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load133.1, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load134.1, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %index.next126.1 = add nuw nsw i64 %index125, 8
  %95 = icmp eq i64 %index.next126.1, 2000
  br i1 %95, label %._crit_edge.us.loopexit135, label %vector.body108, !llvm.loop !18

._crit_edge94:                                    ; preds = %._crit_edge94, %._crit_edge94.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge94.preheader ], [ %indvars.iv.next.4, %._crit_edge94 ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %indvars.iv
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next.3
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond46.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond46.4, label %._crit_edge.us.loopexit, label %._crit_edge94, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %._crit_edge94
  br label %._crit_edge.us

._crit_edge.us.loopexit135:                       ; preds = %vector.body108
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit135, %._crit_edge.us.loopexit
  %exitcond50 = icmp eq i64 %76, 2000
  br i1 %exitcond50, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %19) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv47 = phi i2 [ %indvars.iv.next48, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %indvars.iv34 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next35, %._crit_edge9 ]
  %2 = zext i2 %indvars.iv47 to i64
  %3 = add nsw i64 %indvars.iv34, -1
  %4 = icmp sgt i64 %indvars.iv34, 0
  br i1 %4, label %.preheader.preheader, label %.preheader4.._crit_edge9_crit_edge

.preheader4.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre49 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre41 = load double, double* %6, align 8
  %xtraiter42 = and i64 %indvars.iv34, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %._crit_edge39.prol.loopexit, label %._crit_edge39.prol.preheader

._crit_edge39.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge39.prol

._crit_edge39.prol:                               ; preds = %._crit_edge39.prol, %._crit_edge39.prol.preheader
  %7 = phi double [ %.pre41, %._crit_edge39.prol.preheader ], [ %11, %._crit_edge39.prol ]
  %indvars.iv26.prol = phi i64 [ 0, %._crit_edge39.prol.preheader ], [ %indvars.iv.next27.prol, %._crit_edge39.prol ]
  %prol.iter = phi i64 [ %xtraiter42, %._crit_edge39.prol.preheader ], [ %prol.iter.sub, %._crit_edge39.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv26.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge39.prol.loopexit.unr-lcssa, label %._crit_edge39.prol, !llvm.loop !20

._crit_edge39.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge39.prol.loopexit.unr-lcssa
  %.unr44 = phi double [ %.pre41, %.lr.ph8 ], [ %11, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %indvars.iv26.unr = phi i64 [ 0, %.lr.ph8 ], [ %2, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %3, 3
  br i1 %12, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge39

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv18, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv18
  %.pre = load double, double* %14, align 8
  br i1 %13, label %._crit_edge38.preheader, label %._crit_edge

._crit_edge38.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge38.prol.loopexit.unr-lcssa, label %._crit_edge38.prol.preheader

._crit_edge38.prol.preheader:                     ; preds = %._crit_edge38.preheader
  %15 = load double, double* %5, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge38.preheader, %._crit_edge38.prol.preheader
  %.lcssa.unr.ph = phi double [ %19, %._crit_edge38.prol.preheader ], [ undef, %._crit_edge38.preheader ]
  %.unr.ph = phi double [ %19, %._crit_edge38.prol.preheader ], [ %.pre, %._crit_edge38.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge38.prol.preheader ], [ 0, %._crit_edge38.preheader ]
  %20 = icmp eq i64 %indvars.iv18, 1
  br i1 %20, label %._crit_edge.loopexit, label %._crit_edge38.preheader.new

._crit_edge38.preheader.new:                      ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38, %._crit_edge38.preheader.new
  %21 = phi double [ %.unr.ph, %._crit_edge38.preheader.new ], [ %33, %._crit_edge38 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge38.preheader.new ], [ %indvars.iv.next.1, %._crit_edge38 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond17.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge38

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge38
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge38.prol.loopexit.unr-lcssa, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge38.prol.loopexit.unr-lcssa ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv18
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, %indvars.iv34
  br i1 %exitcond25, label %.lr.ph8, label %.preheader

._crit_edge39:                                    ; preds = %._crit_edge39, %.lr.ph8.new
  %38 = phi double [ %.unr44, %.lr.ph8.new ], [ %54, %._crit_edge39 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %.lr.ph8.new ], [ %indvars.iv.next27.3, %._crit_edge39 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv26
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %6, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next27
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next27.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next27.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next27.3 = add nuw nsw i64 %indvars.iv26, 4
  %exitcond33.3 = icmp eq i64 %indvars.iv.next27.3, %indvars.iv34
  br i1 %exitcond33.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge39

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge39
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge39.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  %55 = phi double [ %.unr44, %._crit_edge39.prol.loopexit ], [ %54, %._crit_edge9.loopexit.unr-lcssa ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader4.._crit_edge9_crit_edge, %._crit_edge9.loopexit
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader4.._crit_edge9_crit_edge ], [ %6, %._crit_edge9.loopexit ]
  %56 = phi double [ %.pre49, %.preheader4.._crit_edge9_crit_edge ], [ %55, %._crit_edge9.loopexit ]
  %57 = tail call double @sqrt(double %56) #3
  store double %57, double* %.pre-phi, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 2000
  %indvars.iv.next48 = add i2 %indvars.iv47, 1
  br i1 %exitcond37, label %._crit_edge11, label %.preheader4

._crit_edge11:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge17 ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge17

; <label>:11:                                     ; preds = %._crit_edge18
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge18

._crit_edge:                                      ; preds = %._crit_edge17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond16, label %._crit_edge4, label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
