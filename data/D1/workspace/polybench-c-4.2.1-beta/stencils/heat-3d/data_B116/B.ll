; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
  %3 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %2, %11
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
.lr.ph12:
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge7.us, %.lr.ph12
  %indvars.iv24 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next25, %._crit_edge7.us ]
  br label %.lr.ph.us.us.new.preheader

._crit_edge7.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph.us.us.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next23, %._crit_edge.us.us ]
  %2 = add nuw nsw i64 %indvars.iv24, %indvars.iv22
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond28, label %._crit_edge7.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %3 = sub nuw nsw i64 120, %indvars.iv
  %4 = add nuw nsw i64 %2, %3
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv24, i64 %indvars.iv22, i64 %indvars.iv
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv24, i64 %indvars.iv22, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = sub nuw nsw i64 120, %indvars.iv.next
  %10 = add nuw nsw i64 %2, %9
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %6, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %14, <double 1.000000e+01, double 1.000000e+01>
  %16 = fdiv <2 x double> %15, <double 1.200000e+02, double 1.200000e+02>
  %17 = bitcast double* %7 to <2 x double>*
  %18 = bitcast double* %8 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  store <2 x double> %16, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge13:                                    ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.lr.ph13.preheader

.lr.ph13.preheader:                               ; preds = %._crit_edge26, %2
  %.0527 = phi i32 [ 1, %2 ], [ %145, %._crit_edge26 ]
  br label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %._crit_edge10, %.lr.ph13.preheader
  %indvars.iv32 = phi i64 [ 1, %.lr.ph13.preheader ], [ %3, %._crit_edge10 ]
  %3 = add nuw nsw i64 %indvars.iv32, 1
  %4 = add nsw i64 %indvars.iv32, -1
  br label %vector.memcheck89

vector.memcheck89:                                ; preds = %._crit_edge.us.vector.memcheck89_crit_edge, %.lr.ph9.split.us.preheader
  %indvar75 = phi i64 [ %indvar.next76, %._crit_edge.us.vector.memcheck89_crit_edge ], [ 0, %.lr.ph9.split.us.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge.us.vector.memcheck89_crit_edge ], [ 1, %.lr.ph9.split.us.preheader ]
  %5 = add nuw nsw i64 %indvar75, 1
  %scevgep77 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %5, i64 1
  %scevgep79 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %5, i64 119
  %6 = add nsw i64 %indvar75, -118
  %scevgep81 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %6, i64 -119
  %scevgep83 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %5, i64 119
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %7 = add nsw i64 %indvars.iv49, -1
  %bound085 = icmp ult double* %scevgep77, %scevgep83
  %bound186 = icmp ult double* %scevgep81, %scevgep79
  %memcheck.conflict88 = and i1 %bound085, %bound186
  br i1 %memcheck.conflict88, label %vector.memcheck89.scalar.ph72_crit_edge, label %vector.memcheck89.vector.body70_crit_edge

vector.memcheck89.vector.body70_crit_edge:        ; preds = %vector.memcheck89
  br label %vector.body70

vector.memcheck89.scalar.ph72_crit_edge:          ; preds = %vector.memcheck89
  br label %scalar.ph72

vector.body70:                                    ; preds = %vector.body70, %vector.memcheck89.vector.body70_crit_edge
  %index91 = phi i64 [ 0, %vector.memcheck89.vector.body70_crit_edge ], [ %index.next92, %vector.body70 ]
  %offset.idx95 = or i64 %index91, 1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv49, i64 %offset.idx95
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv49, i64 %offset.idx95
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fmul <2 x double> %wide.load100, <double 2.000000e+00, double 2.000000e+00>
  %13 = fsub <2 x double> %wide.load99, %12
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv49, i64 %offset.idx95
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %13, %wide.load101
  %17 = fmul <2 x double> %16, <double 1.250000e-01, double 1.250000e-01>
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv.next50, i64 %offset.idx95
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fsub <2 x double> %wide.load102, %12
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %7, i64 %offset.idx95
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %20, %wide.load103
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = fadd <2 x double> %17, %24
  %26 = add nuw nsw i64 %offset.idx95, 1
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv49, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fsub <2 x double> %wide.load104, %12
  %30 = add nsw i64 %offset.idx95, -1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv49, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %29, %wide.load105
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %25, %34
  %36 = fadd <2 x double> %35, %wide.load100
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %indvars.iv49, i64 %offset.idx95
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next92 = add nuw nsw i64 %index91, 2
  %39 = icmp eq i64 %index.next92, 118
  br i1 %39, label %._crit_edge.us.loopexit2, label %vector.body70, !llvm.loop !6

