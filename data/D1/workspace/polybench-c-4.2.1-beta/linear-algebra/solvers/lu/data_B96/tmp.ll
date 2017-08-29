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
  br label %.preheader72

.preheader72:                                     ; preds = %._crit_edge147, %.preheader72.lr.ph
  %indvars.iv101151 = phi [2000 x double]* [ %0, %.preheader72.lr.ph ], [ %16, %._crit_edge147 ]
  %indvars.iv104150 = phi i64 [ 1, %.preheader72.lr.ph ], [ %indvars.iv.next105, %._crit_edge147 ]
  %indvars.iv106148 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next107, %._crit_edge147 ]
  %1 = mul nuw nsw i64 %indvars.iv106148, 2001
  %2 = add nuw nsw i64 %1, 1
  br label %4

.preheader71:                                     ; preds = %4
  %exitcond103144 = icmp eq i64 %indvars.iv106148, 1999
  br i1 %exitcond103144, label %._crit_edge147.thread, label %._crit_edge147

._crit_edge147.thread:                            ; preds = %.preheader71
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv101151, i64 0, i64 1999
  store double 1.000000e+00, double* %3, align 8
  br label %.preheader70.preheader

; <label>:4:                                      ; preds = %4, %.preheader72
  %indvars.iv91142 = phi i64 [ 0, %.preheader72 ], [ %indvars.iv.next92, %4 ]
  %5 = sub nsw i64 0, %indvars.iv91142
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106148, i64 %indvars.iv91142
  store double %10, double* %11, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91142, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next92, %indvars.iv104150
  br i1 %exitcond96, label %.preheader71, label %4

._crit_edge147:                                   ; preds = %.preheader71
  %12 = mul nsw i64 %indvars.iv106148, -8
  %13 = add nsw i64 %12, 15992
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %14 = bitcast double* %scevgep164 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 %13, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv101151, i64 0, i64 %indvars.iv106148
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106148, 1
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104150, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv101151, i64 1, i64 0
  %16 = bitcast double* %scevgep to [2000 x double]*
  %17 = icmp slt i64 %indvars.iv.next107, 2000
  br i1 %17, label %.preheader72, label %.preheader70.preheader.loopexit

.preheader70.preheader.loopexit:                  ; preds = %._crit_edge147
  br label %.preheader70.preheader

.preheader70.preheader:                           ; preds = %.preheader70.preheader.loopexit, %._crit_edge147.thread
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge139

._crit_edge139:                                   ; preds = %._crit_edge139, %.preheader70.preheader
  %indvars.iv89140 = phi i64 [ 0, %.preheader70.preheader ], [ %indvars.iv.next90.7, %._crit_edge139 ]
  %19 = mul nuw nsw i64 %indvars.iv89140, 16000
  %scevgep163 = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep163, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90 = or i64 %indvars.iv89140, 1
  %20 = mul nuw nsw i64 %indvars.iv.next90, 16000
  %scevgep163.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.1 = or i64 %indvars.iv89140, 2
  %21 = mul nuw nsw i64 %indvars.iv.next90.1, 16000
  %scevgep163.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.2 = or i64 %indvars.iv89140, 3
  %22 = mul nuw nsw i64 %indvars.iv.next90.2, 16000
  %scevgep163.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.3 = or i64 %indvars.iv89140, 4
  %23 = mul nuw nsw i64 %indvars.iv.next90.3, 16000
  %scevgep163.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = or i64 %indvars.iv89140, 5
  %24 = mul nuw nsw i64 %indvars.iv.next90.4, 16000
  %scevgep163.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.5 = or i64 %indvars.iv89140, 6
  %25 = mul nuw nsw i64 %indvars.iv.next90.5, 16000
  %scevgep163.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.6 = or i64 %indvars.iv89140, 7
  %26 = mul nuw nsw i64 %indvars.iv.next90.6, 16000
  %scevgep163.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep163.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.7 = add nsw i64 %indvars.iv89140, 8
  %exitcond11.7 = icmp eq i64 %indvars.iv.next90.7, 2000
  br i1 %exitcond11.7, label %.preheader67.preheader.preheader, label %._crit_edge139

.preheader67.preheader.preheader:                 ; preds = %._crit_edge139
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader67.preheader

.preheader67.preheader:                           ; preds = %.preheader67.preheader.preheader, %._crit_edge120
  %indvars.iv83121 = phi i64 [ %indvars.iv.next84, %._crit_edge120 ], [ 0, %.preheader67.preheader.preheader ]
  %scevgep15 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv83121
  %30 = add nuw nsw i64 %indvars.iv83121, 1
  %scevgep17 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %30
  %31 = bitcast double* %scevgep17 to i8*
  %32 = bitcast double* %scevgep15 to i8*
  br label %.preheader67

