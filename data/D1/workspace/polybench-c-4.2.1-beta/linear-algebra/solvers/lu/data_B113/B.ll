; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader72.lr.ph:
  br label %.lr.ph87

.lr.ph87:                                         ; preds = %._crit_edge89.thread, %.preheader72.lr.ph
  %indvars.iv123 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next124, %._crit_edge89.thread ]
  %1 = sub i64 1998, %indvars.iv123
  %2 = shl i64 %1, 3
  br label %._crit_edge1

.preheader71:                                     ; preds = %._crit_edge1
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %3 = icmp slt i64 %indvars.iv.next124, 2000
  br i1 %3, label %._crit_edge89.thread, label %.preheader70.lr.ph

._crit_edge89.thread:                             ; preds = %.preheader71
  %4 = and i64 %2, 34359738360
  %5 = add nuw nsw i64 %4, 8
  %scevgep121 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv123, i64 %indvars.iv.next124
  %scevgep121122 = bitcast double* %scevgep121 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph87

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph87
  %indvars.iv111 = phi i64 [ 0, %.lr.ph87 ], [ %indvars.iv.next112, %._crit_edge1 ]
  %7 = sub nsw i64 0, %indvars.iv111
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv123, i64 %indvars.iv111
  store double %12, double* %13, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond115 = icmp eq i64 %indvars.iv111, %indvars.iv123
  br i1 %exitcond115, label %.preheader71, label %._crit_edge1

.preheader70.lr.ph:                               ; preds = %.preheader71
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84, %.preheader70.lr.ph
  %indvars.iv109 = phi i64 [ 0, %.preheader70.lr.ph ], [ %indvars.iv.next110.7, %._crit_edge84 ]
  %16 = mul nuw nsw i64 %indvars.iv109, 16000
  %scevgep = getelementptr i8, i8* %15, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %17 = mul nuw nsw i64 %indvars.iv.next110, 16000
  %scevgep.1 = getelementptr i8, i8* %15, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.1 = or i64 %indvars.iv109, 2
  %18 = mul nuw nsw i64 %indvars.iv.next110.1, 16000
  %scevgep.2 = getelementptr i8, i8* %15, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.2 = or i64 %indvars.iv109, 3
  %19 = mul nuw nsw i64 %indvars.iv.next110.2, 16000
  %scevgep.3 = getelementptr i8, i8* %15, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.3 = or i64 %indvars.iv109, 4
  %20 = mul nuw nsw i64 %indvars.iv.next110.3, 16000
  %scevgep.4 = getelementptr i8, i8* %15, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.4 = or i64 %indvars.iv109, 5
  %21 = mul nuw nsw i64 %indvars.iv.next110.4, 16000
  %scevgep.5 = getelementptr i8, i8* %15, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.5 = or i64 %indvars.iv109, 6
  %22 = mul nuw nsw i64 %indvars.iv.next110.5, 16000
  %scevgep.6 = getelementptr i8, i8* %15, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.6 = or i64 %indvars.iv109, 7
  %23 = mul nuw nsw i64 %indvars.iv.next110.6, 16000
  %scevgep.7 = getelementptr i8, i8* %15, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next110.7 = add nsw i64 %indvars.iv109, 8
  %exitcond4.7 = icmp eq i64 %indvars.iv.next110.6, 1999
  br i1 %exitcond4.7, label %.preheader68.preheader, label %._crit_edge84

.preheader68.preheader:                           ; preds = %._crit_edge84
  br label %.preheader68