scalar.ph72:                                      ; preds = %scalar.ph72, %vector.memcheck89.scalar.ph72_crit_edge
  %indvars.iv = phi i64 [ 1, %vector.memcheck89.scalar.ph72_crit_edge ], [ %indvars.iv.next, %scalar.ph72 ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv49, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv49, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, 2.000000e+00
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv49, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv.next50, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %44, i32 0
  %50 = insertelement <2 x double> %49, double %44, i32 1
  %51 = insertelement <2 x double> undef, double %41, i32 0
  %52 = insertelement <2 x double> %51, double %48, i32 1
  %53 = fsub <2 x double> %52, %50
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %7, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %46, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = fadd <2 x double> %53, %57
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %62 = fadd double %60, %61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv49, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fsub double %64, %44
  %66 = add nsw i64 %indvars.iv, -1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv32, i64 %indvars.iv49, i64 %66
  %68 = load double, double* %67, align 8
  %69 = fadd double %65, %68
  %70 = fmul double %69, 1.250000e-01
  %71 = fadd double %62, %70
  %72 = fadd double %71, %43
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %indvars.iv49, i64 %indvars.iv
  store double %72, double* %73, align 8
  %exitcond46 = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond46, label %._crit_edge.us.loopexit, label %scalar.ph72, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph72
  br label %._crit_edge.us

._crit_edge.us.loopexit2:                         ; preds = %vector.body70
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit2, %._crit_edge.us.loopexit
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 119
  br i1 %exitcond51, label %._crit_edge10, label %._crit_edge.us.vector.memcheck89_crit_edge

._crit_edge.us.vector.memcheck89_crit_edge:       ; preds = %._crit_edge.us
  %indvar.next76 = add nuw nsw i64 %indvar75, 1
  br label %vector.memcheck89

._crit_edge10:                                    ; preds = %._crit_edge.us
  %exitcond = icmp eq i64 %3, 119
  br i1 %exitcond, label %._crit_edge10..lr.ph21.split.us.preheader_crit_edge, label %.lr.ph9.split.us.preheader

._crit_edge10..lr.ph21.split.us.preheader_crit_edge: ; preds = %._crit_edge10
  br label %.lr.ph21.split.us.preheader

.lr.ph21.split.us.preheader:                      ; preds = %._crit_edge22, %._crit_edge10..lr.ph21.split.us.preheader_crit_edge
  %indvars.iv41 = phi i64 [ 1, %._crit_edge10..lr.ph21.split.us.preheader_crit_edge ], [ %74, %._crit_edge22 ]
  %74 = add nuw nsw i64 %indvars.iv41, 1
  %75 = add nsw i64 %indvars.iv41, -1
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge18.us.vector.memcheck_crit_edge, %.lr.ph21.split.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge18.us.vector.memcheck_crit_edge ], [ 0, %.lr.ph21.split.us.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge18.us.vector.memcheck_crit_edge ], [ 1, %.lr.ph21.split.us.preheader ]
  %76 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv41, i64 %76, i64 1
  %scevgep58 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv41, i64 %76, i64 119
  %77 = add nsw i64 %indvar, -118
  %scevgep60 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %77, i64 -119
  %scevgep62 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %76, i64 119
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %78 = add nsw i64 %indvars.iv52, -1
  %bound0 = icmp ult double* %scevgep, %scevgep62
  %bound1 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.scalar.ph_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.scalar.ph_crit_edge:              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ 0, %vector.memcheck.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %offset.idx = or i64 %index, 1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %indvars.iv52, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv52, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fmul <2 x double> %wide.load64, <double 2.000000e+00, double 2.000000e+00>
  %84 = fsub <2 x double> %wide.load, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %indvars.iv52, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %84, %wide.load65
  %88 = fmul <2 x double> %87, <double 1.250000e-01, double 1.250000e-01>
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv.next53, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fsub <2 x double> %wide.load66, %83
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %78, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %91, %wide.load67
  %95 = fmul <2 x double> %94, <double 1.250000e-01, double 1.250000e-01>
  %96 = fadd <2 x double> %88, %95
  %97 = add nuw nsw i64 %offset.idx, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv52, i64 %97
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fsub <2 x double> %wide.load68, %83
  %101 = add nsw i64 %offset.idx, -1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv52, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fadd <2 x double> %100, %wide.load69
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = fadd <2 x double> %96, %105
  %107 = fadd <2 x double> %106, %wide.load64
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv41, i64 %indvars.iv52, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %110 = icmp eq i64 %index.next, 118
  br i1 %110, label %._crit_edge18.us.loopexit1, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph, %vector.memcheck.scalar.ph_crit_edge
  %indvars.iv37 = phi i64 [ 1, %vector.memcheck.scalar.ph_crit_edge ], [ %indvars.iv.next38, %scalar.ph ]
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %indvars.iv52, i64 %indvars.iv37
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv52, i64 %indvars.iv37
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, 2.000000e+00
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %indvars.iv52, i64 %indvars.iv37
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv.next53, i64 %indvars.iv37
  %119 = load double, double* %118, align 8
  %120 = insertelement <2 x double> undef, double %115, i32 0
  %121 = insertelement <2 x double> %120, double %115, i32 1
  %122 = insertelement <2 x double> undef, double %112, i32 0
  %123 = insertelement <2 x double> %122, double %119, i32 1
  %124 = fsub <2 x double> %123, %121
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %78, i64 %indvars.iv37
  %126 = load double, double* %125, align 8
  %127 = insertelement <2 x double> undef, double %117, i32 0
  %128 = insertelement <2 x double> %127, double %126, i32 1
  %129 = fadd <2 x double> %124, %128
  %130 = fmul <2 x double> %129, <double 1.250000e-01, double 1.250000e-01>
  %131 = extractelement <2 x double> %130, i32 0
  %132 = extractelement <2 x double> %130, i32 1
  %133 = fadd double %131, %132
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv52, i64 %indvars.iv.next38
  %135 = load double, double* %134, align 8
  %136 = fsub double %135, %115
  %137 = add nsw i64 %indvars.iv37, -1
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv52, i64 %137
  %139 = load double, double* %138, align 8
  %140 = fadd double %136, %139
  %141 = fmul double %140, 1.250000e-01
  %142 = fadd double %133, %141
  %143 = fadd double %142, %114
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv41, i64 %indvars.iv52, i64 %indvars.iv37
  store double %143, double* %144, align 8
  %exitcond47 = icmp eq i64 %indvars.iv.next38, 119
  br i1 %exitcond47, label %._crit_edge18.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge18.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge18.us

