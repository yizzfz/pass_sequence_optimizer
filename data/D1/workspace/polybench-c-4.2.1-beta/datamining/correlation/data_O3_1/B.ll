; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %17, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %17 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.200000e+03
  %9 = fadd double %4, %8
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.200000e+03
  %15 = fadd double %4, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %15, double* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph52, label %.preheader7

.lr.ph52:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph52.split.us.preheader, label %.lr.ph52.split.preheader

.lr.ph52.split.preheader:                         ; preds = %.lr.ph52
  %10 = fdiv double 0.000000e+00, %2
  %wide.trip.count112 = zext i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph52.split.preheader132, label %min.iters.checked

.lr.ph52.split.preheader132:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph52.split.preheader
  %indvars.iv110.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph52.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph52.split

min.iters.checked:                                ; preds = %.lr.ph52.split.preheader
  %11 = and i32 %0, 3
  %n.mod.vf = zext i32 %11 to i64
  %n.vec = sub nsw i64 %wide.trip.count112, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph52.split.preheader132, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert128 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat129 = shufflevector <2 x double> %broadcast.splatinsert128, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %12 = getelementptr inbounds double, double* %5, i64 %index
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> %broadcast.splat129, <2 x double>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %broadcast.splat129, <2 x double>* %15, align 8
  %index.next = add i64 %index, 4
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %11, 0
  br i1 %cmp.n, label %.preheader8, label %.lr.ph52.split.preheader132

.lr.ph52.split.us.preheader:                      ; preds = %.lr.ph52
  %wide.trip.count104 = zext i32 %1 to i64
  %wide.trip.count108 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count104, -1
  %xtraiter144 = and i64 %wide.trip.count104, 3
  %lcmp.mod145 = icmp eq i64 %xtraiter144, 0
  %18 = icmp ult i64 %17, 3
  br label %.lr.ph52.split.us

