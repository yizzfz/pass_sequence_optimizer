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
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  br i1 true, label %.preheader.lr.ph, label %._crit_edge29

.preheader.lr.ph:                                 ; preds = %5
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge26.us, %.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next45, %._crit_edge26.us ]
  %6 = add nuw i64 %indvars.iv44, 4294967295
  %7 = icmp sgt i64 %indvars.iv44, 0
  %8 = trunc i64 %indvars.iv44 to i32
  br i1 %7, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit.unr-lcssa, %.preheader.us
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv44
  store double 1.000000e+00, double* %9, align 8
  %10 = add i32 %8, 1200
  br i1 true, label %.prol.loopexit37.unr-lcssa, label %.prol.preheader36

.prol.preheader36:                                ; preds = %._crit_edge.us
  %11 = srem i32 %10, 1200
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.200000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 0
  store double %13, double* %14, align 8
  br label %.prol.loopexit37.unr-lcssa

.prol.loopexit37.unr-lcssa:                       ; preds = %._crit_edge.us, %.prol.preheader36
  %indvars.iv33.unr.ph = phi i64 [ 1, %.prol.preheader36 ], [ 0, %._crit_edge.us ]
  br i1 false, label %._crit_edge26.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit37.unr-lcssa
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %._crit_edge.us.new ], [ %indvars.iv33.unr.ph, %._crit_edge.us.new.preheader ]
  %15 = trunc i64 %indvars.iv33 to i32
  %16 = sub i32 %10, %15
  %17 = srem i32 %16, 1200
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.200000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv33
  store double %19, double* %20, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %21 = trunc i64 %indvars.iv.next34 to i32
  %22 = sub i32 %10, %21
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.200000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv.next34
  store double %25, double* %26, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond.141 = icmp eq i64 %indvars.iv.next34.1, 1200
  br i1 %exitcond.141, label %._crit_edge26.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %27 = add nuw nsw i64 %indvars.iv, %indvars.iv44
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = add nuw nsw i64 %indvars.iv.next, %indvars.iv44
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 1000
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.000000e+03
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv.next
  store double %37, double* %38, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv44
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i32 %8, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %39 = srem i32 %8, 1000
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 0
  store double %41, double* %42, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %43 = trunc i64 %6 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph.us.new

._crit_edge26.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %.prol.loopexit37.unr-lcssa
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond, label %._crit_edge29.loopexit, label %.preheader.us

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv58 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next59, %._crit_edge ]
  %45 = add nuw i64 %indvars.iv58, 4294967295
  %46 = icmp sgt i64 %indvars.iv58, 0
  br i1 %46, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %47 = trunc i64 %indvars.iv58 to i32
  %xtraiter54 = and i32 %47, 1
  %lcmp.mod55 = icmp eq i32 %xtraiter54, 0
  br i1 %lcmp.mod55, label %.prol.loopexit53.unr-lcssa, label %.prol.preheader52

.prol.preheader52:                                ; preds = %.lr.ph
  %48 = srem i32 %47, 1000
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, 1.000000e+03
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 0
  store double %50, double* %51, align 8
  br label %.prol.loopexit53.unr-lcssa

.prol.loopexit53.unr-lcssa:                       ; preds = %.lr.ph, %.prol.preheader52
  %indvars.iv47.unr.ph = phi i64 [ 1, %.prol.preheader52 ], [ 0, %.lr.ph ]
  %52 = trunc i64 %45 to i32
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit53.unr-lcssa
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.lr.ph.new ], [ %indvars.iv47.unr.ph, %.lr.ph.new.preheader ]
  %54 = add nuw nsw i64 %indvars.iv47, %indvars.iv58
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, 1000
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, 1.000000e+03
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv47
  store double %58, double* %59, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %60 = add nuw nsw i64 %indvars.iv.next48, %indvars.iv58
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, 1000
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, 1.000000e+03
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv.next48
  store double %64, double* %65, align 8
  %indvars.iv.next48.1 = add nuw nsw i64 %indvars.iv47, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %indvars.iv58
  br i1 %exitcond51.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit53.unr-lcssa, %.preheader
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv58
  store double 1.000000e+00, double* %66, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond61, label %._crit_edge29.loopexit65, label %.preheader

._crit_edge29.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge29

._crit_edge29.loopexit65:                         ; preds = %._crit_edge
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit65, %._crit_edge29.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader24.us.preheader, label %._crit_edge30

.preheader24.us.preheader:                        ; preds = %5
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %._crit_edge28.us..preheader24.us_crit_edge, %.preheader24.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader24.us.preheader ], [ %indvars.iv.next53, %._crit_edge28.us..preheader24.us_crit_edge ]
  %indvars.iv41 = phi i64 [ 1, %.preheader24.us.preheader ], [ %indvars.iv.next42, %._crit_edge28.us..preheader24.us_crit_edge ]
  %6 = sub nsw i64 0, %indvars.iv52
  %7 = trunc i64 %6 to i32
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %8 = icmp slt i64 %indvars.iv.next53, 1000
  br i1 %8, label %.preheader.us.us.preheader, label %.preheader.us31.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader24.us
  %9 = add i32 1001, %7
  %xtraiter46 = and i32 %9, 1
  %10 = sub i32 0, %7
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv52
  %indvars.iv.next44.prol = add nuw nsw i64 %indvars.iv41, 1
  %12 = icmp eq i32 %xtraiter46, 0
  %13 = icmp eq i32 998, %10
  br label %.preheader.us.us

