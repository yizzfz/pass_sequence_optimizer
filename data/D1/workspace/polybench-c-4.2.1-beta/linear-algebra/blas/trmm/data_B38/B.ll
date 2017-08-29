; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %._crit_edge36

._crit_edge.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.lr.ph
  %wide.trip.count67 = zext i32 %0 to i64
  br label %._crit_edge

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %xtraiter45 = and i32 %1, 1
  %lcmp.mod46 = icmp eq i32 %xtraiter45, 0
  %10 = icmp eq i32 %1, 1
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count42.1 = zext i32 %1 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge33.us, %._crit_edge.us.preheader
  %indvars.iv51 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next52, %._crit_edge33.us ]
  %11 = add nuw i64 %indvars.iv51, 4294967295
  %12 = icmp sgt i64 %indvars.iv51, 0
  br i1 %12, label %.lr.ph.us, label %._crit_edge29.us

._crit_edge29.us.loopexit:                        ; preds = %.lr.ph.us.new
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %.prol.loopexit, %._crit_edge.us
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv51
  store double 1.000000e+00, double* %13, align 8
  %14 = trunc i64 %indvars.iv51 to i32
  %15 = add i32 %14, %1
  br i1 %lcmp.mod46, label %.prol.loopexit44, label %.prol.preheader43

.prol.preheader43:                                ; preds = %._crit_edge29.us
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit44

.prol.loopexit44:                                 ; preds = %._crit_edge29.us, %.prol.preheader43
  %indvars.iv40.unr.ph = phi i64 [ 1, %.prol.preheader43 ], [ 0, %._crit_edge29.us ]
  br i1 %10, label %._crit_edge33.us, label %._crit_edge29.us.new.preheader

._crit_edge29.us.new.preheader:                   ; preds = %.prol.loopexit44
  br label %._crit_edge29.us.new

._crit_edge29.us.new:                             ; preds = %._crit_edge29.us.new.preheader, %._crit_edge29.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %._crit_edge29.us.new ], [ %indvars.iv40.unr.ph, %._crit_edge29.us.new.preheader ]
  %20 = trunc i64 %indvars.iv40 to i32
  %21 = sub i32 %15, %20
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv40
  store double %24, double* %25, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %26 = trunc i64 %indvars.iv.next41 to i32
  %27 = sub i32 %15, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv.next41
  store double %30, double* %31, align 8
  %indvars.iv.next41.1 = add nuw nsw i64 %indvars.iv40, 2
  %exitcond.148 = icmp eq i64 %indvars.iv.next41.1, %wide.trip.count42.1
  br i1 %exitcond.148, label %._crit_edge33.us.loopexit, label %._crit_edge29.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %32 = add nuw nsw i64 %indvars.iv, %indvars.iv51
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %9
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = add nuw nsw i64 %indvars.iv.next, %indvars.iv51
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %0
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %9
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv51
  br i1 %exitcond.1, label %._crit_edge29.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %._crit_edge.us
  %xtraiter70 = and i64 %indvars.iv51, 1
  %lcmp.mod = icmp eq i64 %xtraiter70, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %44 = trunc i64 %indvars.iv51 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv51, i64 0
  store double %47, double* %48, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %49 = trunc i64 %11 to i32
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge29.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge33.us.loopexit:                        ; preds = %._crit_edge29.us.new
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us.loopexit, %.prol.loopexit44
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond, label %._crit_edge36.loopexit, label %._crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge29, %._crit_edge.preheader
  %indvars.iv65 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next66, %._crit_edge29 ]
  %51 = add nuw i64 %indvars.iv65, 4294967295
  %52 = icmp sgt i64 %indvars.iv65, 0
  br i1 %52, label %.lr.ph, label %._crit_edge29

.lr.ph:                                           ; preds = %._crit_edge
  %xtraiter6169 = and i64 %indvars.iv65, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter6169, 0
  br i1 %lcmp.mod62, label %.prol.loopexit60, label %.prol.preheader59

.prol.preheader59:                                ; preds = %.lr.ph
  %53 = trunc i64 %indvars.iv65 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv65, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.lr.ph, %.prol.preheader59
  %indvars.iv54.unr.ph = phi i64 [ 1, %.prol.preheader59 ], [ 0, %.lr.ph ]
  %58 = trunc i64 %51 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge29, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit60
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph.new ], [ %indvars.iv54.unr.ph, %.lr.ph.new.preheader ]
  %60 = add nuw nsw i64 %indvars.iv54, %indvars.iv65
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, %0
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %9
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv54
  store double %64, double* %65, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %66 = add nuw nsw i64 %indvars.iv.next55, %indvars.iv65
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %0
  %69 = sitofp i32 %68 to double
  %70 = fdiv double %69, %9
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv.next55
  store double %70, double* %71, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv65
  br i1 %exitcond58.1, label %._crit_edge29.loopexit, label %.lr.ph.new