.lr.ph52.split.us:                                ; preds = %.lr.ph52.split.us.preheader, %._crit_edge48.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge48.us ], [ 0, %.lr.ph52.split.us.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv106
  store double 0.000000e+00, double* %19, align 8
  br i1 %lcmp.mod145, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph52.split.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol, %._crit_edge.prol.preheader
  %indvars.iv102.prol = phi i64 [ 0, %._crit_edge.prol.preheader ], [ %indvars.iv.next103.prol, %._crit_edge.prol ]
  %20 = phi double [ 0.000000e+00, %._crit_edge.prol.preheader ], [ %23, %._crit_edge.prol ]
  %prol.iter146 = phi i64 [ %xtraiter144, %._crit_edge.prol.preheader ], [ %prol.iter146.sub, %._crit_edge.prol ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv102.prol, i64 %indvars.iv106
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  store double %23, double* %19, align 8
  %indvars.iv.next103.prol = add nuw nsw i64 %indvars.iv102.prol, 1
  %prol.iter146.sub = add i64 %prol.iter146, -1
  %prol.iter146.cmp = icmp eq i64 %prol.iter146.sub, 0
  br i1 %prol.iter146.cmp, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol, !llvm.loop !4

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph52.split.us, %._crit_edge.prol.loopexit.unr-lcssa
  %.lcssa135.unr = phi double [ undef, %.lr.ph52.split.us ], [ %23, %._crit_edge.prol.loopexit.unr-lcssa ]
  %indvars.iv102.unr = phi i64 [ 0, %.lr.ph52.split.us ], [ %indvars.iv.next103.prol, %._crit_edge.prol.loopexit.unr-lcssa ]
  %.unr147 = phi double [ 0.000000e+00, %.lr.ph52.split.us ], [ %23, %._crit_edge.prol.loopexit.unr-lcssa ]
  br i1 %18, label %._crit_edge48.us, label %.lr.ph52.split.us.new

.lr.ph52.split.us.new:                            ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph52.split.us.new
  %indvars.iv102 = phi i64 [ %indvars.iv102.unr, %.lr.ph52.split.us.new ], [ %indvars.iv.next103.3, %._crit_edge ]
  %24 = phi double [ %.unr147, %.lr.ph52.split.us.new ], [ %36, %._crit_edge ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv102, i64 %indvars.iv106
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  store double %27, double* %19, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next103, i64 %indvars.iv106
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  store double %30, double* %19, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next103.1, i64 %indvars.iv106
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  store double %33, double* %19, align 8
  %indvars.iv.next103.2 = add nsw i64 %indvars.iv102, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next103.2, i64 %indvars.iv106
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  store double %36, double* %19, align 8
  %indvars.iv.next103.3 = add nsw i64 %indvars.iv102, 4
  %exitcond105.3 = icmp eq i64 %indvars.iv.next103.3, %wide.trip.count104
  br i1 %exitcond105.3, label %._crit_edge48.us.unr-lcssa, label %._crit_edge

._crit_edge48.us.unr-lcssa:                       ; preds = %._crit_edge
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge.prol.loopexit, %._crit_edge48.us.unr-lcssa
  %.lcssa135 = phi double [ %.lcssa135.unr, %._crit_edge.prol.loopexit ], [ %36, %._crit_edge48.us.unr-lcssa ]
  %37 = fdiv double %.lcssa135, %2
  store double %37, double* %19, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, %wide.trip.count108
  br i1 %exitcond109, label %.preheader8.loopexit, label %.lr.ph52.split.us

.preheader8.loopexit:                             ; preds = %._crit_edge48.us
  br label %.preheader8

.preheader8.loopexit133:                          ; preds = %.lr.ph52.split
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit133, %.preheader8.loopexit, %middle.block
  br i1 true, label %.lr.ph44, label %.preheader8..preheader7_crit_edge

.preheader8..preheader7_crit_edge:                ; preds = %.preheader8
  br label %.preheader7

.lr.ph44:                                         ; preds = %.preheader8
  br i1 %9, label %.lr.ph44.split.us.preheader, label %.lr.ph44.split.preheader

.lr.ph44.split.preheader:                         ; preds = %.lr.ph44
  %38 = fdiv double 0.000000e+00, %2
  %wide.trip.count100 = zext i32 %0 to i64
  %39 = add nsw i64 %wide.trip.count100, -1
  %xtraiter141 = and i64 %wide.trip.count100, 3
  %lcmp.mod142 = icmp eq i64 %xtraiter141, 0
  br i1 %lcmp.mod142, label %.lr.ph44.split.prol.loopexit, label %.lr.ph44.split.prol.preheader

.lr.ph44.split.prol.preheader:                    ; preds = %.lr.ph44.split.preheader
  br label %.lr.ph44.split.prol

.lr.ph44.split.prol:                              ; preds = %.lr.ph44.split.prol, %.lr.ph44.split.prol.preheader
  %indvars.iv98.prol = phi i64 [ %indvars.iv.next99.prol, %.lr.ph44.split.prol ], [ 0, %.lr.ph44.split.prol.preheader ]
  %prol.iter143 = phi i64 [ %prol.iter143.sub, %.lr.ph44.split.prol ], [ %xtraiter141, %.lr.ph44.split.prol.preheader ]
  %40 = getelementptr inbounds double, double* %6, i64 %indvars.iv98.prol
  store double %38, double* %40, align 8
  %41 = tail call double @sqrt(double %38) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %40, align 8
  %indvars.iv.next99.prol = add nuw nsw i64 %indvars.iv98.prol, 1
  %prol.iter143.sub = add i64 %prol.iter143, -1
  %prol.iter143.cmp = icmp eq i64 %prol.iter143.sub, 0
  br i1 %prol.iter143.cmp, label %.lr.ph44.split.prol.loopexit.unr-lcssa, label %.lr.ph44.split.prol, !llvm.loop !6

.lr.ph44.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph44.split.prol
  br label %.lr.ph44.split.prol.loopexit

.lr.ph44.split.prol.loopexit:                     ; preds = %.lr.ph44.split.preheader, %.lr.ph44.split.prol.loopexit.unr-lcssa
  %indvars.iv98.unr = phi i64 [ 0, %.lr.ph44.split.preheader ], [ %indvars.iv.next99.prol, %.lr.ph44.split.prol.loopexit.unr-lcssa ]
  %44 = icmp ult i64 %39, 3
  br i1 %44, label %.preheader7.loopexit131, label %.lr.ph44.split.preheader.new

.lr.ph44.split.preheader.new:                     ; preds = %.lr.ph44.split.prol.loopexit
  br label %.lr.ph44.split

.lr.ph44.split.us.preheader:                      ; preds = %.lr.ph44
  %wide.trip.count92 = zext i32 %1 to i64
  %wide.trip.count96 = zext i32 %0 to i64
  %xtraiter138 = and i64 %wide.trip.count92, 1
  %lcmp.mod139 = icmp eq i64 %xtraiter138, 0
  %45 = icmp eq i32 %1, 1
  br label %.lr.ph44.split.us

.lr.ph44.split.us:                                ; preds = %.lr.ph44.split.us.preheader, %._crit_edge41.us
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge41.us ], [ 0, %.lr.ph44.split.us.preheader ]
  %46 = getelementptr inbounds double, double* %6, i64 %indvars.iv94
  store double 0.000000e+00, double* %46, align 8
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv94
  br i1 %lcmp.mod139, label %._crit_edge114.prol.loopexit.unr-lcssa, label %._crit_edge114.prol.preheader

._crit_edge114.prol.preheader:                    ; preds = %.lr.ph44.split.us
  br label %._crit_edge114.prol

._crit_edge114.prol:                              ; preds = %._crit_edge114.prol.preheader
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv94
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fsub double %49, %50
  %52 = fmul double %51, %51
  %53 = fadd double %52, 0.000000e+00
  store double %53, double* %46, align 8
  br label %._crit_edge114.prol.loopexit.unr-lcssa

._crit_edge114.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph44.split.us, %._crit_edge114.prol
  %.lcssa134.unr.ph = phi double [ %53, %._crit_edge114.prol ], [ undef, %.lr.ph44.split.us ]
  %indvars.iv90.unr.ph = phi i64 [ 1, %._crit_edge114.prol ], [ 0, %.lr.ph44.split.us ]
  %.unr140.ph = phi double [ %53, %._crit_edge114.prol ], [ 0.000000e+00, %.lr.ph44.split.us ]
  br label %._crit_edge114.prol.loopexit

._crit_edge114.prol.loopexit:                     ; preds = %._crit_edge114.prol.loopexit.unr-lcssa
  br i1 %45, label %._crit_edge41.us, label %.lr.ph44.split.us.new

.lr.ph44.split.us.new:                            ; preds = %._crit_edge114.prol.loopexit
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114, %.lr.ph44.split.us.new
  %indvars.iv90 = phi i64 [ %indvars.iv90.unr.ph, %.lr.ph44.split.us.new ], [ %indvars.iv.next91.1, %._crit_edge114 ]
  %54 = phi double [ %.unr140.ph, %.lr.ph44.split.us.new ], [ %66, %._crit_edge114 ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv90, i64 %indvars.iv94
  %56 = load double, double* %55, align 8
  %57 = load double, double* %47, align 8
  %58 = fsub double %56, %57
  %59 = fmul double %58, %58
  %60 = fadd double %54, %59
  store double %60, double* %46, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next91, i64 %indvars.iv94
  %62 = load double, double* %61, align 8
  %63 = load double, double* %47, align 8
  %64 = fsub double %62, %63
  %65 = fmul double %64, %64
  %66 = fadd double %60, %65
  store double %66, double* %46, align 8
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %wide.trip.count92
  br i1 %exitcond93.1, label %._crit_edge41.us.unr-lcssa, label %._crit_edge114

._crit_edge41.us.unr-lcssa:                       ; preds = %._crit_edge114
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge114.prol.loopexit, %._crit_edge41.us.unr-lcssa
  %.lcssa134 = phi double [ %.lcssa134.unr.ph, %._crit_edge114.prol.loopexit ], [ %66, %._crit_edge41.us.unr-lcssa ]
  %67 = fdiv double %.lcssa134, %2
  store double %67, double* %46, align 8
  %68 = tail call double @sqrt(double %67) #4
  %69 = fcmp ugt double %68, 1.000000e-01
  %70 = select i1 %69, double %68, double 1.000000e+00
  store double %70, double* %46, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  br i1 %exitcond97, label %.preheader7.loopexit, label %.lr.ph44.split.us

.lr.ph52.split:                                   ; preds = %.lr.ph52.split.preheader132, %.lr.ph52.split
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %.lr.ph52.split ], [ %indvars.iv110.ph, %.lr.ph52.split.preheader132 ]
  %71 = getelementptr inbounds double, double* %5, i64 %indvars.iv110
  store double %10, double* %71, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, %wide.trip.count112
  br i1 %exitcond113, label %.preheader8.loopexit133, label %.lr.ph52.split, !llvm.loop !7

.preheader7.loopexit:                             ; preds = %._crit_edge41.us
  br label %.preheader7

.preheader7.loopexit131.unr-lcssa:                ; preds = %.lr.ph44.split
  br label %.preheader7.loopexit131

.preheader7.loopexit131:                          ; preds = %.lr.ph44.split.prol.loopexit, %.preheader7.loopexit131.unr-lcssa
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader8..preheader7_crit_edge, %.preheader7.loopexit131, %.preheader7.loopexit, %7
  %72 = icmp sgt i32 %1, 0
  br i1 %72, label %.preheader6.lr.ph, label %.preheader

.preheader6.lr.ph:                                ; preds = %.preheader7
  br i1 %8, label %.preheader6.us.preheader, label %.preheader.thread

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count83 = zext i32 %0 to i64
  %wide.trip.count87 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader.thread:                                ; preds = %.preheader6.lr.ph
  %73 = add nsw i32 %0, -1
  br label %._crit_edge24

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge36.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge36.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115, %.preheader6.us
  %indvars.iv81 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next82, %._crit_edge115 ]
  %74 = getelementptr inbounds double, double* %5, i64 %indvars.iv81
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv85, i64 %indvars.iv81
  %77 = load double, double* %76, align 8
  %78 = fsub double %77, %75
  store double %78, double* %76, align 8
  %79 = tail call double @sqrt(double %2) #4
  %80 = getelementptr inbounds double, double* %6, i64 %indvars.iv81
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = load double, double* %76, align 8
  %84 = fdiv double %83, %82
  store double %84, double* %76, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, %wide.trip.count83
  br i1 %exitcond84, label %._crit_edge36.us, label %._crit_edge115

._crit_edge36.us:                                 ; preds = %._crit_edge115
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %.preheader.loopexit, label %.preheader6.us

.lr.ph44.split:                                   ; preds = %.lr.ph44.split, %.lr.ph44.split.preheader.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr, %.lr.ph44.split.preheader.new ], [ %indvars.iv.next99.3, %.lr.ph44.split ]
  %85 = getelementptr inbounds double, double* %6, i64 %indvars.iv98
  store double %38, double* %85, align 8
  %86 = tail call double @sqrt(double %38) #4
  %87 = fcmp ugt double %86, 1.000000e-01
  %88 = select i1 %87, double %86, double 1.000000e+00
  store double %88, double* %85, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %89 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next99
  store double %38, double* %89, align 8
  %90 = tail call double @sqrt(double %38) #4
  %91 = fcmp ugt double %90, 1.000000e-01
  %92 = select i1 %91, double %90, double 1.000000e+00
  store double %92, double* %89, align 8
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %93 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next99.1
  store double %38, double* %93, align 8
  %94 = tail call double @sqrt(double %38) #4
  %95 = fcmp ugt double %94, 1.000000e-01
  %96 = select i1 %95, double %94, double 1.000000e+00
  store double %96, double* %93, align 8
  %indvars.iv.next99.2 = add nsw i64 %indvars.iv98, 3
  %97 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next99.2
  store double %38, double* %97, align 8
  %98 = tail call double @sqrt(double %38) #4
  %99 = fcmp ugt double %98, 1.000000e-01
  %100 = select i1 %99, double %98, double 1.000000e+00
  store double %100, double* %97, align 8
  %indvars.iv.next99.3 = add nsw i64 %indvars.iv98, 4
  %exitcond101.3 = icmp eq i64 %indvars.iv.next99.3, %wide.trip.count100
  br i1 %exitcond101.3, label %.preheader7.loopexit131.unr-lcssa, label %.lr.ph44.split