.preheader68:                                     ; preds = %._crit_edge80, %.preheader68.preheader
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge80 ], [ 0, %.preheader68.preheader ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv104
  %24 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %24
  br label %.preheader67

.preheader67:                                     ; preds = %._crit_edge78, %.preheader68
  %indvars.iv102 = phi i64 [ 0, %.preheader68 ], [ %indvars.iv.next103, %._crit_edge78 ]
  %25 = bitcast double* %scevgep7 to i8*
  %26 = bitcast double* %scevgep9 to i8*
  %27 = mul nuw nsw i64 %indvars.iv102, 16000
  %scevgep5 = getelementptr i8, i8* %15, i64 %27
  %28 = add nuw nsw i64 %27, 16000
  %scevgep6 = getelementptr i8, i8* %15, i64 %28
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv104
  %bound0 = icmp ult i8* %scevgep5, %26
  %bound1 = icmp ult i8* %25, %scevgep6
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %29 to i8*
  %bc11 = bitcast double* %29 to i8*
  %bound012 = icmp ult i8* %scevgep5, %bc11
  %bound113 = icmp ult i8* %bc, %scevgep6
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %._crit_edge2.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67
  br label %vector.body

._crit_edge2.preheader:                           ; preds = %.preheader67
  br label %._crit_edge2

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %30 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %31 = or i64 %index, 1
  %32 = or i64 %index, 2
  %33 = or i64 %index, 3
  %34 = load double, double* %29, align 8, !alias.scope !1
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = insertelement <2 x double> undef, double %34, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv104
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %31, i64 %indvars.iv104
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %32, i64 %indvars.iv104
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %33, i64 %indvars.iv104
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fmul <2 x double> %36, %48
  %52 = fmul <2 x double> %38, %50
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv102, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = fadd <2 x double> %wide.load, %51
  %58 = fadd <2 x double> %wide.load16, %52
  %59 = bitcast double* %53 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = bitcast double* %55 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %._crit_edge78.loopexit52, label %vector.body, !llvm.loop !9

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge2.preheader
  %indvars.iv99 = phi i64 [ 0, %._crit_edge2.preheader ], [ %indvars.iv.next100.1, %._crit_edge2 ]
  %62 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %63 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %64 = load double, double* %29, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv104
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv102, i64 %indvars.iv99
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %71 = load double, double* %29, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next100, i64 %indvars.iv104
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next100
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next100, 1999
  br i1 %exitcond101.1, label %._crit_edge78.loopexit, label %._crit_edge2, !llvm.loop !12

._crit_edge78.loopexit:                           ; preds = %._crit_edge2
  br label %._crit_edge78

._crit_edge78.loopexit52:                         ; preds = %vector.body
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit52, %._crit_edge78.loopexit
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next103, 2000
  br i1 %exitcond47, label %._crit_edge80, label %.preheader67

._crit_edge80:                                    ; preds = %._crit_edge78
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond48, label %.preheader.preheader, label %.preheader68

.preheader.preheader:                             ; preds = %._crit_edge80
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %78 = add nuw nsw i64 %indvars.iv97, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %0, i64 %78, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %79 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep26 = getelementptr i8, i8* %15, i64 %79
  %80 = add nuw nsw i64 %79, 16000
  %scevgep27 = getelementptr i8, i8* %15, i64 %80
  %bound028 = icmp ult i8* %scevgep2223, %scevgep27
  %bound129 = icmp ult i8* %scevgep26, %scevgep2425
  %memcheck.conflict31 = and i1 %bound028, %bound129
  br i1 %memcheck.conflict31, label %._crit_edge3.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %.preheader
  br label %vector.body17

._crit_edge3.preheader:                           ; preds = %.preheader
  br label %._crit_edge3

vector.body17:                                    ; preds = %vector.body17, %vector.body17.preheader
  %index34 = phi i64 [ 0, %vector.body17.preheader ], [ %index.next35.1, %vector.body17 ]
  %81 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %82 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv97, i64 %index34
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load43 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !13
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %index34
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %88, align 8, !alias.scope !16, !noalias !13
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load43, <2 x i64>* %90, align 8, !alias.scope !16, !noalias !13
  %index.next35 = or i64 %index34, 4
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv97, i64 %index.next35
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load43.1 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !13
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %index.next35
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load42.1, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load43.1, <2 x i64>* %98, align 8, !alias.scope !16, !noalias !13
  %index.next35.1 = add nsw i64 %index34, 8
  %99 = icmp eq i64 %index.next35.1, 2000
  br i1 %99, label %._crit_edge.loopexit51, label %vector.body17, !llvm.loop !18

._crit_edge3:                                     ; preds = %._crit_edge3, %._crit_edge3.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge3.preheader ], [ %indvars.iv.next.4, %._crit_edge3 ]
  %100 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.3
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next.3
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.loopexit, label %._crit_edge3, !llvm.loop !19

._crit_edge.loopexit:                             ; preds = %._crit_edge3
  br label %._crit_edge