._crit_edge18.us.loopexit1:                       ; preds = %vector.body
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit1, %._crit_edge18.us.loopexit
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 119
  br i1 %exitcond55, label %._crit_edge22, label %._crit_edge18.us.vector.memcheck_crit_edge

._crit_edge18.us.vector.memcheck_crit_edge:       ; preds = %._crit_edge18.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %vector.memcheck

._crit_edge22:                                    ; preds = %._crit_edge18.us
  %exitcond48 = icmp eq i64 %74, 119
  br i1 %exitcond48, label %._crit_edge26, label %.lr.ph21.split.us.preheader

._crit_edge26:                                    ; preds = %._crit_edge22
  %145 = add nuw nsw i32 %.0527, 1
  %exitcond45 = icmp eq i32 %145, 501
  br i1 %exitcond45, label %146, label %.lr.ph13.preheader

; <label>:146:                                    ; preds = %._crit_edge26
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.lr.ph10:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge7.us, %.lr.ph10
  %indvars.iv23 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next24, %._crit_edge7.us ]
  %5 = mul nuw nsw i64 %indvars.iv23, 120
  br label %.lr.ph.us.us

._crit_edge7.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond, label %._crit_edge11, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv21 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next22, %._crit_edge.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv21
  %7 = mul nuw nsw i64 %6, 120
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond27, label %._crit_edge7.us, label %.lr.ph.us.us

; <label>:8:                                      ; preds = %15, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv23, i64 %indvars.iv21, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond20, label %._crit_edge.us.us, label %8

._crit_edge11:                                    ; preds = %._crit_edge7.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