._crit_edge29.loopexit:                           ; preds = %.lr.ph.new
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %.prol.loopexit60, %._crit_edge
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv65
  store double 1.000000e+00, double* %72, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge36.loopexit73, label %._crit_edge

._crit_edge36.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge36

._crit_edge36.loopexit73:                         ; preds = %._crit_edge29
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit73, %._crit_edge36.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %._crit_edge.us.preheader, label %._crit_edge33

._crit_edge.us.preheader:                         ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count54 = zext i32 %1 to i64
  %wide.trip.count48.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %13 = add nsw i32 %xtraiter, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = add nsw i64 %wide.trip.count54, -4
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %indvars.iv55 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next56, %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge ]
  %indvars.iv44 = phi i64 [ 1, %._crit_edge.us.preheader ], [ %indvars.iv.next45, %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %17 = icmp slt i64 %indvars.iv.next56, %11
  br i1 %17, label %._crit_edge27.us.us.preheader, label %._crit_edge27.us34.preheader

._crit_edge27.us.us.preheader:                    ; preds = %._crit_edge.us
  %18 = sub nsw i64 0, %indvars.iv55
  %19 = trunc i64 %18 to i32
  %20 = add i32 %9, %19
  %xtraiter49 = and i32 %20, 1
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  %21 = sub i32 0, %19
  %22 = icmp eq i32 %10, %21
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv55
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv44, 1
  br label %._crit_edge27.us.us

._crit_edge27.us34.preheader:                     ; preds = %._crit_edge.us
  br i1 %lcmp.mod, label %._crit_edge27.us34.prol.loopexit, label %._crit_edge27.us34.prol.preheader

._crit_edge27.us34.prol.preheader:                ; preds = %._crit_edge27.us34.preheader
  br label %._crit_edge27.us34.prol

._crit_edge27.us34.prol:                          ; preds = %._crit_edge27.us34.prol.preheader, %._crit_edge27.us34.prol.._crit_edge27.us34.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge27.us34.prol.._crit_edge27.us34.prol_crit_edge ], [ 0, %._crit_edge27.us34.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge27.us34.prol.._crit_edge27.us34.prol_crit_edge ], [ %xtraiter, %._crit_edge27.us34.prol.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %2
  store double %26, double* %24, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge27.us34.prol.loopexit.loopexit, label %._crit_edge27.us34.prol.._crit_edge27.us34.prol_crit_edge, !llvm.loop !1

._crit_edge27.us34.prol.._crit_edge27.us34.prol_crit_edge: ; preds = %._crit_edge27.us34.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %._crit_edge27.us34.prol

._crit_edge27.us34.prol.loopexit.loopexit:        ; preds = %._crit_edge27.us34.prol
  br label %._crit_edge27.us34.prol.loopexit

._crit_edge27.us34.prol.loopexit:                 ; preds = %._crit_edge27.us34.prol.loopexit.loopexit, %._crit_edge27.us34.preheader
  %indvars.iv.unr = phi i64 [ 0, %._crit_edge27.us34.preheader ], [ %15, %._crit_edge27.us34.prol.loopexit.loopexit ]
  br i1 %12, label %.._crit_edge28_crit_edge.us, label %._crit_edge27.us34.preheader62

._crit_edge27.us34.preheader62:                   ; preds = %._crit_edge27.us34.prol.loopexit
  %27 = sub nsw i64 %16, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = add nuw nsw i64 %28, 1
  %min.iters.check = icmp ult i64 %29, 2
  br i1 %min.iters.check, label %._crit_edge27.us34.preheader70, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge27.us34.preheader62
  %n.mod.vf = and i64 %29, 1
  %n.vec = sub nsw i64 %29, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %30 = add nsw i64 %indvars.iv.unr, 4
  %31 = shl nuw i64 %28, 2
  %32 = add i64 %30, %31
  %33 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %32, %33
  br i1 %cmp.zero, label %._crit_edge27.us34.preheader70, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = shl i64 %index, 2
  %35 = add i64 %indvars.iv.unr, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %35
  %37 = bitcast double* %36 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %37, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = fmul <2 x double> %strided.vec, %broadcast.splat69
  %39 = fmul <2 x double> %strided.vec65, %broadcast.splat69
  %40 = fmul <2 x double> %strided.vec66, %broadcast.splat69
  %41 = add nsw i64 %35, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %41
  %43 = fmul <2 x double> %strided.vec67, %broadcast.splat69
  %44 = getelementptr double, double* %42, i64 -3
  %45 = bitcast double* %44 to <8 x double>*
  %46 = shufflevector <2 x double> %38, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %47 = shufflevector <2 x double> %40, <2 x double> %43, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %46, <4 x double> %47, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %45, align 8
  %index.next = add i64 %index, 2
  %48 = icmp eq i64 %index.next, %n.vec
  br i1 %48, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge28_crit_edge.us, label %._crit_edge27.us34.preheader70

._crit_edge27.us34.preheader70:                   ; preds = %middle.block, %min.iters.checked, %._crit_edge27.us34.preheader62
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %._crit_edge27.us34.preheader62 ]
  br label %._crit_edge27.us34