.preheader67:                                     ; preds = %._crit_edge116, %.preheader67.preheader
  %indvars.iv79118 = phi i64 [ 0, %.preheader67.preheader ], [ %indvars.iv.next80, %._crit_edge116 ]
  %33 = mul nuw nsw i64 %indvars.iv79118, 16000
  %scevgep13 = getelementptr i8, i8* %18, i64 %33
  %34 = add nuw nsw i64 %33, 16000
  %scevgep14 = getelementptr i8, i8* %18, i64 %34
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79118, i64 %indvars.iv83121
  %bound0 = icmp ult i8* %scevgep13, %31
  %bound1 = icmp ult i8* %32, %scevgep14
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %35 to i8*
  %bc19 = bitcast double* %35 to i8*
  %bound020 = icmp ult i8* %scevgep13, %bc19
  %bound121 = icmp ult i8* %bc, %scevgep14
  %found.conflict22 = and i1 %bound020, %bound121
  %conflict.rdx = or i1 %found.conflict, %found.conflict22
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = load double, double* %35, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> undef, double %39, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv83121
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv83121
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv83121
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv83121
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fmul <2 x double> %41, %53
  %57 = fmul <2 x double> %43, %55
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv79118, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load24, %57
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %66 = icmp eq i64 %index.next, 2000
  br i1 %66, label %._crit_edge116.loopexit56, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv75114 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next76.1, %scalar.ph ]
  %67 = load double, double* %35, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75114, i64 %indvars.iv83121
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv79118, i64 %indvars.iv75114
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75114, 1
  %74 = load double, double* %35, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next76, i64 %indvars.iv83121
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv79118, i64 %indvars.iv.next76
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %78, align 8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75114, 2
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76.1, 2000
  br i1 %exitcond78.1, label %._crit_edge116.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge116.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge116

._crit_edge116.loopexit56:                        ; preds = %vector.body
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.loopexit56, %._crit_edge116.loopexit
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79118, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond82, label %._crit_edge120, label %.preheader67

._crit_edge120:                                   ; preds = %._crit_edge116
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83121, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond10, label %.preheader.preheader, label %.preheader67.preheader

