; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) unnamed_addr #2 {
.lr.ph5.preheader:
  br label %.lr.ph5.prol

.lr.ph5.prol:                                     ; preds = %.lr.ph5.prol..lr.ph5.prol_crit_edge, %.lr.ph5.preheader
  %indvars.iv12.prol = phi i64 [ %indvars.iv.next13.prol, %.lr.ph5.prol..lr.ph5.prol_crit_edge ], [ 0, %.lr.ph5.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph5.prol..lr.ph5.prol_crit_edge ], [ 4, %.lr.ph5.preheader ]
  %7 = trunc i64 %indvars.iv12.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv12.prol
  store double %8, double* %9, align 8
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv12.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph5.preheader17, label %.lr.ph5.prol..lr.ph5.prol_crit_edge, !llvm.loop !1

.lr.ph5.prol..lr.ph5.prol_crit_edge:              ; preds = %.lr.ph5.prol
  br label %.lr.ph5.prol

.lr.ph5.preheader17:                              ; preds = %.lr.ph5.prol
  br label %.lr.ph5

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv7 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv
  %18 = add nuw nsw i64 %indvars.iv, 2
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %13, %22
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.200000e+03>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  store double %25, double* %17, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv, 3
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fmul double %11, %30
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv7, i64 %indvars.iv
  store double %32, double* %33, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %14
  br label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge3, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5..lr.ph5_crit_edge, %.lr.ph5.preheader17
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.7, %.lr.ph5..lr.ph5_crit_edge ], [ %indvars.iv.next13.prol, %.lr.ph5.preheader17 ]
  %34 = trunc i64 %indvars.iv12 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %6, i64 %indvars.iv12
  %37 = bitcast double* %36 to <2 x double>*
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %38 = trunc i64 %indvars.iv.next13 to i32
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %35, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  store <2 x double> %41, <2 x double>* %37, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %42 = trunc i64 %indvars.iv.next13.1 to i32
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next13.1
  %45 = bitcast double* %44 to <2 x double>*
  %indvars.iv.next13.2 = add nsw i64 %indvars.iv12, 3
  %46 = trunc i64 %indvars.iv.next13.2 to i32
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %43, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  store <2 x double> %49, <2 x double>* %45, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv12, 4
  %50 = trunc i64 %indvars.iv.next13.3 to i32
  %51 = sitofp i32 %50 to double
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next13.3
  %53 = bitcast double* %52 to <2 x double>*
  %indvars.iv.next13.4 = add nsw i64 %indvars.iv12, 5
  %54 = trunc i64 %indvars.iv.next13.4 to i32
  %55 = sitofp i32 %54 to double
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  store <2 x double> %57, <2 x double>* %53, align 8
  %indvars.iv.next13.5 = add nsw i64 %indvars.iv12, 6
  %58 = trunc i64 %indvars.iv.next13.5 to i32
  %59 = sitofp i32 %58 to double
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next13.5
  %61 = bitcast double* %60 to <2 x double>*
  %indvars.iv.next13.6 = add nsw i64 %indvars.iv12, 7
  %62 = trunc i64 %indvars.iv.next13.6 to i32
  %63 = sitofp i32 %62 to double
  %64 = insertelement <2 x double> undef, double %59, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  store <2 x double> %65, <2 x double>* %61, align 8
  %indvars.iv.next13.7 = add nsw i64 %indvars.iv12, 8
  %exitcond15.7 = icmp eq i64 %indvars.iv.next13.7, 500
  br i1 %exitcond15.7, label %.preheader.us.preheader, label %.lr.ph5..lr.ph5_crit_edge

.lr.ph5..lr.ph5_crit_edge:                        ; preds = %.lr.ph5
  br label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12..preheader6_crit_edge ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv50
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader2.us:                                   ; preds = %._crit_edge.us..preheader2.us_crit_edge, %.preheader2.us.preheader
  %indvar = phi i64 [ %9, %._crit_edge.us..preheader2.us_crit_edge ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us..preheader2.us_crit_edge ], [ 1, %.preheader2.us.preheader ]
  %9 = add i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv25, -1
  %scevgep132 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep135 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0143 = icmp ult double* %scevgep132, %scevgep141
  %bound1144 = icmp ult double* %scevgep138, %scevgep135
  %memcheck.conflict146 = and i1 %bound0143, %bound1144
  br i1 %memcheck.conflict146, label %.preheader2.us..preheader2.us.new.preheader_crit_edge, label %vector.body122.preheader

.preheader2.us..preheader2.us.new.preheader_crit_edge: ; preds = %.preheader2.us
  br label %.preheader2.us.new.preheader

vector.body122.preheader:                         ; preds = %.preheader2.us
  br label %vector.body122