.preheader.loopexit:                              ; preds = %._crit_edge36.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader7
  %101 = add nsw i32 %0, -1
  %102 = icmp sgt i32 %0, 1
  br i1 %102, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %.preheader
  %103 = sext i32 %0 to i64
  %wide.trip.count68 = zext i32 %101 to i64
  br i1 %72, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %wide.trip.count74 = zext i32 %0 to i64
  %104 = add nuw nsw i64 %wide.trip.count74, 3
  %105 = add nsw i64 %wide.trip.count74, -2
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count63 = zext i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %106 = icmp eq i32 %1, 1
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %._crit_edge21.us-lcssa.us.us, %.lr.ph23.split.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next67, %._crit_edge21.us-lcssa.us.us ]
  %indvars.iv59 = phi i64 [ 1, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next60, %._crit_edge21.us-lcssa.us.us ]
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv66
  store double 1.000000e+00, double* %107, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %108 = icmp slt i64 %indvars.iv.next67, %103
  br i1 %108, label %.lr.ph.us.us.preheader, label %._crit_edge21.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph23.split.us
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv66
  br label %.lr.ph.us.us

._crit_edge21.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge21.us-lcssa.us.us

._crit_edge21.us-lcssa.us.us:                     ; preds = %._crit_edge21.us-lcssa.us.us.loopexit, %.lr.ph23.split.us
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  br i1 %exitcond69, label %._crit_edge24.loopexit, label %.lr.ph23.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us.us ], [ %indvars.iv59, %.lr.ph.us.us.preheader ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv61
  store double 0.000000e+00, double* %110, align 8
  br i1 %lcmp.mod, label %._crit_edge116.prol.loopexit.unr-lcssa, label %._crit_edge116.prol.preheader

._crit_edge116.prol.preheader:                    ; preds = %.lr.ph.us.us
  br label %._crit_edge116.prol

._crit_edge116.prol:                              ; preds = %._crit_edge116.prol.preheader
  %111 = load double, double* %109, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv61
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fadd double %114, 0.000000e+00
  store double %115, double* %110, align 8
  br label %._crit_edge116.prol.loopexit.unr-lcssa

._crit_edge116.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph.us.us, %._crit_edge116.prol
  %.lcssa.unr.ph = phi double [ %115, %._crit_edge116.prol ], [ undef, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge116.prol ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %115, %._crit_edge116.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  br label %._crit_edge116.prol.loopexit

._crit_edge116.prol.loopexit:                     ; preds = %._crit_edge116.prol.loopexit.unr-lcssa
  br i1 %106, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge116.prol.loopexit
  br label %._crit_edge116

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge116
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge116.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge116.prol.loopexit ], [ %129, %._crit_edge.us.us.unr-lcssa ]
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv66
  store double %.lcssa, double* %116, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge21.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

._crit_edge116:                                   ; preds = %._crit_edge116, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next.1, %._crit_edge116 ]
  %117 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %129, %._crit_edge116 ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv66
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv61
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fadd double %117, %122
  store double %123, double* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv66
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv61
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fadd double %123, %128
  store double %129, double* %110, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge116

