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
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge10

.._crit_edge_crit_edge10:                         ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge10, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader72.lr.ph:
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %._crit_edge96.thread, %.preheader72.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next29, %._crit_edge96.thread ]
  %1 = sub i64 1998, %indvars.iv28
  %2 = shl i64 %1, 3
  br label %7

.preheader71:                                     ; preds = %7
  %3 = and i64 %2, 34359738360
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %4 = icmp slt i64 %indvars.iv.next29, 2000
  br i1 %4, label %._crit_edge96.thread, label %.preheader70.us.preheader

._crit_edge96.thread:                             ; preds = %.preheader71
  %5 = add nuw nsw i64 %3, 8
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv.next29
  %scevgep2627 = bitcast double* %scevgep26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2627, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv28
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph94

; <label>:7:                                      ; preds = %._crit_edge, %.lr.ph94
  %indvars.iv16 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next17, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv16
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv16
  store double %13, double* %14, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv16, %indvars.iv28
  br i1 %exitcond20, label %.preheader71, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %7

.preheader70.us.preheader:                        ; preds = %.preheader71
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv28
  store double 1.000000e+00, double* %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us.._crit_edge91.us_crit_edge, %.preheader70.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next15.7, %._crit_edge91.us.._crit_edge91.us_crit_edge ]
  %17 = mul nuw nsw i64 %indvars.iv14, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15 = or i64 %indvars.iv14, 1
  %18 = mul nuw nsw i64 %indvars.iv.next15, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %19 = mul nuw nsw i64 %indvars.iv.next15.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.2 = or i64 %indvars.iv14, 3
  %20 = mul nuw nsw i64 %indvars.iv.next15.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.3 = or i64 %indvars.iv14, 4
  %21 = mul nuw nsw i64 %indvars.iv.next15.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.4 = or i64 %indvars.iv14, 5
  %22 = mul nuw nsw i64 %indvars.iv.next15.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.5 = or i64 %indvars.iv14, 6
  %23 = mul nuw nsw i64 %indvars.iv.next15.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.6 = or i64 %indvars.iv14, 7
  %24 = mul nuw nsw i64 %indvars.iv.next15.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.7 = add nuw nsw i64 %indvars.iv14, 8
  %exitcond74.7 = icmp eq i64 %indvars.iv.next15.7, 2000
  br i1 %exitcond74.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge91.us.._crit_edge91.us_crit_edge

._crit_edge91.us.._crit_edge91.us_crit_edge:      ; preds = %._crit_edge91.us
  br label %._crit_edge91.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge91.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge80.us..preheader67.us.us.preheader_crit_edge, %.preheader67.us.us.preheader.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge80.us..preheader67.us.us.preheader_crit_edge ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep32 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv9
  %28 = add nuw nsw i64 %indvars.iv9, 1
  %scevgep34 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep34 to i8*
  %30 = bitcast double* %scevgep32 to i8*
  br label %.preheader67.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond73, label %.preheader.us.preheader, label %._crit_edge80.us..preheader67.us.us.preheader_crit_edge

._crit_edge80.us..preheader67.us.us.preheader_crit_edge: ; preds = %._crit_edge80.us
  br label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge78.us.us..preheader67.us.us_crit_edge, %.preheader67.us.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next8, %._crit_edge78.us.us..preheader67.us.us_crit_edge ]
  %38 = mul nuw nsw i64 %indvars.iv7, 16000
  %scevgep30 = getelementptr i8, i8* %16, i64 %38
  %39 = add nuw nsw i64 %38, 16000
  %scevgep31 = getelementptr i8, i8* %16, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv9
  %bound0 = icmp ult i8* %scevgep30, %29
  %bound1 = icmp ult i8* %30, %scevgep31
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc36 = bitcast double* %40 to i8*
  %bound037 = icmp ult i8* %scevgep30, %bc36
  %bound138 = icmp ult i8* %bc, %scevgep31
  %found.conflict39 = and i1 %bound037, %bound138
  %conflict.rdx = or i1 %found.conflict, %found.conflict39
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %40, align 8, !alias.scope !1
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = insertelement <2 x double> undef, double %44, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv9
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv9
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv9
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv9
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = insertelement <2 x double> undef, double %55, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fmul <2 x double> %46, %58
  %62 = fmul <2 x double> %48, %60
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv7, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %67 = fadd <2 x double> %wide.load, %61
  %68 = fadd <2 x double> %wide.load41, %62
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %71 = icmp eq i64 %index.next, 2000
  br i1 %71, label %._crit_edge78.us.us.loopexit78, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge78.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge78.us.us

