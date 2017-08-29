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
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2, %19
  %.0911 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %.0911 to double
  %4 = sext i32 %.0911 to i64
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %20 = add nsw i32 %.0911, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph151, label %._crit_edge109.._crit_edge110_crit_edge

.lr.ph151:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph151.split.us.preheader, label %.lr.ph151.split.preheader

.lr.ph151.split.us.preheader:                     ; preds = %.lr.ph151
  %xtraiter221 = and i32 %1, 1
  %lcmp.mod222 = icmp eq i32 %xtraiter221, 0
  %10 = icmp eq i32 %1, 1
  %sunkaddr161 = ptrtoint double* %5 to i64
  %wide.trip.count217.1 = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count217.1, -2
  br label %.lr.ph151.split.us

.lr.ph151.split.preheader:                        ; preds = %.lr.ph151
  %12 = add i32 %0, -1
  %xtraiter228 = and i32 %0, 3
  %lcmp.mod229 = icmp eq i32 %xtraiter228, 0
  br i1 %lcmp.mod229, label %.lr.ph151.split.prol.loopexit, label %.lr.ph151.split.prol.preheader

.lr.ph151.split.prol.preheader:                   ; preds = %.lr.ph151.split.preheader
  %13 = fdiv double 0.000000e+00, %2
  br label %.lr.ph151.split.prol

.lr.ph151.split.prol:                             ; preds = %.lr.ph151.split.prol.preheader, %.lr.ph151.split.prol
  %indvars.iv224.prol = phi i64 [ %indvars.iv.next225.prol, %.lr.ph151.split.prol ], [ 0, %.lr.ph151.split.prol.preheader ]
  %prol.iter230 = phi i32 [ %prol.iter230.sub, %.lr.ph151.split.prol ], [ %xtraiter228, %.lr.ph151.split.prol.preheader ]
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv224.prol
  store double %13, double* %14, align 8
  %indvars.iv.next225.prol = add nuw nsw i64 %indvars.iv224.prol, 1
  %prol.iter230.sub = add i32 %prol.iter230, -1
  %prol.iter230.cmp = icmp eq i32 %prol.iter230.sub, 0
  br i1 %prol.iter230.cmp, label %.lr.ph151.split.prol.loopexit.loopexit, label %.lr.ph151.split.prol, !llvm.loop !1

.lr.ph151.split.prol.loopexit.loopexit:           ; preds = %.lr.ph151.split.prol
  br label %.lr.ph151.split.prol.loopexit

