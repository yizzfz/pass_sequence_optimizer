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

._crit_edge:                                      ; preds = %2
  br label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge9

._crit_edge9:                                     ; preds = %6
  br label %10

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9, %._crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader72.lr.ph:
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %._crit_edge96.thread, %.preheader72.lr.ph
  %indvars.iv130 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next131, %._crit_edge96.thread ]
  %1 = sub i64 1998, %indvars.iv130
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %7

.preheader71:                                     ; preds = %7
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %4 = icmp slt i64 %indvars.iv.next131, 2000
  br i1 %4, label %._crit_edge96.thread, label %.preheader70.us.preheader

._crit_edge96.thread:                             ; preds = %.preheader71
  %5 = add nuw nsw i64 %3, 8
  %scevgep128 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv.next131
  %scevgep128129 = bitcast double* %scevgep128 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep128129, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph94

; <label>:7:                                      ; preds = %._crit_edge, %.lr.ph94
  %indvars.iv118 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next119, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv118
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv118
  store double %13, double* %14, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond122 = icmp eq i64 %indvars.iv118, %indvars.iv130
  br i1 %exitcond122, label %.preheader71, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %7

.preheader70.us.preheader:                        ; preds = %.preheader71
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.._crit_edge91.us_crit_edge, %.preheader70.us.preheader
  %indvars.iv116 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next117.7, %._crit_edge91.us.._crit_edge91.us_crit_edge ]
  %17 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %18 = mul nuw nsw i64 %indvars.iv.next117, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %19 = mul nuw nsw i64 %indvars.iv.next117.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %20 = mul nuw nsw i64 %indvars.iv.next117.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %21 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.4 = or i64 %indvars.iv116, 5
  %22 = mul nuw nsw i64 %indvars.iv.next117.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.5 = or i64 %indvars.iv116, 6
  %23 = mul nuw nsw i64 %indvars.iv.next117.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.6 = or i64 %indvars.iv116, 7
  %24 = mul nuw nsw i64 %indvars.iv.next117.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.7 = add nsw i64 %indvars.iv116, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next117.7, 2000
  br i1 %exitcond45.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge91.us.._crit_edge91.us_crit_edge

._crit_edge91.us.._crit_edge91.us_crit_edge:      ; preds = %._crit_edge91.us
  br label %._crit_edge91.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge91.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge80.us..preheader67.us.us.preheader_crit_edge, %.preheader67.us.us.preheader.preheader
  %indvars.iv111 = phi i64 [ %27, %._crit_edge80.us..preheader67.us.us.preheader_crit_edge ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv111
  %27 = add nuw nsw i64 %indvars.iv111, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %27
  %28 = bitcast double* %scevgep5 to i8*
  %29 = bitcast double* %scevgep3 to i8*
  br label %vector.memcheck

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %exitcond44 = icmp eq i64 %27, 2000
  br i1 %exitcond44, label %vector.memcheck28.preheader, label %._crit_edge80.us..preheader67.us.us.preheader_crit_edge

._crit_edge80.us..preheader67.us.us.preheader_crit_edge: ; preds = %._crit_edge80.us
  br label %.preheader67.us.us.preheader

vector.memcheck28.preheader:                      ; preds = %._crit_edge80.us
  %30 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %vector.memcheck28

vector.memcheck:                                  ; preds = %._crit_edge78.us.us.vector.memcheck_crit_edge, %.preheader67.us.us.preheader
  %indvars.iv109 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next110, %._crit_edge78.us.us.vector.memcheck_crit_edge ]
  %32 = mul nuw nsw i64 %indvars.iv109, 16000
  %scevgep1 = getelementptr i8, i8* %16, i64 %32
  %33 = add nuw nsw i64 %32, 16000
  %scevgep2 = getelementptr i8, i8* %16, i64 %33
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv111
  %bound0 = icmp ult i8* %scevgep1, %28
  %bound1 = icmp ult i8* %29, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %34 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %35 = or i64 %index, 1
  %36 = or i64 %index, 2
  %37 = or i64 %index, 3
  %38 = load double, double* %34, align 8, !alias.scope !1
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv111
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv111
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv111
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv111
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
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv109, i64 %index
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %59 = fadd <2 x double> %wide.load, %53
  %60 = fadd <2 x double> %wide.load12, %54
  store <2 x double> %59, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %60, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %._crit_edge78.us.us.loopexit47, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge78.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge78.us.us