.lr.ph23.split:                                   ; preds = %._crit_edge21, %.lr.ph23.split.preheader
  %indvars.iv77 = phi i64 [ 0, %.lr.ph23.split.preheader ], [ %indvars.iv.next78, %._crit_edge21 ]
  %indvars.iv70 = phi i64 [ 1, %.lr.ph23.split.preheader ], [ %indvars.iv.next71, %._crit_edge21 ]
  %130 = sub i64 %105, %indvars.iv77
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv77
  store double 1.000000e+00, double* %131, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %132 = icmp slt i64 %indvars.iv.next78, %103
  br i1 %132, label %.lr.ph20.split.preheader, label %._crit_edge21

.lr.ph20.split.preheader:                         ; preds = %.lr.ph23.split
  %133 = sub i64 %104, %indvars.iv77
  %xtraiter136 = and i64 %133, 3
  %lcmp.mod137 = icmp eq i64 %xtraiter136, 0
  br i1 %lcmp.mod137, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %.lr.ph20.split.prol ], [ %indvars.iv70, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter136, %.lr.ph20.split.prol.preheader ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv72.prol
  store double 0.000000e+00, double* %134, align 8
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72.prol, i64 %indvars.iv77
  %136 = bitcast double* %135 to i64*
  store i64 0, i64* %136, align 8
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !9

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv72.unr = phi i64 [ %indvars.iv70, %.lr.ph20.split.preheader ], [ %indvars.iv.next73.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  %137 = icmp ult i64 %130, 3
  br i1 %137, label %._crit_edge21.loopexit, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next73.3, %.lr.ph20.split ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv72
  store double 0.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv77
  %140 = bitcast double* %139 to i64*
  store i64 0, i64* %140, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv.next73
  store double 0.000000e+00, double* %141, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next73, i64 %indvars.iv77
  %143 = bitcast double* %142 to i64*
  store i64 0, i64* %143, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv.next73.1
  store double 0.000000e+00, double* %144, align 8
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next73.1, i64 %indvars.iv77
  %146 = bitcast double* %145 to i64*
  store i64 0, i64* %146, align 8
  %indvars.iv.next73.2 = add nsw i64 %indvars.iv72, 3
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv.next73.2
  store double 0.000000e+00, double* %147, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next73.2, i64 %indvars.iv77
  %149 = bitcast double* %148 to i64*
  store i64 0, i64* %149, align 8
  %indvars.iv.next73.3 = add nsw i64 %indvars.iv72, 4
  %exitcond75.3 = icmp eq i64 %indvars.iv.next73.3, %wide.trip.count74
  br i1 %exitcond75.3, label %._crit_edge21.loopexit.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit.unr-lcssa:                 ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit

._crit_edge21.loopexit:                           ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.lr.ph23.split
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count68
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  br i1 %exitcond80, label %._crit_edge24.loopexit130, label %.lr.ph23.split

._crit_edge24.loopexit:                           ; preds = %._crit_edge21.us-lcssa.us.us
  br label %._crit_edge24

._crit_edge24.loopexit130:                        ; preds = %._crit_edge21
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit130, %._crit_edge24.loopexit, %.preheader, %.preheader.thread
  %150 = phi i32 [ %73, %.preheader.thread ], [ %101, %.preheader ], [ %101, %._crit_edge24.loopexit ], [ %101, %._crit_edge24.loopexit130 ]
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %151, i64 %151
  store double 1.000000e+00, double* %152, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !8, !2, !3}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !5}