vector.body122:                                   ; preds = %vector.body122.vector.body122_crit_edge, %vector.body122.preheader
  %index149 = phi i64 [ %index.next150, %vector.body122.vector.body122_crit_edge ], [ 0, %vector.body122.preheader ]
  %11 = shl i64 %index149, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec158 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec159 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec160 = shufflevector <4 x double> %wide.vec158, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec161 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec164 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec161, %wide.vec164
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec159, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %22
  %24 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %25 = fmul <2 x double> %24, <double 5.000000e-01, double 5.000000e-01>
  %26 = fsub <2 x double> %strided.vec160, %25
  %27 = getelementptr double, double* %23, i64 -1
  %28 = bitcast double* %27 to <4 x double>*
  %interleaved.vec167 = shufflevector <2 x double> %21, <2 x double> %26, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec167, <4 x double>* %28, align 8, !alias.scope !3, !noalias !6
  %index.next150 = add i64 %index149, 2
  %29 = icmp eq i64 %index.next150, 600
  br i1 %29, label %middle.block123, label %vector.body122.vector.body122_crit_edge, !llvm.loop !8

vector.body122.vector.body122_crit_edge:          ; preds = %vector.body122
  br label %vector.body122

middle.block123:                                  ; preds = %vector.body122
  br i1 true, label %middle.block123.._crit_edge.us_crit_edge, label %middle.block123..preheader2.us.new_crit_edge

middle.block123.._crit_edge.us_crit_edge:         ; preds = %middle.block123
  br label %._crit_edge.us

middle.block123..preheader2.us.new_crit_edge:     ; preds = %middle.block123
  br label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %.preheader2.us..preheader2.us.new.preheader_crit_edge, %middle.block123..preheader2.us.new_crit_edge
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new..preheader2.us.new_crit_edge, %.preheader2.us.new.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.preheader2.us.new..preheader2.us.new_crit_edge ], [ 0, %.preheader2.us.new.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv17
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv17
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv17
  %35 = load double, double* %34, align 8
  %36 = fsub double %33, %35
  %37 = fmul double %36, 5.000000e-01
  %38 = fsub double %31, %37
  store double %38, double* %30, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv.next18
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv.next18
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next18
  %44 = load double, double* %43, align 8
  %45 = fsub double %42, %44
  %46 = fmul double %45, 5.000000e-01
  %47 = fsub double %40, %46
  store double %47, double* %39, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader2.us.new..preheader2.us.new_crit_edge, !llvm.loop !11

.preheader2.us.new..preheader2.us.new_crit_edge:  ; preds = %.preheader2.us.new
  br label %.preheader2.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %middle.block123.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond, label %.preheader1.us.preheader, label %._crit_edge.us..preheader2.us_crit_edge

._crit_edge.us..preheader2.us_crit_edge:          ; preds = %._crit_edge.us
  br label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.preheader6
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new..lr.ph.new_crit_edge ], [ 0, %.preheader6 ]
  %48 = load i64, i64* %8, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %51 = load i64, i64* %8, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %54 = load i64, i64* %8, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %57 = load i64, i64* %8, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %60 = load i64, i64* %8, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %63 = load i64, i64* %8, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %66 = load i64, i64* %8, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %69 = load i64, i64* %8, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader2.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %._crit_edge9.us..preheader1.us_crit_edge, %.preheader1.us.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us..preheader1.us_crit_edge ], [ 0, %.preheader1.us.preheader ]
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 2
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 0
  %77 = load double, double* %76, align 8
  %78 = fsub double %75, %77
  %79 = fmul double %78, 5.000000e-01
  %80 = fsub double %73, %79
  store double %80, double* %72, align 8
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 1200
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 1200
  %bound0102 = icmp ult double* %scevgep93, %scevgep100
  %bound1103 = icmp ult double* %scevgep97, %scevgep94
  %memcheck.conflict105 = and i1 %bound0102, %bound1103
  br i1 %memcheck.conflict105, label %.preheader1.us..preheader1.us.new.preheader_crit_edge, label %vector.body85.preheader

.preheader1.us..preheader1.us.new.preheader_crit_edge: ; preds = %.preheader1.us
  br label %.preheader1.us.new.preheader

vector.body85.preheader:                          ; preds = %.preheader1.us
  br label %vector.body85

.preheader1.us.new.preheader:                     ; preds = %middle.block86..preheader1.us.new.preheader_crit_edge, %.preheader1.us..preheader1.us.new.preheader_crit_edge
  %indvars.iv29.ph = phi i64 [ 2, %.preheader1.us..preheader1.us.new.preheader_crit_edge ], [ 1198, %middle.block86..preheader1.us.new.preheader_crit_edge ]
  br label %.preheader1.us.new