._crit_edge78.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit47, %._crit_edge78.us.us.loopexit
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond43, label %._crit_edge80.us, label %._crit_edge78.us.us.vector.memcheck_crit_edge

._crit_edge78.us.us.vector.memcheck_crit_edge:    ; preds = %._crit_edge78.us.us
  br label %vector.memcheck

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv106 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next107.1, %scalar.ph.scalar.ph_crit_edge ]
  %62 = load double, double* %34, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv111
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv109, i64 %indvars.iv106
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %69 = load double, double* %34, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv111
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next107
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next107, 1999
  br i1 %exitcond108.1, label %._crit_edge78.us.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !12

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

vector.memcheck28:                                ; preds = %._crit_edge.us.vector.memcheck28_crit_edge, %vector.memcheck28.preheader
  %indvars.iv104 = phi i64 [ %76, %._crit_edge.us.vector.memcheck28_crit_edge ], [ 0, %vector.memcheck28.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 0
  %76 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %76, i64 0
  %77 = mul nuw nsw i64 %indvars.iv104, 16000
  %scevgep22 = getelementptr i8, i8* %16, i64 %77
  %78 = add nuw nsw i64 %77, 16000
  %scevgep23 = getelementptr i8, i8* %16, i64 %78
  %79 = bitcast double* %scevgep20 to i8*
  %80 = bitcast double* %scevgep18 to i8*
  %bound024 = icmp ult i8* %80, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %79
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %vector.memcheck28
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %vector.memcheck28
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13.vector.body13_crit_edge, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13.vector.body13_crit_edge ]
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv104, i64 %index30
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !13
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %index30
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %88, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv104, i64 %index.next31
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %index.next31
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %97 = icmp eq i64 %index.next31.1, 2000
  br i1 %97, label %._crit_edge.us.loopexit46, label %vector.body13.vector.body13_crit_edge, !llvm.loop !18

vector.body13.vector.body13_crit_edge:            ; preds = %vector.body13
  br label %vector.body13

scalar.ph15:                                      ; preds = %scalar.ph15.scalar.ph15_crit_edge, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15.scalar.ph15_crit_edge ]
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15.scalar.ph15_crit_edge, !llvm.loop !19

scalar.ph15.scalar.ph15_crit_edge:                ; preds = %scalar.ph15
  br label %scalar.ph15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %exitcond42 = icmp eq i64 %76, 2000
  br i1 %exitcond42, label %._crit_edge75, label %._crit_edge.us.vector.memcheck28_crit_edge

._crit_edge.us.vector.memcheck28_crit_edge:       ; preds = %._crit_edge.us
  br label %vector.memcheck28

._crit_edge75:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %16) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.preheader:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge50..preheader43_crit_edge, %.preheader43.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge50..preheader43_crit_edge ], [ 0, %.preheader43.preheader ]
  %indvars.iv68 = phi i32 [ %indvars.iv.next69, %._crit_edge50..preheader43_crit_edge ], [ -1, %.preheader43.preheader ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.preheader41.preheader, label %.preheader43.._crit_edge50_crit_edge

.preheader43.._crit_edge50_crit_edge:             ; preds = %.preheader43
  br label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count70 = zext i32 %indvars.iv68 to i64
  %5 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %5, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %7 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge48.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge48.us..preheader.us_crit_edge ], [ %indvars.iv1, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv74
  %.pre60 = load double, double* %8, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.preheader.us..prol.loopexit7.unr-lcssa_crit_edge

.preheader.us..prol.loopexit7.unr-lcssa_crit_edge: ; preds = %.preheader.us
  br label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  %9 = load double, double* %6, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv74
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre60, %12
  store double %13, double* %8, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us..prol.loopexit7.unr-lcssa_crit_edge, %.prol.preheader6
  %indvars.iv66.unr.ph = phi i64 [ 1, %.prol.preheader6 ], [ 0, %.preheader.us..prol.loopexit7.unr-lcssa_crit_edge ]
  %.unr10.ph = phi double [ %13, %.prol.preheader6 ], [ %.pre60, %.preheader.us..prol.loopexit7.unr-lcssa_crit_edge ]
  br i1 %7, label %.prol.loopexit7.._crit_edge48.us_crit_edge, label %.preheader.us.new

.prol.loopexit7.._crit_edge48.us_crit_edge:       ; preds = %.prol.loopexit7.unr-lcssa
  br label %._crit_edge48.us

.preheader.us.new:                                ; preds = %.prol.loopexit7.unr-lcssa
  br label %14

; <label>:14:                                     ; preds = %._crit_edge12, %.preheader.us.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.preheader.us.new ], [ %indvars.iv.next67.1, %._crit_edge12 ]
  %15 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %27, %._crit_edge12 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv66
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv74
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next67
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next67, i64 %indvars.iv74
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %8, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next67, %wide.trip.count70
  br i1 %exitcond71.1, label %._crit_edge48.us.unr-lcssa, label %._crit_edge12