.preheader.us31.preheader:                        ; preds = %.preheader24.us
  br i1 true, label %.preheader.us31.prol.loopexit, label %.preheader.us31.prol.preheader

.preheader.us31.prol.preheader:                   ; preds = %.preheader.us31.preheader
  br label %.preheader.us31.prol

.preheader.us31.prol:                             ; preds = %.preheader.us31.prol.preheader, %.preheader.us31.prol..preheader.us31.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us31.prol..preheader.us31.prol_crit_edge ], [ 0, %.preheader.us31.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us31.prol..preheader.us31.prol_crit_edge ], [ 0, %.preheader.us31.prol.preheader ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.prol
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %2
  store double %16, double* %14, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us31.prol.loopexit.loopexit, label %.preheader.us31.prol..preheader.us31.prol_crit_edge, !llvm.loop !1

.preheader.us31.prol..preheader.us31.prol_crit_edge: ; preds = %.preheader.us31.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us31.prol

.preheader.us31.prol.loopexit.loopexit:           ; preds = %.preheader.us31.prol
  br label %.preheader.us31.prol.loopexit

.preheader.us31.prol.loopexit:                    ; preds = %.preheader.us31.prol.loopexit.loopexit, %.preheader.us31.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us31.preheader ], [ 4294967296, %.preheader.us31.prol.loopexit.loopexit ]
  br i1 false, label %._crit_edge28.us, label %.preheader.us31.preheader60

.preheader.us31.preheader60:                      ; preds = %.preheader.us31.prol.loopexit
  %17 = sub nsw i64 1196, %indvars.iv.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 2
  br i1 %min.iters.check, label %.preheader.us31.preheader69, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us31.preheader60
  %20 = add nsw i64 %indvars.iv.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  br i1 false, label %.preheader.us31.preheader69, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %24 = add i64 %indvars.iv.unr, %23
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %24
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %26, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %27 = fmul <2 x double> %strided.vec, %broadcast.splat68
  %28 = fmul <2 x double> %strided.vec64, %broadcast.splat68
  %29 = fmul <2 x double> %strided.vec65, %broadcast.splat68
  %30 = add nsw i64 %24, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %30
  %32 = fmul <2 x double> %strided.vec66, %broadcast.splat68
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  %index.next = add i64 %index, 2
  %37 = icmp eq i64 %index.next, %19
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge28.us, label %.preheader.us31.preheader69

.preheader.us31.preheader69:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us31.preheader60
  %indvars.iv.ph = phi i64 [ %22, %middle.block ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.preheader.us31.preheader60 ]
  br label %.preheader.us31

.preheader.us31:                                  ; preds = %.preheader.us31.preheader69, %.preheader.us31
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us31 ], [ %indvars.iv.ph, %.preheader.us31.preheader69 ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %2
  store double %40, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %2
  store double %43, double* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next.1
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %2
  store double %46, double* %44, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next.2
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %2
  store double %49, double* %47, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1200
  br i1 %exitcond.3, label %._crit_edge28.us.loopexit70, label %.preheader.us31, !llvm.loop !6

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge28.us

._crit_edge28.us.loopexit70:                      ; preds = %.preheader.us31
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit70, %._crit_edge28.us.loopexit, %middle.block, %.preheader.us31.prol.loopexit
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1000
  br i1 %exitcond55, label %._crit_edge30.loopexit, label %._crit_edge28.us..preheader24.us_crit_edge

._crit_edge28.us..preheader24.us_crit_edge:       ; preds = %._crit_edge28.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  br label %.preheader24.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next50, %._crit_edge.us.us ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv49
  br i1 %12, label %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge: ; preds = %.preheader.us.us
  %.pre57.pre = load double, double* %50, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us.us
  %51 = load double, double* %11, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv49
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %50, align 8
  %56 = fadd double %55, %54
  store double %56, double* %50, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge, %.prol.preheader
  %.pre57 = phi double [ %56, %.prol.preheader ], [ %.pre57.pre, %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv43.unr.ph = phi i64 [ %indvars.iv.next44.prol, %.prol.preheader ], [ %indvars.iv41, %.preheader.us.us..prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %13, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit.unr-lcssa
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit.unr-lcssa
  %57 = phi double [ %.pre57, %.prol.loopexit.unr-lcssa ], [ %71, %._crit_edge.us.us.loopexit ]
  %58 = fmul double %57, %2
  store double %58, double* %50, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond, label %._crit_edge28.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %59 = phi double [ %71, %.preheader.us.us.new ], [ %.pre57, %.preheader.us.us.new.preheader ]
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.preheader.us.us.new ], [ %indvars.iv43.unr.ph, %.preheader.us.us.new.preheader ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv52
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv49
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %50, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next44, i64 %indvars.iv52
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next44, i64 %indvars.iv49
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %50, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next44.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge30.loopexit:                           ; preds = %._crit_edge28.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %5
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
  br i1 true, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv14, 1000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge19
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond17, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