._crit_edge27.us34:                               ; preds = %._crit_edge27.us34.preheader70, %._crit_edge27.us34
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge27.us34 ], [ %indvars.iv.ph, %._crit_edge27.us34.preheader70 ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %2
  store double %51, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %2
  store double %54, double* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next.1
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  store double %57, double* %55, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv.next.2
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %2
  store double %60, double* %58, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count54
  br i1 %exitcond.3, label %.._crit_edge28_crit_edge.us.loopexit71, label %._crit_edge27.us34, !llvm.loop !6

.._crit_edge28_crit_edge.us.loopexit:             ; preds = %._crit_edge30.us.us
  br label %.._crit_edge28_crit_edge.us

.._crit_edge28_crit_edge.us.loopexit71:           ; preds = %._crit_edge27.us34
  br label %.._crit_edge28_crit_edge.us

.._crit_edge28_crit_edge.us:                      ; preds = %.._crit_edge28_crit_edge.us.loopexit71, %.._crit_edge28_crit_edge.us.loopexit, %middle.block, %._crit_edge27.us34.prol.loopexit
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count48.1
  br i1 %exitcond58, label %._crit_edge33.loopexit, label %.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge

.._crit_edge28_crit_edge.us.._crit_edge.us_crit_edge: ; preds = %.._crit_edge28_crit_edge.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br label %._crit_edge.us

._crit_edge27.us.us:                              ; preds = %._crit_edge30.us.us, %._crit_edge27.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %._crit_edge27.us.us.preheader ], [ %indvars.iv.next53, %._crit_edge30.us.us ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv52
  br i1 %lcmp.mod50, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %._crit_edge27.us.us
  %62 = load double, double* %23, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv52
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = load double, double* %61, align 8
  %67 = fadd double %66, %65
  store double %67, double* %61, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge27.us.us, %.prol.preheader
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader ], [ %indvars.iv44, %._crit_edge27.us.us ]
  %.pre64 = load double, double* %61, align 8
  br i1 %22, label %._crit_edge30.us.us, label %._crit_edge27.us.us.new.preheader

._crit_edge27.us.us.new.preheader:                ; preds = %.prol.loopexit
  br label %._crit_edge27.us.us.new

._crit_edge30.us.us.loopexit:                     ; preds = %._crit_edge27.us.us.new
  br label %._crit_edge30.us.us

._crit_edge30.us.us:                              ; preds = %._crit_edge30.us.us.loopexit, %.prol.loopexit
  %68 = phi double [ %.pre64, %.prol.loopexit ], [ %82, %._crit_edge30.us.us.loopexit ]
  %69 = fmul double %68, %2
  store double %69, double* %61, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond, label %.._crit_edge28_crit_edge.us.loopexit, label %._crit_edge27.us.us

._crit_edge27.us.us.new:                          ; preds = %._crit_edge27.us.us.new.preheader, %._crit_edge27.us.us.new
  %70 = phi double [ %82, %._crit_edge27.us.us.new ], [ %.pre64, %._crit_edge27.us.us.new.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %._crit_edge27.us.us.new ], [ %indvars.iv46.unr.ph, %._crit_edge27.us.us.new.preheader ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv55
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv52
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %70, %75
  store double %76, double* %61, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next47, i64 %indvars.iv55
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv52
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %61, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, %wide.trip.count48.1
  br i1 %exitcond.1, label %._crit_edge30.us.us.loopexit, label %._crit_edge27.us.us.new

._crit_edge33.loopexit:                           ; preds = %.._crit_edge28_crit_edge.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %._crit_edge.us.preheader, label %._crit_edge16

._crit_edge.us.preheader:                         ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count20 = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge14.us, %._crit_edge.us.preheader
  %indvars.iv18 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next19, %._crit_edge14.us ]
  %11 = mul nsw i64 %indvars.iv18, %10
  br label %._crit_edge12.us._crit_edge

._crit_edge12.us._crit_edge:                      ; preds = %._crit_edge12.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge12.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge12.us

; <label>:16:                                     ; preds = %._crit_edge12.us._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us._crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge14.us, label %._crit_edge12.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge12.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge16.loopexit, label %._crit_edge.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