vector.body85:                                    ; preds = %vector.body85.vector.body85_crit_edge, %vector.body85.preheader
  %index108 = phi i64 [ %index.next109, %vector.body85.vector.body85_crit_edge ], [ 0, %vector.body85.preheader ]
  %81 = shl i64 %index108, 1
  %offset.idx = or i64 %81, 2
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %offset.idx
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec115 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %offset.idx
  %85 = getelementptr double, double* %84, i64 -1
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec116 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !15
  %strided.vec117 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec118 = shufflevector <4 x double> %wide.vec116, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fsub <2 x double> %strided.vec118, %strided.vec117
  %88 = fmul <2 x double> %87, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %strided.vec, %88
  %90 = or i64 %81, 3
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %90
  %93 = getelementptr double, double* %92, i64 -1
  %94 = bitcast double* %93 to <4 x double>*
  %wide.vec119 = load <4 x double>, <4 x double>* %94, align 8, !alias.scope !15
  %strided.vec120 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec121 = shufflevector <4 x double> %wide.vec119, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %95 = fsub <2 x double> %strided.vec121, %strided.vec120
  %96 = fmul <2 x double> %95, <double 5.000000e-01, double 5.000000e-01>
  %97 = fsub <2 x double> %strided.vec115, %96
  %98 = getelementptr double, double* %91, i64 -1
  %99 = bitcast double* %98 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %89, <2 x double> %97, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %99, align 8, !alias.scope !12, !noalias !15
  %index.next109 = add i64 %index108, 2
  %100 = icmp eq i64 %index.next109, 598
  br i1 %100, label %middle.block86, label %vector.body85.vector.body85_crit_edge, !llvm.loop !17

vector.body85.vector.body85_crit_edge:            ; preds = %vector.body85
  br label %vector.body85

middle.block86:                                   ; preds = %vector.body85
  br i1 false, label %middle.block86.._crit_edge9.us_crit_edge, label %middle.block86..preheader1.us.new.preheader_crit_edge

middle.block86..preheader1.us.new.preheader_crit_edge: ; preds = %middle.block86
  br label %.preheader1.us.new.preheader

middle.block86.._crit_edge9.us_crit_edge:         ; preds = %middle.block86
  br label %._crit_edge9.us

.preheader1.us.new:                               ; preds = %.preheader1.us.new..preheader1.us.new_crit_edge, %.preheader1.us.new.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader1.us.new..preheader1.us.new_crit_edge ], [ %indvars.iv29.ph, %.preheader1.us.new.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv29
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %104 = load double, double* %103, align 8
  %105 = add nsw i64 %indvars.iv29, -1
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fsub double %104, %107
  %109 = fmul double %108, 5.000000e-01
  %110 = fsub double %102, %109
  store double %110, double* %101, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next30
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next30
  %114 = load double, double* %113, align 8
  %115 = load double, double* %103, align 8
  %116 = fsub double %114, %115
  %117 = fmul double %116, 5.000000e-01
  %118 = fsub double %112, %117
  store double %118, double* %111, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1200
  br i1 %exitcond32.1, label %._crit_edge9.us.loopexit, label %.preheader1.us.new..preheader1.us.new_crit_edge, !llvm.loop !18

.preheader1.us.new..preheader1.us.new_crit_edge:  ; preds = %.preheader1.us.new
  br label %.preheader1.us.new

._crit_edge9.us.loopexit:                         ; preds = %.preheader1.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %middle.block86.._crit_edge9.us_crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %.preheader.us.preheader, label %._crit_edge9.us..preheader1.us_crit_edge

._crit_edge9.us..preheader1.us_crit_edge:         ; preds = %._crit_edge9.us
  br label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ %119, %._crit_edge11.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 1199
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 0
  %119 = add i64 %indvars.iv46, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %3, i64 %119, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %4, i64 %119, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep62
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  br i1 %conflict.rdx, label %.preheader.us.scalar.ph.preheader_crit_edge, label %vector.body.preheader

.preheader.us.scalar.ph.preheader_crit_edge:      ; preds = %.preheader.us
  br label %scalar.ph.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = or i64 %index, 1
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %124
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !25
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %index
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr double, double* %129, i64 2
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = fsub <2 x double> %wide.load77, %wide.load79
  %134 = fsub <2 x double> %wide.load78, %wide.load80
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %119, i64 %index
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !26
  %137 = getelementptr double, double* %135, i64 2
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = fadd <2 x double> %133, %wide.load81
  %140 = fadd <2 x double> %134, %wide.load82
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %index
  %142 = bitcast double* %141 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %142, align 8, !alias.scope !26
  %143 = getelementptr double, double* %141, i64 2
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = fsub <2 x double> %139, %wide.load83
  %146 = fsub <2 x double> %140, %wide.load84
  %147 = fmul <2 x double> %145, <double 7.000000e-01, double 7.000000e-01>
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fsub <2 x double> %wide.load, %147
  %150 = fsub <2 x double> %wide.load76, %148
  store <2 x double> %149, <2 x double>* %121, align 8, !alias.scope !19, !noalias !22
  store <2 x double> %150, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %151 = icmp eq i64 %index.next, 1196
  br i1 %151, label %scalar.ph.preheader.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !27

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us.scalar.ph.preheader_crit_edge, %scalar.ph.preheader.loopexit
  %indvars.iv42.ph = phi i64 [ 0, %.preheader.us.scalar.ph.preheader_crit_edge ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv42.ph, %scalar.ph.preheader ]
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv46, i64 %indvars.iv42
  %153 = load double, double* %152, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next43
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv42
  %157 = load double, double* %156, align 8
  %158 = fsub double %155, %157
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %119, i64 %indvars.iv42
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv42
  %163 = load double, double* %162, align 8
  %164 = fsub double %161, %163
  %165 = fmul double %164, 7.000000e-01
  %166 = fsub double %153, %165
  store double %166, double* %152, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 1199
  br i1 %exitcond45, label %._crit_edge11.us, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !28

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

._crit_edge11.us:                                 ; preds = %scalar.ph
  %exitcond49 = icmp eq i64 %119, 999
  br i1 %exitcond49, label %._crit_edge12, label %._crit_edge11.us..preheader.us_crit_edge

._crit_edge11.us..preheader.us_crit_edge:         ; preds = %._crit_edge11.us
  br label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 500
  br i1 %exitcond53, label %._crit_edge13, label %._crit_edge12..preheader6_crit_edge

._crit_edge12..preheader6_crit_edge:              ; preds = %._crit_edge12
  br label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader10.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge17.us..preheader10.us_crit_edge, %.preheader10.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next41, %._crit_edge17.us..preheader10.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv40, 1000
  br label %10

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge, %.preheader10.us
  %indvars.iv36 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next37, %._crit_edge.us._crit_edge ]
  %11 = add nsw i64 %indvars.iv36, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %10
  br label %._crit_edge.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv36
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond39, label %._crit_edge17.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %10