.lr.ph151.split.prol.loopexit:                    ; preds = %.lr.ph151.split.prol.loopexit.loopexit, %.lr.ph151.split.preheader
  %indvars.iv224.unr = phi i64 [ 0, %.lr.ph151.split.preheader ], [ %indvars.iv.next225.prol, %.lr.ph151.split.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %12, 3
  br i1 %15, label %.lr.ph143, label %.lr.ph151.split.preheader236

.lr.ph151.split.preheader236:                     ; preds = %.lr.ph151.split.prol.loopexit
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count226.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count226.3, -4
  %18 = sub i64 %17, %indvars.iv224.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph151.split.preheader263, label %min.iters.checked

.lr.ph151.split.preheader263:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph151.split.preheader236
  %indvars.iv224.ph = phi i64 [ %indvars.iv224.unr, %min.iters.checked ], [ %indvars.iv224.unr, %.lr.ph151.split.preheader236 ], [ %ind.end, %middle.block ]
  br label %.lr.ph151.split

min.iters.checked:                                ; preds = %.lr.ph151.split.preheader236
  %n.mod.vf = and i64 %20, 3
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = shl nuw i64 %19, 2
  %22 = add i64 %indvars.iv224.unr, %21
  %23 = add i64 %22, 4
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %.lr.ph151.split.preheader263, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert254 = insertelement <2 x double> undef, double %16, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert254, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv224.unr, %25
  %26 = add nsw i64 %offset.idx, 3
  %27 = add i64 %offset.idx, 11
  %28 = getelementptr inbounds double, double* %5, i64 %26
  %29 = getelementptr inbounds double, double* %5, i64 %27
  %30 = getelementptr double, double* %28, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  %32 = getelementptr double, double* %29, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  %index.next = add i64 %index, 4
  %34 = icmp eq i64 %index.next, %n.vec
  br i1 %34, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.lr.ph143, label %.lr.ph151.split.preheader263

.lr.ph151.split.us:                               ; preds = %.lr.ph151.split.us.preheader, %._crit_edge147.us
  %.0100149.us = phi i32 [ %64, %._crit_edge147.us ], [ 0, %.lr.ph151.split.us.preheader ]
  %35 = sext i32 %.0100149.us to i64
  %36 = getelementptr inbounds double, double* %5, i64 %35
  store double 0.000000e+00, double* %36, align 8
  br i1 %lcmp.mod222, label %.lr.ph151.split.us..prol.loopexit220_crit_edge, label %.prol.preheader219

.lr.ph151.split.us..prol.loopexit220_crit_edge:   ; preds = %.lr.ph151.split.us
  %.pre257 = shl nsw i64 %35, 3
  %.pre = add i64 %sunkaddr161, %.pre257
  %.pre258 = inttoptr i64 %.pre to double*
  br label %.prol.loopexit220

.prol.preheader219:                               ; preds = %.lr.ph151.split.us
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %35
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, 0.000000e+00
  %sunkaddr158.prol = shl nsw i64 %35, 3
  %sunkaddr159.prol = add i64 %sunkaddr161, %sunkaddr158.prol
  %sunkaddr160.prol = inttoptr i64 %sunkaddr159.prol to double*
  store double %39, double* %sunkaddr160.prol, align 8
  br label %.prol.loopexit220

.prol.loopexit220:                                ; preds = %.lr.ph151.split.us..prol.loopexit220_crit_edge, %.prol.preheader219
  %.pre242.pre-phi = phi double* [ %.pre258, %.lr.ph151.split.us..prol.loopexit220_crit_edge ], [ %sunkaddr160.prol, %.prol.preheader219 ]
  %indvars.iv215.unr.ph = phi i64 [ 0, %.lr.ph151.split.us..prol.loopexit220_crit_edge ], [ 1, %.prol.preheader219 ]
  %.unr223.ph = phi double [ 0.000000e+00, %.lr.ph151.split.us..prol.loopexit220_crit_edge ], [ %39, %.prol.preheader219 ]
  %.lcssa182.unr.ph = phi double [ undef, %.lr.ph151.split.us..prol.loopexit220_crit_edge ], [ %39, %.prol.preheader219 ]
  br i1 %10, label %._crit_edge147.us, label %.lr.ph151.split.us.new.preheader

.lr.ph151.split.us.new.preheader:                 ; preds = %.prol.loopexit220
  %40 = sub nsw i64 %11, %indvars.iv215.unr.ph
  %41 = lshr i64 %40, 1
  %42 = and i64 %41, 1
  %lcmp.mod269 = icmp eq i64 %42, 0
  br i1 %lcmp.mod269, label %.lr.ph151.split.us.new.prol.preheader, label %.lr.ph151.split.us.new.prol.loopexit.unr-lcssa

.lr.ph151.split.us.new.prol.preheader:            ; preds = %.lr.ph151.split.us.new.preheader
  br label %.lr.ph151.split.us.new.prol

.lr.ph151.split.us.new.prol:                      ; preds = %.lr.ph151.split.us.new.prol.preheader
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv215.unr.ph, i64 %35
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %.unr223.ph
  store double %45, double* %.pre242.pre-phi, align 8
  %indvars.iv.next216.prol = add nuw nsw i64 %indvars.iv215.unr.ph, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next216.prol, i64 %35
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %.pre242.pre-phi, align 8
  %indvars.iv.next216.1.prol = or i64 %indvars.iv215.unr.ph, 2
  br label %.lr.ph151.split.us.new.prol.loopexit.unr-lcssa

.lr.ph151.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph151.split.us.new.preheader, %.lr.ph151.split.us.new.prol
  %.lcssa267.unr.ph = phi double [ %48, %.lr.ph151.split.us.new.prol ], [ undef, %.lr.ph151.split.us.new.preheader ]
  %indvars.iv215.unr.ph270 = phi i64 [ %indvars.iv.next216.1.prol, %.lr.ph151.split.us.new.prol ], [ %indvars.iv215.unr.ph, %.lr.ph151.split.us.new.preheader ]
  %.unr.ph271 = phi double [ %48, %.lr.ph151.split.us.new.prol ], [ %.unr223.ph, %.lr.ph151.split.us.new.preheader ]
  br label %.lr.ph151.split.us.new.prol.loopexit

.lr.ph151.split.us.new.prol.loopexit:             ; preds = %.lr.ph151.split.us.new.prol.loopexit.unr-lcssa
  %49 = icmp eq i64 %41, 0
  br i1 %49, label %._crit_edge147.us.loopexit, label %.lr.ph151.split.us.new.preheader.new

.lr.ph151.split.us.new.preheader.new:             ; preds = %.lr.ph151.split.us.new.prol.loopexit
  br label %.lr.ph151.split.us.new

.lr.ph151.split.us.new:                           ; preds = %.lr.ph151.split.us.new, %.lr.ph151.split.us.new.preheader.new
  %indvars.iv215 = phi i64 [ %indvars.iv215.unr.ph270, %.lr.ph151.split.us.new.preheader.new ], [ %indvars.iv.next216.1.1, %.lr.ph151.split.us.new ]
  %50 = phi double [ %.unr.ph271, %.lr.ph151.split.us.new.preheader.new ], [ %62, %.lr.ph151.split.us.new ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv215, i64 %35
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %.pre242.pre-phi, align 8
  %indvars.iv.next216 = add nuw nsw i64 %indvars.iv215, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next216, i64 %35
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %.pre242.pre-phi, align 8
  %indvars.iv.next216.1 = add nsw i64 %indvars.iv215, 2
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next216.1, i64 %35
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %.pre242.pre-phi, align 8
  %indvars.iv.next216.1272 = add nsw i64 %indvars.iv215, 3
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next216.1272, i64 %35
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %.pre242.pre-phi, align 8
  %indvars.iv.next216.1.1 = add nsw i64 %indvars.iv215, 4
  %exitcond218.1.1 = icmp eq i64 %indvars.iv.next216.1.1, %wide.trip.count217.1
  br i1 %exitcond218.1.1, label %._crit_edge147.us.loopexit.unr-lcssa, label %.lr.ph151.split.us.new

._crit_edge147.us.loopexit.unr-lcssa:             ; preds = %.lr.ph151.split.us.new
  br label %._crit_edge147.us.loopexit

._crit_edge147.us.loopexit:                       ; preds = %.lr.ph151.split.us.new.prol.loopexit, %._crit_edge147.us.loopexit.unr-lcssa
  %.lcssa267 = phi double [ %.lcssa267.unr.ph, %.lr.ph151.split.us.new.prol.loopexit ], [ %62, %._crit_edge147.us.loopexit.unr-lcssa ]
  br label %._crit_edge147.us

._crit_edge147.us:                                ; preds = %._crit_edge147.us.loopexit, %.prol.loopexit220
  %.lcssa182 = phi double [ %.lcssa182.unr.ph, %.prol.loopexit220 ], [ %.lcssa267, %._crit_edge147.us.loopexit ]
  %63 = fdiv double %.lcssa182, %2
  store double %63, double* %.pre242.pre-phi, align 8
  %64 = add nsw i32 %.0100149.us, 1
  %65 = icmp slt i32 %64, %0
  br i1 %65, label %.lr.ph151.split.us, label %.lr.ph143.loopexit

.lr.ph143.loopexit:                               ; preds = %._crit_edge147.us
  br label %.lr.ph143

.lr.ph143.loopexit264:                            ; preds = %.lr.ph151.split
  br label %.lr.ph143

.lr.ph143:                                        ; preds = %.lr.ph143.loopexit264, %.lr.ph143.loopexit, %middle.block, %.lr.ph151.split.prol.loopexit
  br i1 %9, label %.lr.ph143.split.us.preheader, label %.lr.ph143.split.preheader

.lr.ph143.split.us.preheader:                     ; preds = %.lr.ph143
  %xtraiter206 = and i32 %1, 1
  %lcmp.mod207 = icmp eq i32 %xtraiter206, 0
  %66 = icmp eq i32 %1, 1
  %sunkaddr173 = ptrtoint double* %6 to i64
  %sunkaddr165 = ptrtoint double* %5 to i64
  %wide.trip.count202.1 = zext i32 %1 to i64
  br label %.lr.ph143.split.us

.lr.ph143.split.preheader:                        ; preds = %.lr.ph143
  %xtraiter213 = and i32 %0, 1
  %lcmp.mod214 = icmp eq i32 %xtraiter213, 0
  br i1 %lcmp.mod214, label %.lr.ph143.split.prol.loopexit, label %.lr.ph143.split.prol

.lr.ph143.split.prol:                             ; preds = %.lr.ph143.split.preheader
  %67 = fdiv double 0.000000e+00, %2
  store double %67, double* %6, align 8
  %68 = tail call double @sqrt(double %67) #4
  %69 = fcmp ugt double %68, 1.000000e-01
  %70 = select i1 %69, double %68, double 1.000000e+00
  store double %70, double* %6, align 8
  br label %.lr.ph143.split.prol.loopexit

.lr.ph143.split.prol.loopexit:                    ; preds = %.lr.ph143.split.preheader, %.lr.ph143.split.prol
  %indvars.iv209.unr = phi i64 [ 0, %.lr.ph143.split.preheader ], [ 1, %.lr.ph143.split.prol ]
  %71 = icmp eq i32 %0, 1
  br i1 %71, label %._crit_edge109.._crit_edge110_crit_edge, label %.lr.ph143.split.preheader234

.lr.ph143.split.preheader234:                     ; preds = %.lr.ph143.split.prol.loopexit
  %72 = fdiv double 0.000000e+00, %2
  %wide.trip.count211.1 = zext i32 %0 to i64
  br label %.lr.ph143.split

.lr.ph143.split.us:                               ; preds = %.lr.ph143.split.us.preheader, %._crit_edge140.us
  %.1101142.us = phi i32 [ %98, %._crit_edge140.us ], [ 0, %.lr.ph143.split.us.preheader ]
  %73 = sext i32 %.1101142.us to i64
  %74 = getelementptr inbounds double, double* %6, i64 %73
  store double 0.000000e+00, double* %74, align 8
  br i1 %lcmp.mod207, label %.lr.ph143.split.us..prol.loopexit205_crit_edge, label %.prol.preheader204

.lr.ph143.split.us..prol.loopexit205_crit_edge:   ; preds = %.lr.ph143.split.us
  %.pre259 = shl nsw i64 %73, 3
  br label %.prol.loopexit205

.prol.preheader204:                               ; preds = %.lr.ph143.split.us
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %73
  %76 = load double, double* %75, align 8
  %sunkaddr166.prol = shl nsw i64 %73, 3
  %sunkaddr167.prol = add i64 %sunkaddr165, %sunkaddr166.prol
  %sunkaddr168.prol = inttoptr i64 %sunkaddr167.prol to double*
  %77 = load double, double* %sunkaddr168.prol, align 8
  %78 = fsub double %76, %77
  %79 = fmul double %78, %78
  %80 = fadd double %79, 0.000000e+00
  %sunkaddr171.prol = add i64 %sunkaddr173, %sunkaddr166.prol
  %sunkaddr172.prol = inttoptr i64 %sunkaddr171.prol to double*
  store double %80, double* %sunkaddr172.prol, align 8
  br label %.prol.loopexit205

.prol.loopexit205:                                ; preds = %.lr.ph143.split.us..prol.loopexit205_crit_edge, %.prol.preheader204
  %.pre243.pre-phi = phi i64 [ %.pre259, %.lr.ph143.split.us..prol.loopexit205_crit_edge ], [ %sunkaddr166.prol, %.prol.preheader204 ]
  %indvars.iv200.unr.ph = phi i64 [ 0, %.lr.ph143.split.us..prol.loopexit205_crit_edge ], [ 1, %.prol.preheader204 ]
  %.unr208.ph = phi double [ 0.000000e+00, %.lr.ph143.split.us..prol.loopexit205_crit_edge ], [ %80, %.prol.preheader204 ]
  %.lcssa181.unr.ph = phi double [ undef, %.lr.ph143.split.us..prol.loopexit205_crit_edge ], [ %80, %.prol.preheader204 ]
  br i1 %66, label %.prol.loopexit205.._crit_edge140.us_crit_edge, label %.lr.ph143.split.us.new.preheader

.prol.loopexit205.._crit_edge140.us_crit_edge:    ; preds = %.prol.loopexit205
  %.pre244 = add i64 %sunkaddr173, %.pre243.pre-phi
  %.pre245 = inttoptr i64 %.pre244 to double*
  br label %._crit_edge140.us

.lr.ph143.split.us.new.preheader:                 ; preds = %.prol.loopexit205
  %sunkaddr167 = add i64 %sunkaddr165, %.pre243.pre-phi
  %sunkaddr168 = inttoptr i64 %sunkaddr167 to double*
  %sunkaddr171 = add i64 %sunkaddr173, %.pre243.pre-phi
  %sunkaddr172 = inttoptr i64 %sunkaddr171 to double*
  br label %.lr.ph143.split.us.new

.lr.ph143.split.us.new:                           ; preds = %.lr.ph143.split.us.new.preheader, %.lr.ph143.split.us.new
  %indvars.iv200 = phi i64 [ %indvars.iv.next201.1, %.lr.ph143.split.us.new ], [ %indvars.iv200.unr.ph, %.lr.ph143.split.us.new.preheader ]
  %81 = phi double [ %93, %.lr.ph143.split.us.new ], [ %.unr208.ph, %.lr.ph143.split.us.new.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv200, i64 %73
  %83 = load double, double* %82, align 8
  %84 = load double, double* %sunkaddr168, align 8
  %85 = fsub double %83, %84
  %86 = fmul double %85, %85
  %87 = fadd double %81, %86
  store double %87, double* %sunkaddr172, align 8
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next201, i64 %73
  %89 = load double, double* %88, align 8
  %90 = load double, double* %sunkaddr168, align 8
  %91 = fsub double %89, %90
  %92 = fmul double %91, %91
  %93 = fadd double %87, %92
  store double %93, double* %sunkaddr172, align 8
  %indvars.iv.next201.1 = add nsw i64 %indvars.iv200, 2
  %exitcond203.1 = icmp eq i64 %indvars.iv.next201.1, %wide.trip.count202.1
  br i1 %exitcond203.1, label %._crit_edge140.us.loopexit, label %.lr.ph143.split.us.new

._crit_edge140.us.loopexit:                       ; preds = %.lr.ph143.split.us.new
  br label %._crit_edge140.us

._crit_edge140.us:                                ; preds = %._crit_edge140.us.loopexit, %.prol.loopexit205.._crit_edge140.us_crit_edge
  %sunkaddr176.pre-phi = phi double* [ %.pre245, %.prol.loopexit205.._crit_edge140.us_crit_edge ], [ %sunkaddr172, %._crit_edge140.us.loopexit ]
  %.lcssa181 = phi double [ %.lcssa181.unr.ph, %.prol.loopexit205.._crit_edge140.us_crit_edge ], [ %93, %._crit_edge140.us.loopexit ]
  %94 = fdiv double %.lcssa181, %2
  store double %94, double* %sunkaddr176.pre-phi, align 8
  %95 = tail call double @sqrt(double %94) #4
  %96 = fcmp ugt double %95, 1.000000e-01
  %97 = select i1 %96, double %95, double 1.000000e+00
  store double %97, double* %sunkaddr176.pre-phi, align 8
  %98 = add nsw i32 %.1101142.us, 1
  %99 = icmp slt i32 %98, %0
  br i1 %99, label %.lr.ph143.split.us, label %._crit_edge109.._crit_edge110_crit_edge.loopexit

.lr.ph151.split:                                  ; preds = %.lr.ph151.split.preheader263, %.lr.ph151.split
  %indvars.iv224 = phi i64 [ %indvars.iv.next225.3, %.lr.ph151.split ], [ %indvars.iv224.ph, %.lr.ph151.split.preheader263 ]
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv224
  store double %16, double* %100, align 8
  %indvars.iv.next225 = add nuw nsw i64 %indvars.iv224, 1
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next225
  store double %16, double* %101, align 8
  %indvars.iv.next225.1 = add nsw i64 %indvars.iv224, 2
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next225.1
  store double %16, double* %102, align 8
  %indvars.iv.next225.2 = add nsw i64 %indvars.iv224, 3
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next225.2
  store double %16, double* %103, align 8
  %indvars.iv.next225.3 = add nsw i64 %indvars.iv224, 4
  %exitcond227.3 = icmp eq i64 %indvars.iv.next225.3, %wide.trip.count226.3
  br i1 %exitcond227.3, label %.lr.ph143.loopexit264, label %.lr.ph151.split, !llvm.loop !6

._crit_edge109.._crit_edge110_crit_edge.loopexit: ; preds = %._crit_edge140.us
  br label %._crit_edge109.._crit_edge110_crit_edge

._crit_edge109.._crit_edge110_crit_edge.loopexit262: ; preds = %.lr.ph143.split
  br label %._crit_edge109.._crit_edge110_crit_edge

._crit_edge109.._crit_edge110_crit_edge:          ; preds = %._crit_edge109.._crit_edge110_crit_edge.loopexit262, %._crit_edge109.._crit_edge110_crit_edge.loopexit, %7, %.lr.ph143.split.prol.loopexit
  %104 = icmp sgt i32 %1, 0
  br i1 %104, label %._crit_edge110.._crit_edge111_crit_edge.lr.ph, label %._crit_edge110.._crit_edge112_crit_edge

._crit_edge110.._crit_edge111_crit_edge.lr.ph:    ; preds = %._crit_edge109.._crit_edge110_crit_edge
  br i1 %8, label %._crit_edge110.._crit_edge111_crit_edge.us.preheader, label %._crit_edge110.._crit_edge112_crit_edge.thread

._crit_edge110.._crit_edge111_crit_edge.us.preheader: ; preds = %._crit_edge110.._crit_edge111_crit_edge.lr.ph
  %wide.trip.count197 = zext i32 %0 to i64
  br label %._crit_edge110.._crit_edge111_crit_edge.us

._crit_edge110.._crit_edge112_crit_edge.thread:   ; preds = %._crit_edge110.._crit_edge111_crit_edge.lr.ph
  %105 = add nsw i32 %0, -1
  br label %._crit_edge112._crit_edge

._crit_edge110.._crit_edge111_crit_edge.us:       ; preds = %._crit_edge110.._crit_edge111_crit_edge.us.preheader, %._crit_edge111._crit_edge.us
  %.2136.us = phi i32 [ %118, %._crit_edge111._crit_edge.us ], [ 0, %._crit_edge110.._crit_edge111_crit_edge.us.preheader ]
  %106 = sext i32 %.2136.us to i64
  br label %._crit_edge111.us

._crit_edge111.us:                                ; preds = %._crit_edge111.us, %._crit_edge110.._crit_edge111_crit_edge.us
  %indvars.iv195 = phi i64 [ 0, %._crit_edge110.._crit_edge111_crit_edge.us ], [ %indvars.iv.next196, %._crit_edge111.us ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv195
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %106, i64 %indvars.iv195
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %112 = tail call double @sqrt(double %2) #4
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv195
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = load double, double* %109, align 8
  %117 = fdiv double %116, %115
  store double %117, double* %109, align 8
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next196, %wide.trip.count197
  br i1 %exitcond198, label %._crit_edge111._crit_edge.us, label %._crit_edge111.us

._crit_edge111._crit_edge.us:                     ; preds = %._crit_edge111.us
  %118 = add nsw i32 %.2136.us, 1
  %119 = icmp slt i32 %118, %1
  br i1 %119, label %._crit_edge110.._crit_edge111_crit_edge.us, label %._crit_edge110.._crit_edge112_crit_edge.loopexit

.lr.ph143.split:                                  ; preds = %.lr.ph143.split.preheader234, %.lr.ph143.split
  %indvars.iv209 = phi i64 [ %indvars.iv.next210.1, %.lr.ph143.split ], [ %indvars.iv209.unr, %.lr.ph143.split.preheader234 ]
  %120 = getelementptr inbounds double, double* %6, i64 %indvars.iv209
  store double %72, double* %120, align 8
  %121 = tail call double @sqrt(double %72) #4
  %122 = fcmp ugt double %121, 1.000000e-01
  %123 = select i1 %122, double %121, double 1.000000e+00
  store double %123, double* %120, align 8
  %indvars.iv.next210 = add nuw nsw i64 %indvars.iv209, 1
  %124 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next210
  store double %72, double* %124, align 8
  %125 = tail call double @sqrt(double %72) #4
  %126 = fcmp ugt double %125, 1.000000e-01
  %127 = select i1 %126, double %125, double 1.000000e+00
  store double %127, double* %124, align 8
  %indvars.iv.next210.1 = add nsw i64 %indvars.iv209, 2
  %exitcond212.1 = icmp eq i64 %indvars.iv.next210.1, %wide.trip.count211.1
  br i1 %exitcond212.1, label %._crit_edge109.._crit_edge110_crit_edge.loopexit262, label %.lr.ph143.split

._crit_edge110.._crit_edge112_crit_edge.loopexit: ; preds = %._crit_edge111._crit_edge.us
  br label %._crit_edge110.._crit_edge112_crit_edge

._crit_edge110.._crit_edge112_crit_edge:          ; preds = %._crit_edge110.._crit_edge112_crit_edge.loopexit, %._crit_edge109.._crit_edge110_crit_edge
  %128 = add nsw i32 %0, -1
  %129 = icmp sgt i32 %0, 1
  br i1 %129, label %._crit_edge112.._crit_edge113_crit_edge.lr.ph, label %._crit_edge112._crit_edge

._crit_edge112.._crit_edge113_crit_edge.lr.ph:    ; preds = %._crit_edge110.._crit_edge112_crit_edge
  br i1 %104, label %._crit_edge112.._crit_edge113_crit_edge.us.preheader, label %._crit_edge112.._crit_edge113_crit_edge.preheader

._crit_edge112.._crit_edge113_crit_edge.us.preheader: ; preds = %._crit_edge112.._crit_edge113_crit_edge.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %130 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %._crit_edge112.._crit_edge113_crit_edge.us

._crit_edge112.._crit_edge113_crit_edge.preheader: ; preds = %._crit_edge112.._crit_edge113_crit_edge.lr.ph
  %131 = zext i32 %128 to i64
  %132 = add i32 %0, -2
  %133 = zext i32 %132 to i64
  %wide.trip.count187.3 = zext i32 %0 to i64
  br label %._crit_edge112.._crit_edge113_crit_edge

._crit_edge112.._crit_edge113_crit_edge.us:       ; preds = %._crit_edge112.._crit_edge113_crit_edge.us.preheader, %._crit_edge112.us
  %.3124.us = phi i32 [ %136, %._crit_edge112.us ], [ 0, %._crit_edge112.._crit_edge113_crit_edge.us.preheader ]
  %134 = sext i32 %.3124.us to i64
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %134, i64 %134
  store double 1.000000e+00, double* %135, align 8
  %136 = add nsw i32 %.3124.us, 1
  %137 = icmp slt i32 %136, %0
  br i1 %137, label %.lr.ph.us.us.preheader, label %._crit_edge112.us

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge112.._crit_edge113_crit_edge.us
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %134
  br label %.lr.ph.us.us

._crit_edge112.us.loopexit:                       ; preds = %._crit_edge122.us.us
  br label %._crit_edge112.us

._crit_edge112.us:                                ; preds = %._crit_edge112.us.loopexit, %._crit_edge112.._crit_edge113_crit_edge.us
  %139 = icmp slt i32 %136, %128
  br i1 %139, label %._crit_edge112.._crit_edge113_crit_edge.us, label %._crit_edge112._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge122.us.us
  %140 = phi i32 [ %149, %._crit_edge122.us.us ], [ %136, %.lr.ph.us.us.preheader ]
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %134, i64 %141
  store double 0.000000e+00, double* %142, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %143 = load double, double* %138, align 8
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %141
  %145 = load double, double* %144, align 8
  %146 = fmul double %143, %145
  %147 = fadd double %146, 0.000000e+00
  store double %147, double* %142, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %147, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %147, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %130, label %._crit_edge122.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge122.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge122.us.us

._crit_edge122.us.us:                             ; preds = %._crit_edge122.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %163, %._crit_edge122.us.us.loopexit ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %141, i64 %134
  store double %.lcssa, double* %148, align 8
  %149 = add nsw i32 %140, 1
  %150 = icmp slt i32 %149, %0
  br i1 %150, label %.lr.ph.us.us, label %._crit_edge112.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %151 = phi double [ %163, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %134
  %153 = load double, double* %152, align 8
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %141
  %155 = load double, double* %154, align 8
  %156 = fmul double %153, %155
  %157 = fadd double %151, %156
  store double %157, double* %142, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %134
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %141
  %161 = load double, double* %160, align 8
  %162 = fmul double %159, %161
  %163 = fadd double %157, %162
  store double %163, double* %142, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge122.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge112.._crit_edge113_crit_edge:          ; preds = %._crit_edge112, %._crit_edge112.._crit_edge113_crit_edge.preheader
  %indvar = phi i64 [ 0, %._crit_edge112.._crit_edge113_crit_edge.preheader ], [ %indvar.next, %._crit_edge112 ]
  %indvars.iv183 = phi i64 [ 1, %._crit_edge112.._crit_edge113_crit_edge.preheader ], [ %indvars.iv.next184, %._crit_edge112 ]
  %.3124 = phi i32 [ 0, %._crit_edge112.._crit_edge113_crit_edge.preheader ], [ %168, %._crit_edge112 ]
  %164 = sub i64 %133, %indvar
  %165 = trunc i64 %164 to i32
  %166 = sext i32 %.3124 to i64
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %166
  store double 1.000000e+00, double* %167, align 8
  %168 = add nsw i32 %.3124, 1
  %169 = icmp slt i32 %168, %0
  br i1 %169, label %.lr.ph123.split.preheader, label %._crit_edge112

.lr.ph123.split.preheader:                        ; preds = %._crit_edge112.._crit_edge113_crit_edge
  %170 = sub i64 %131, %indvar
  %171 = trunc i64 %170 to i32
  %xtraiter190 = and i32 %171, 3
  %lcmp.mod191 = icmp eq i32 %xtraiter190, 0
  br i1 %lcmp.mod191, label %.lr.ph123.split.prol.loopexit, label %.lr.ph123.split.prol.preheader

.lr.ph123.split.prol.preheader:                   ; preds = %.lr.ph123.split.preheader
  br label %.lr.ph123.split.prol

.lr.ph123.split.prol:                             ; preds = %.lr.ph123.split.prol.preheader, %.lr.ph123.split.prol
  %indvars.iv185.prol = phi i64 [ %indvars.iv.next186.prol, %.lr.ph123.split.prol ], [ %indvars.iv183, %.lr.ph123.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph123.split.prol ], [ %xtraiter190, %.lr.ph123.split.prol.preheader ]
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %indvars.iv185.prol
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv185.prol, i64 %166
  store double 0.000000e+00, double* %173, align 8
  %indvars.iv.next186.prol = add nuw nsw i64 %indvars.iv185.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph123.split.prol.loopexit.loopexit, label %.lr.ph123.split.prol, !llvm.loop !8

.lr.ph123.split.prol.loopexit.loopexit:           ; preds = %.lr.ph123.split.prol
  br label %.lr.ph123.split.prol.loopexit

.lr.ph123.split.prol.loopexit:                    ; preds = %.lr.ph123.split.prol.loopexit.loopexit, %.lr.ph123.split.preheader
  %indvars.iv185.unr = phi i64 [ %indvars.iv183, %.lr.ph123.split.preheader ], [ %indvars.iv.next186.prol, %.lr.ph123.split.prol.loopexit.loopexit ]
  %174 = icmp ult i32 %165, 3
  br i1 %174, label %._crit_edge112, label %.lr.ph123.split.preheader260

.lr.ph123.split.preheader260:                     ; preds = %.lr.ph123.split.prol.loopexit
  br label %.lr.ph123.split

.lr.ph123.split:                                  ; preds = %.lr.ph123.split.preheader260, %.lr.ph123.split
  %indvars.iv185 = phi i64 [ %indvars.iv.next186.3, %.lr.ph123.split ], [ %indvars.iv185.unr, %.lr.ph123.split.preheader260 ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %indvars.iv185
  store double 0.000000e+00, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv185, i64 %166
  store double 0.000000e+00, double* %176, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %indvars.iv.next186
  store double 0.000000e+00, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next186, i64 %166
  store double 0.000000e+00, double* %178, align 8
  %indvars.iv.next186.1 = add nsw i64 %indvars.iv185, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %indvars.iv.next186.1
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next186.1, i64 %166
  store double 0.000000e+00, double* %180, align 8
  %indvars.iv.next186.2 = add nsw i64 %indvars.iv185, 3
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %indvars.iv.next186.2
  store double 0.000000e+00, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next186.2, i64 %166
  store double 0.000000e+00, double* %182, align 8
  %indvars.iv.next186.3 = add nsw i64 %indvars.iv185, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next186.3, %wide.trip.count187.3
  br i1 %exitcond.3, label %._crit_edge112.loopexit, label %.lr.ph123.split

._crit_edge112.loopexit:                          ; preds = %.lr.ph123.split
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph123.split.prol.loopexit, %._crit_edge112.._crit_edge113_crit_edge
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %131
  br i1 %exitcond, label %._crit_edge112._crit_edge.loopexit261, label %._crit_edge112.._crit_edge113_crit_edge

._crit_edge112._crit_edge.loopexit:               ; preds = %._crit_edge112.us
  br label %._crit_edge112._crit_edge

._crit_edge112._crit_edge.loopexit261:            ; preds = %._crit_edge112
  br label %._crit_edge112._crit_edge

._crit_edge112._crit_edge:                        ; preds = %._crit_edge112._crit_edge.loopexit261, %._crit_edge112._crit_edge.loopexit, %._crit_edge110.._crit_edge112_crit_edge.thread, %._crit_edge110.._crit_edge112_crit_edge
  %183 = phi i32 [ %105, %._crit_edge110.._crit_edge112_crit_edge.thread ], [ %128, %._crit_edge110.._crit_edge112_crit_edge ], [ %128, %._crit_edge112._crit_edge.loopexit ], [ %128, %._crit_edge112._crit_edge.loopexit261 ]
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %184, i64 %184
  store double 1.000000e+00, double* %185, align 8
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
  br i1 %7, label %.._crit_edge11_crit_edge.us.preheader, label %._crit_edge14

.._crit_edge11_crit_edge.us.preheader:            ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge11_crit_edge.us

.._crit_edge11_crit_edge.us:                      ; preds = %.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %.01013.us = phi i32 [ %22, %._crit_edge11._crit_edge.us ], [ 0, %.._crit_edge11_crit_edge.us.preheader ]
  %8 = mul nsw i32 %.01013.us, %0
  %9 = sext i32 %.01013.us to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge.us, %.._crit_edge11_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge11_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge11._crit_edge.us, label %11

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge.us
  %22 = add nsw i32 %.01013.us, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %.._crit_edge11_crit_edge.us, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