._crit_edge78.us.us.loopexit78:                   ; preds = %vector.body
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit78, %._crit_edge78.us.us.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond72, label %._crit_edge80.us, label %._crit_edge78.us.us..preheader67.us.us_crit_edge

._crit_edge78.us.us..preheader67.us.us_crit_edge: ; preds = %._crit_edge78.us.us
  br label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv4 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next5.1, %scalar.ph.scalar.ph_crit_edge ]
  %72 = load double, double* %40, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv9
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %75
  store double %78, double* %76, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv9
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5, 1999
  br i1 %exitcond6.1, label %._crit_edge78.us.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !12

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep47 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 0
  %scevgep4748 = bitcast double* %scevgep47 to i8*
  %86 = add nuw nsw i64 %indvars.iv2, 1
  %scevgep49 = getelementptr [2000 x double], [2000 x double]* %0, i64 %86, i64 0
  %scevgep4950 = bitcast double* %scevgep49 to i8*
  %87 = mul nuw nsw i64 %indvars.iv2, 16000
  %scevgep51 = getelementptr i8, i8* %16, i64 %87
  %88 = add nuw nsw i64 %87, 16000
  %scevgep52 = getelementptr i8, i8* %16, i64 %88
  %bound053 = icmp ult i8* %scevgep4748, %scevgep52
  %bound154 = icmp ult i8* %scevgep51, %scevgep4950
  %memcheck.conflict56 = and i1 %bound053, %bound154
  br i1 %memcheck.conflict56, label %scalar.ph44.preheader, label %vector.body42.preheader

vector.body42.preheader:                          ; preds = %.preheader.us
  br label %vector.body42

scalar.ph44.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph44

vector.body42:                                    ; preds = %vector.body42.vector.body42_crit_edge, %vector.body42.preheader
  %index59 = phi i64 [ 0, %vector.body42.preheader ], [ %index.next60.1, %vector.body42.vector.body42_crit_edge ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv2, i64 %index59
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load67 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load68 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %index59
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load67, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load68, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %index.next60 = or i64 %index59, 4
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv2, i64 %index.next60
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load67.1 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load68.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %index.next60
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load67.1, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load68.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %index.next60.1 = add nuw nsw i64 %index59, 8
  %105 = icmp eq i64 %index.next60.1, 2000
  br i1 %105, label %._crit_edge.us.loopexit77, label %vector.body42.vector.body42_crit_edge, !llvm.loop !18

vector.body42.vector.body42_crit_edge:            ; preds = %vector.body42
  br label %vector.body42

scalar.ph44:                                      ; preds = %scalar.ph44.scalar.ph44_crit_edge, %scalar.ph44.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph44.preheader ], [ %indvars.iv.next.4, %scalar.ph44.scalar.ph44_crit_edge ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv2, i64 %indvars.iv
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph44.scalar.ph44_crit_edge, !llvm.loop !19

scalar.ph44.scalar.ph44_crit_edge:                ; preds = %scalar.ph44
  br label %scalar.ph44

._crit_edge.us.loopexit:                          ; preds = %scalar.ph44
  br label %._crit_edge.us

._crit_edge.us.loopexit77:                        ; preds = %vector.body42
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit77, %._crit_edge.us.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond71, label %._crit_edge75, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

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
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge50..preheader43_crit_edge ], [ 0, %.preheader43.preheader ]
  %indvars.iv8 = phi i32 [ %indvars.iv.next9, %._crit_edge50..preheader43_crit_edge ], [ -1, %.preheader43.preheader ]
  %1 = add nuw nsw i64 %indvars.iv18, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv18, 0
  br i1 %3, label %.preheader41.preheader, label %.preheader43.._crit_edge50_crit_edge

.preheader43.._crit_edge50_crit_edge:             ; preds = %.preheader43
  br label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 0
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count10 = zext i32 %indvars.iv8 to i64
  %5 = and i64 %1, 1
  %lcmp.mod26 = icmp eq i64 %5, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 0
  %7 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge48.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge48.us..preheader.us_crit_edge ], [ %indvars.iv18, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv14
  %.pre60 = load double, double* %8, align 8
  br i1 %lcmp.mod26, label %9, label %.preheader.us..prol.loopexit24_crit_edge

.preheader.us..prol.loopexit24_crit_edge:         ; preds = %.preheader.us
  br label %.prol.loopexit24

; <label>:9:                                      ; preds = %.preheader.us
  %10 = load double, double* %6, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv14
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre60, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit24

.prol.loopexit24:                                 ; preds = %.preheader.us..prol.loopexit24_crit_edge, %9
  %indvars.iv6.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us..prol.loopexit24_crit_edge ]
  %.unr27.ph = phi double [ %14, %9 ], [ %.pre60, %.preheader.us..prol.loopexit24_crit_edge ]
  br i1 %7, label %.prol.loopexit24.._crit_edge48.us_crit_edge, label %.preheader.us.new