.preheader.preheader:                             ; preds = %._crit_edge120
  %81 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %82 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %83 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %84 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %85 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %86 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %87 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv73110 = phi i64 [ %indvars.iv.next74, %._crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep30 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 0
  %scevgep3031 = bitcast double* %scevgep30 to i8*
  %88 = add nuw nsw i64 %indvars.iv73110, 1
  %scevgep32 = getelementptr [2000 x double], [2000 x double]* %0, i64 %88, i64 0
  %scevgep3233 = bitcast double* %scevgep32 to i8*
  %89 = mul nuw nsw i64 %indvars.iv73110, 16000
  %scevgep34 = getelementptr i8, i8* %18, i64 %89
  %90 = add nuw nsw i64 %89, 16000
  %scevgep35 = getelementptr i8, i8* %18, i64 %90
  %bound036 = icmp ult i8* %scevgep3031, %scevgep35
  %bound137 = icmp ult i8* %scevgep34, %scevgep3233
  %memcheck.conflict39 = and i1 %bound036, %bound137
  br i1 %memcheck.conflict39, label %scalar.ph27.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %.preheader
  br label %vector.body25

scalar.ph27.preheader:                            ; preds = %.preheader
  br label %scalar.ph27

vector.body25:                                    ; preds = %vector.body25, %vector.body25.preheader
  %index42 = phi i64 [ 0, %vector.body25.preheader ], [ %index.next43.1, %vector.body25 ]
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv73110, i64 %index42
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load50 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load51 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !13
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %index42
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load50, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load51, <2 x i64>* %98, align 8, !alias.scope !16, !noalias !13
  %index.next43 = or i64 %index42, 4
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv73110, i64 %index.next43
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load50.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load51.1 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %index.next43
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load50.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load51.1, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %index.next43.1 = add nsw i64 %index42, 8
  %107 = icmp eq i64 %index.next43.1, 2000
  br i1 %107, label %._crit_edge.loopexit55, label %vector.body25, !llvm.loop !18

scalar.ph27:                                      ; preds = %scalar.ph27, %scalar.ph27.preheader
  %indvars.iv109 = phi i64 [ 0, %scalar.ph27.preheader ], [ %indvars.iv.next.4, %scalar.ph27 ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv73110, i64 %indvars.iv109
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %indvars.iv109
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv109, 1
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv73110, i64 %indvars.iv.next
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv109, 2
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv73110, i64 %indvars.iv.next.1
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv109, 3
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv73110, i64 %indvars.iv.next.2
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv109, 4
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv73110, i64 %indvars.iv.next.3
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110, i64 %indvars.iv.next.3
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv109, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.loopexit, label %scalar.ph27, !llvm.loop !19

._crit_edge.loopexit:                             ; preds = %scalar.ph27
  br label %._crit_edge

._crit_edge.loopexit55:                           ; preds = %vector.body25
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit55, %._crit_edge.loopexit
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73110, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond9, label %._crit_edge112, label %.preheader

._crit_edge112:                                   ; preds = %._crit_edge
  tail call void @free(i8* nonnull %18) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.lr.ph:
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.backedge, %.preheader43.lr.ph
  %indvars.iv6377 = phi i64 [ 0, %.preheader43.lr.ph ], [ %indvars.iv6377.be, %.preheader43.backedge ]
  %exitcond5167 = icmp eq i64 %indvars.iv6377, 0
  br i1 %exitcond5167, label %.preheader43.backedge, label %.preheader41.preheader

.preheader43.backedge:                            ; preds = %.preheader43, %._crit_edge76
  %indvars.iv6377.be = phi i64 [ %indvars.iv.next64, %._crit_edge76 ], [ 1, %.preheader43 ]
  br label %.preheader43

.preheader41.preheader:                           ; preds = %.preheader43
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 0
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 0
  br label %.preheader41

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv4668 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %exitcond65 = icmp eq i64 %indvars.iv4668, 0
  br i1 %exitcond65, label %.preheader41.._crit_edge_crit_edge, label %.lr.ph

.preheader41.._crit_edge_crit_edge:               ; preds = %.preheader41
  %.pre84 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv4668
  %.pre = load double, double* %2, align 8
  %xtraiter = and i64 %indvars.iv4668, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %3

; <label>:3:                                      ; preds = %.prol.preheader
  %4 = load double, double* %1, align 8
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4668
  %6 = load double, double* %5, align 8
  %7 = fmul double %4, %6
  %8 = fsub double %.pre, %7
  store double %8, double* %2, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %3
  %.lcssa.unr.ph = phi double [ %8, %3 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %8, %3 ], [ %.pre, %.lr.ph ]
  %indvars.iv66.unr.ph = phi i64 [ 1, %3 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %9 = icmp eq i64 %indvars.iv4668, 1
  br i1 %9, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph.new
  %11 = phi double [ %.unr.ph, %.lr.ph.new ], [ %23, %10 ]
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %10 ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv66
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv4668
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %11, %16
  store double %17, double* %2, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv66, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv4668
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %2, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv66, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4668
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %10

._crit_edge.loopexit.unr-lcssa:                   ; preds = %10
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %23, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41.._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader41.._crit_edge_crit_edge ], [ %2, %._crit_edge.loopexit ]
  %24 = phi double [ %.pre84, %.preheader41.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4668, i64 %indvars.iv4668
  %26 = load double, double* %25, align 8
  %27 = fdiv double %24, %26
  store double %27, double* %.pre-phi, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4668, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, %indvars.iv6377
  br i1 %exitcond51, label %.preheader.preheader, label %.preheader41

.preheader.preheader:                             ; preds = %._crit_edge
  %xtraiter4 = and i64 %indvars.iv6377, 1
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  %28 = icmp eq i64 %indvars.iv6377, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge72
  %indvars.iv5974 = phi i64 [ %indvars.iv.next60, %._crit_edge72 ], [ %indvars.iv6377, %.preheader.preheader ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv5974
  %.pre85 = load double, double* %30, align 8
  br i1 %lcmp.mod5, label %.prol.loopexit3.unr-lcssa, label %.prol.preheader2

.prol.preheader2:                                 ; preds = %.preheader
  br label %31

; <label>:31:                                     ; preds = %.prol.preheader2
  %32 = load double, double* %29, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv5974
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %.pre85, %35
  store double %36, double* %30, align 8
  br label %.prol.loopexit3.unr-lcssa

.prol.loopexit3.unr-lcssa:                        ; preds = %.preheader, %31
  %.unr6.ph = phi double [ %36, %31 ], [ %.pre85, %.preheader ]
  %indvars.iv5270.unr.ph = phi i64 [ 1, %31 ], [ 0, %.preheader ]
  br label %.prol.loopexit3

.prol.loopexit3:                                  ; preds = %.prol.loopexit3.unr-lcssa
  br i1 %28, label %._crit_edge72, label %.preheader.new

.preheader.new:                                   ; preds = %.prol.loopexit3
  br label %37

; <label>:37:                                     ; preds = %37, %.preheader.new
  %38 = phi double [ %.unr6.ph, %.preheader.new ], [ %50, %37 ]
  %indvars.iv5270 = phi i64 [ %indvars.iv5270.unr.ph, %.preheader.new ], [ %indvars.iv.next53.1, %37 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv5270
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5270, i64 %indvars.iv5974
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %30, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv5270, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv.next53
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv5974
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %30, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv5270, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next53.1, %indvars.iv6377
  br i1 %exitcond56.1, label %._crit_edge72.unr-lcssa, label %37

._crit_edge72.unr-lcssa:                          ; preds = %37
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %.prol.loopexit3, %._crit_edge72.unr-lcssa
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv5974, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond62, label %._crit_edge76, label %.preheader

._crit_edge76:                                    ; preds = %._crit_edge72
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv6377, 1
  %51 = icmp slt i64 %indvars.iv.next64, 2000
  br i1 %51, label %.preheader43.backedge, label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge76
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

.preheader:                                       ; preds = %._crit_edge15, %.preheader.preheader
  %indvars.iv1116 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge15 ]
  %5 = mul nuw nsw i64 %indvars.iv1116, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv14, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1116, i64 %indvars.iv14
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge15, label %6

._crit_edge15:                                    ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1116, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond1, label %._crit_edge18, label %.preheader

._crit_edge18:                                    ; preds = %._crit_edge15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