._crit_edge17.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond43, label %._crit_edge18, label %._crit_edge17.us..preheader10.us_crit_edge

._crit_edge17.us..preheader10.us_crit_edge:       ; preds = %._crit_edge17.us
  br label %.preheader10.us

._crit_edge18:                                    ; preds = %._crit_edge17.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge14.us..preheader9.us_crit_edge, %._crit_edge18
  %indvars.iv31 = phi i64 [ 0, %._crit_edge18 ], [ %indvars.iv.next32, %._crit_edge14.us..preheader9.us_crit_edge ]
  %27 = mul nsw i64 %indvars.iv31, 1000
  br label %28

; <label>:28:                                     ; preds = %._crit_edge7.us._crit_edge, %.preheader9.us
  %indvars.iv27 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next28, %._crit_edge7.us._crit_edge ]
  %29 = add nsw i64 %indvars.iv27, %27
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %.._crit_edge7.us_crit_edge

.._crit_edge7.us_crit_edge:                       ; preds = %28
  br label %._crit_edge7.us

; <label>:33:                                     ; preds = %28
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #5
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %.._crit_edge7.us_crit_edge, %33
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv27
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond30, label %._crit_edge14.us, label %._crit_edge7.us._crit_edge

._crit_edge7.us._crit_edge:                       ; preds = %._crit_edge7.us
  br label %28

._crit_edge14.us:                                 ; preds = %._crit_edge7.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %._crit_edge15, label %._crit_edge14.us..preheader9.us_crit_edge

._crit_edge14.us..preheader9.us_crit_edge:        ; preds = %._crit_edge14.us
  br label %.preheader9.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us..preheader.us_crit_edge, %._crit_edge15
  %indvars.iv22 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next23, %._crit_edge11.us..preheader.us_crit_edge ]
  %43 = mul nsw i64 %indvars.iv22, 1000
  br label %44

; <label>:44:                                     ; preds = %._crit_edge8.us._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge8.us._crit_edge ]
  %45 = add nsw i64 %indvars.iv, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %.._crit_edge8.us_crit_edge

.._crit_edge8.us_crit_edge:                       ; preds = %44
  br label %._crit_edge8.us

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %.._crit_edge8.us_crit_edge, %49
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge8.us._crit_edge

._crit_edge8.us._crit_edge:                       ; preds = %._crit_edge8.us
  br label %44

._crit_edge11.us:                                 ; preds = %._crit_edge8.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond25, label %._crit_edge12, label %._crit_edge11.us..preheader.us_crit_edge

._crit_edge11.us..preheader.us_crit_edge:         ; preds = %._crit_edge11.us
  br label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = !{!23}
!26 = !{!24}
!27 = distinct !{!27, !9, !10}
!28 = distinct !{!28, !9, !10}