._crit_edge.loopexit51:                           ; preds = %vector.body17
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit51, %._crit_edge.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond46, label %._crit_edge75, label %.preheader

._crit_edge75:                                    ; preds = %._crit_edge
  tail call void @free(i8* nonnull %15) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.preheader:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge50, %.preheader43.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge50 ], [ 0, %.preheader43.preheader ]
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge50 ], [ 4294967295, %.preheader43.preheader ]
  %1 = and i64 %indvars.iv6, 4294967295
  %2 = icmp sgt i64 %indvars.iv8, 0
  br i1 %2, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 0
  br label %.preheader41

.preheader.us:                                    ; preds = %._crit_edge48.us, %.preheader.us.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge48.us ], [ %indvars.iv8, %.preheader.us.preheader ]
  %4 = icmp eq i64 %52, 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv72
  %.pre58 = load double, double* %5, align 8
  br i1 %4, label %._crit_edge1.prol, label %._crit_edge1.prol.loopexit

._crit_edge1.prol:                                ; preds = %.preheader.us
  %6 = load double, double* %53, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv72
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = fsub double %.pre58, %9
  store double %10, double* %5, align 8
  br label %._crit_edge1.prol.loopexit

._crit_edge1.prol.loopexit:                       ; preds = %._crit_edge1.prol, %.preheader.us
  %indvars.iv64.unr.ph = phi i64 [ 1, %._crit_edge1.prol ], [ 0, %.preheader.us ]
  %.unr15.ph = phi double [ %10, %._crit_edge1.prol ], [ %.pre58, %.preheader.us ]
  %11 = icmp eq i64 %1, 0
  br i1 %11, label %._crit_edge48.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %._crit_edge1.prol.loopexit
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader.us.new
  %indvars.iv64 = phi i64 [ %indvars.iv64.unr.ph, %.preheader.us.new ], [ %indvars.iv.next65.1, %._crit_edge1 ]
  %12 = phi double [ %.unr15.ph, %.preheader.us.new ], [ %24, %._crit_edge1 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv64
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv72
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %12, %17
  store double %18, double* %5, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv.next65
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %indvars.iv72
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %5, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next65, %1
  br i1 %exitcond.1, label %._crit_edge48.us.loopexit, label %._crit_edge1

._crit_edge48.us.loopexit:                        ; preds = %._crit_edge1
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %._crit_edge1.prol.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond11, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %._crit_edge, %.preheader41.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge ], [ 4294967295, %.preheader41.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %25 = and i64 %indvars.iv3, 4294967295
  %26 = icmp sgt i64 %indvars.iv61, 0
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv61
  %.pre = load double, double* %27, align 8
  br i1 %26, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader41
  %28 = and i64 %indvars.iv3, 1
  %lcmp.mod = icmp eq i64 %28, 0
  br i1 %lcmp.mod, label %.lr.ph.prol, label %.lr.ph.prol.loopexit

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %29 = load double, double* %3, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv61
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %.pre, %32
  store double %33, double* %27, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %.lcssa.unr.ph = phi double [ %33, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %33, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %34 = icmp eq i64 %25, 0
  br i1 %34, label %._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %35 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %47, %.lr.ph ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv61
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  store double %41, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv61
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond5.1 = icmp eq i64 %indvars.iv.next, %25
  br i1 %exitcond5.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader41
  %48 = phi double [ %.pre, %.preheader41 ], [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %47, %._crit_edge.loopexit ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv61
  %50 = load double, double* %49, align 8
  %51 = fdiv double %48, %50
  store double %51, double* %27, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %indvars.iv.next4 = add nuw nsw i64 %25, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next62, %indvars.iv8
  br i1 %exitcond10, label %.preheader.us.preheader, label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %52 = and i64 %indvars.iv6, 1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 0
  br label %.preheader.us

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %indvars.iv.next7 = add nuw nsw i64 %1, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %._crit_edge52, label %.preheader43

._crit_edge52:                                    ; preds = %._crit_edge50
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge12, %.preheader.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next16, %._crit_edge12 ]
  %5 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge12, label %._crit_edge._crit_edge

._crit_edge12:                                    ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond1, label %._crit_edge14, label %.preheader

._crit_edge14:                                    ; preds = %._crit_edge12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