.prol.loopexit24.._crit_edge48.us_crit_edge:      ; preds = %.prol.loopexit24
  br label %._crit_edge48.us

.preheader.us.new:                                ; preds = %.prol.loopexit24
  br label %15

; <label>:15:                                     ; preds = %._crit_edge28, %.preheader.us.new
  %indvars.iv6 = phi i64 [ %indvars.iv6.unr.ph, %.preheader.us.new ], [ %indvars.iv.next7.1, %._crit_edge28 ]
  %16 = phi double [ %.unr27.ph, %.preheader.us.new ], [ %28, %._crit_edge28 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv6
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv14
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %8, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next7
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next7, i64 %indvars.iv14
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %8, align 8
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next7, %wide.trip.count10
  br i1 %exitcond11.1, label %._crit_edge48.us.loopexit, label %._crit_edge28

._crit_edge28:                                    ; preds = %15
  br label %15

._crit_edge48.us.loopexit:                        ; preds = %15
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit24.._crit_edge48.us_crit_edge, %._crit_edge48.us.loopexit
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond21, label %._crit_edge50.loopexit, label %._crit_edge48.us..preheader.us_crit_edge

._crit_edge48.us..preheader.us_crit_edge:         ; preds = %._crit_edge48.us
  br label %.preheader.us

.preheader41:                                     ; preds = %._crit_edge..preheader41_crit_edge, %.preheader41.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge..preheader41_crit_edge ], [ 0, %.preheader41.preheader ]
  %indvars.iv1 = phi i32 [ %indvars.iv.next2, %._crit_edge..preheader41_crit_edge ], [ -1, %.preheader41.preheader ]
  %29 = add nuw nsw i64 %indvars.iv3, 4294967295
  %30 = and i64 %29, 4294967295
  %31 = icmp sgt i64 %indvars.iv3, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv3
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %.preheader41.._crit_edge_crit_edge

.preheader41.._crit_edge_crit_edge:               ; preds = %.preheader41
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %wide.trip.count = zext i32 %indvars.iv1 to i64
  %33 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %33, 0
  br i1 %lcmp.mod, label %34, label %.lr.ph..prol.loopexit_crit_edge

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

; <label>:34:                                     ; preds = %.lr.ph
  %35 = load double, double* %4, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %.pre, %38
  store double %39, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %34
  %.lcssa.unr.ph = phi double [ %39, %34 ], [ undef, %.lr.ph..prol.loopexit_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %39, %34 ], [ %.pre, %.lr.ph..prol.loopexit_crit_edge ]
  %40 = icmp eq i64 %30, 0
  br i1 %40, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %41

; <label>:41:                                     ; preds = %._crit_edge29, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge29 ]
  %42 = phi double [ %.unr.ph, %.lr.ph.new ], [ %54, %._crit_edge29 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv3
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv3
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %._crit_edge29

._crit_edge29:                                    ; preds = %41
  br label %41

._crit_edge.loopexit:                             ; preds = %41
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.preheader41.._crit_edge_crit_edge, %._crit_edge.loopexit
  %55 = phi double [ %.pre, %.preheader41.._crit_edge_crit_edge ], [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge_crit_edge ], [ %54, %._crit_edge.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %57 = load double, double* %56, align 8
  %58 = fdiv double %55, %57
  store double %58, double* %32, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %indvars.iv.next2 = add nsw i32 %indvars.iv1, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next4, %indvars.iv18
  br i1 %exitcond20, label %.preheader.us.preheader, label %._crit_edge..preheader41_crit_edge

._crit_edge..preheader41_crit_edge:               ; preds = %._crit_edge
  br label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %.preheader43.._crit_edge50_crit_edge, %._crit_edge50.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next9 = add nsw i32 %indvars.iv8, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond22, label %._crit_edge54, label %._crit_edge50..preheader43_crit_edge

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

.preheader.us:                                    ; preds = %._crit_edge12.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next2, %._crit_edge12.us..preheader.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv1, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %6
  br label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %6

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge14, label %._crit_edge12.us..preheader.us_crit_edge

._crit_edge12.us..preheader.us_crit_edge:         ; preds = %._crit_edge12.us
  br label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
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