._crit_edge12:                                    ; preds = %14
  br label %14

._crit_edge48.us.unr-lcssa:                       ; preds = %14
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit7.._crit_edge48.us_crit_edge, %._crit_edge48.us.unr-lcssa
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond4, label %._crit_edge50.loopexit, label %._crit_edge48.us..preheader.us_crit_edge

._crit_edge48.us..preheader.us_crit_edge:         ; preds = %._crit_edge48.us
  br label %.preheader.us

.preheader41:                                     ; preds = %._crit_edge..preheader41_crit_edge, %.preheader41.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge..preheader41_crit_edge ], [ 0, %.preheader41.preheader ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge..preheader41_crit_edge ], [ -1, %.preheader41.preheader ]
  %28 = add i64 %indvars.iv63, 4294967295
  %29 = and i64 %28, 4294967295
  %30 = icmp sgt i64 %indvars.iv63, 0
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv63
  %.pre = load double, double* %31, align 8
  br i1 %30, label %.lr.ph, label %.preheader41.._crit_edge_crit_edge

.preheader41.._crit_edge_crit_edge:               ; preds = %.preheader41
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %wide.trip.count = zext i32 %indvars.iv61 to i64
  %32 = and i64 %28, 1
  %lcmp.mod = icmp eq i64 %32, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.lr.ph..prol.loopexit.unr-lcssa_crit_edge

.lr.ph..prol.loopexit.unr-lcssa_crit_edge:        ; preds = %.lr.ph
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  %33 = load double, double* %4, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv63
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %.pre, %36
  store double %37, double* %31, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph..prol.loopexit.unr-lcssa_crit_edge, %.prol.preheader
  %.lcssa.unr.ph = phi double [ %37, %.prol.preheader ], [ undef, %.lr.ph..prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %37, %.prol.preheader ], [ %.pre, %.lr.ph..prol.loopexit.unr-lcssa_crit_edge ]
  %38 = icmp eq i64 %29, 0
  br i1 %38, label %.prol.loopexit.._crit_edge.loopexit_crit_edge, label %.lr.ph.new

.prol.loopexit.._crit_edge.loopexit_crit_edge:    ; preds = %.prol.loopexit.unr-lcssa
  br label %._crit_edge.loopexit

.lr.ph.new:                                       ; preds = %.prol.loopexit.unr-lcssa
  br label %39

; <label>:39:                                     ; preds = %._crit_edge13, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge13 ]
  %40 = phi double [ %.unr.ph, %.lr.ph.new ], [ %52, %._crit_edge13 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv63
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %40, %45
  store double %46, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv63
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge13

._crit_edge13:                                    ; preds = %39
  br label %39

._crit_edge.loopexit.unr-lcssa:                   ; preds = %39
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %52, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader41.._crit_edge_crit_edge, %._crit_edge.loopexit
  %53 = phi double [ %.pre, %.preheader41.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  %55 = load double, double* %54, align 8
  %56 = fdiv double %53, %55
  store double %56, double* %31, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next62 = add nsw i32 %indvars.iv61, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next64, %indvars.iv1
  br i1 %exitcond3, label %.preheader.us.preheader, label %._crit_edge..preheader41_crit_edge

._crit_edge..preheader41_crit_edge:               ; preds = %._crit_edge
  br label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %.preheader43.._crit_edge50_crit_edge, %._crit_edge50.loopexit
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next69 = add nsw i32 %indvars.iv68, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %._crit_edge54, label %._crit_edge50..preheader43_crit_edge

._crit_edge50..preheader43_crit_edge:             ; preds = %._crit_edge50
  br label %.preheader43

._crit_edge54:                                    ; preds = %._crit_edge50
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us..preheader.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge2 ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %._crit_edge, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge2:                                     ; preds = %13
  br label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond1, label %._crit_edge13, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
