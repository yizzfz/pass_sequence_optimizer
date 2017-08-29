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
  %storemerge7 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %storemerge7 to double
  %4 = sext i32 %storemerge7 to i64
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
  %20 = add nsw i32 %storemerge7, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph134, label %._crit_edge.._crit_edge89_crit_edge

.lr.ph134:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph134.split.us.preheader, label %.lr.ph134.split.preheader

.lr.ph134.split.us.preheader:                     ; preds = %.lr.ph134
  %xtraiter204 = and i32 %1, 1
  %wide.trip.count200.1 = zext i32 %1 to i64
  %10 = add nsw i64 %wide.trip.count200.1, -2
  %11 = icmp eq i32 %xtraiter204, 0
  %12 = icmp eq i32 %1, 1
  %.pre = ptrtoint double* %5 to i64
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %13 = ptrtoint double* %5 to i64
  br label %.lr.ph134.split.us

.lr.ph134.split.preheader:                        ; preds = %.lr.ph134
  %14 = add i32 %0, -1
  %xtraiter211 = and i32 %0, 3
  %lcmp.mod212 = icmp eq i32 %xtraiter211, 0
  br i1 %lcmp.mod212, label %.lr.ph134.split.prol.loopexit, label %.lr.ph134.split.prol.preheader

.lr.ph134.split.prol.preheader:                   ; preds = %.lr.ph134.split.preheader
  %15 = fdiv double 0.000000e+00, %2
  br label %.lr.ph134.split.prol

.lr.ph134.split.prol:                             ; preds = %.lr.ph134.split.prol.preheader, %.lr.ph134.split.prol
  %indvars.iv207.prol = phi i64 [ %indvars.iv.next208.prol, %.lr.ph134.split.prol ], [ 0, %.lr.ph134.split.prol.preheader ]
  %prol.iter213 = phi i32 [ %prol.iter213.sub, %.lr.ph134.split.prol ], [ %xtraiter211, %.lr.ph134.split.prol.preheader ]
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv207.prol
  store double %15, double* %16, align 8
  %indvars.iv.next208.prol = add nuw nsw i64 %indvars.iv207.prol, 1
  %prol.iter213.sub = add i32 %prol.iter213, -1
  %prol.iter213.cmp = icmp eq i32 %prol.iter213.sub, 0
  br i1 %prol.iter213.cmp, label %.lr.ph134.split.prol.loopexit.loopexit, label %.lr.ph134.split.prol, !llvm.loop !1

.lr.ph134.split.prol.loopexit.loopexit:           ; preds = %.lr.ph134.split.prol
  br label %.lr.ph134.split.prol.loopexit

.lr.ph134.split.prol.loopexit:                    ; preds = %.lr.ph134.split.prol.loopexit.loopexit, %.lr.ph134.split.preheader
  %indvars.iv207.unr = phi i64 [ 0, %.lr.ph134.split.preheader ], [ %indvars.iv.next208.prol, %.lr.ph134.split.prol.loopexit.loopexit ]
  %17 = icmp ult i32 %14, 3
  br i1 %17, label %.lr.ph128, label %.lr.ph134.split.preheader219

.lr.ph134.split.preheader219:                     ; preds = %.lr.ph134.split.prol.loopexit
  %18 = fdiv double 0.000000e+00, %2
  %wide.trip.count209.3 = zext i32 %0 to i64
  %19 = add nsw i64 %wide.trip.count209.3, -4
  %20 = sub i64 %19, %indvars.iv207.unr
  %21 = lshr i64 %20, 2
  %22 = add nuw nsw i64 %21, 1
  %min.iters.check = icmp ult i64 %22, 4
  br i1 %min.iters.check, label %.lr.ph134.split.preheader291, label %min.iters.checked

.lr.ph134.split.preheader291:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph134.split.preheader219
  %indvars.iv207.ph = phi i64 [ %indvars.iv207.unr, %min.iters.checked ], [ %indvars.iv207.unr, %.lr.ph134.split.preheader219 ], [ %ind.end, %middle.block ]
  br label %.lr.ph134.split

min.iters.checked:                                ; preds = %.lr.ph134.split.preheader219
  %n.mod.vf = and i64 %22, 3
  %n.vec = sub nsw i64 %22, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %23 = shl nuw i64 %21, 2
  %24 = add i64 %indvars.iv207.unr, %23
  %25 = add i64 %24, 4
  %26 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %25, %26
  br i1 %cmp.zero, label %.lr.ph134.split.preheader291, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert271 = insertelement <2 x double> undef, double %18, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert271, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %27 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv207.unr, %27
  %28 = add nsw i64 %offset.idx, 3
  %29 = add i64 %offset.idx, 11
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = getelementptr double, double* %31, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph134.split.preheader291

.lr.ph134.split.us:                               ; preds = %.lr.ph134.split.us.preheader, %._crit_edge.us
  %storemerge132.us = phi i32 [ %66, %._crit_edge.us ], [ 0, %.lr.ph134.split.us.preheader ]
  %37 = sext i32 %storemerge132.us to i64
  %38 = getelementptr inbounds double, double* %5, i64 %37
  store double 0.000000e+00, double* %38, align 8
  br i1 %11, label %.prol.loopexit203, label %.prol.preheader202

.prol.preheader202:                               ; preds = %.lr.ph134.split.us
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %37
  %40 = load double, double* %39, align 8
  %41 = fadd double %40, 0.000000e+00
  %sunkaddr141.prol = shl nsw i64 %37, 3
  %sunkaddr142.prol = add i64 %13, %sunkaddr141.prol
  %sunkaddr143.prol = inttoptr i64 %sunkaddr142.prol to double*
  store double %41, double* %sunkaddr143.prol, align 8
  br label %.prol.loopexit203

.prol.loopexit203:                                ; preds = %.prol.preheader202, %.lr.ph134.split.us
  %indvars.iv198.unr.ph = phi i64 [ 1, %.prol.preheader202 ], [ 0, %.lr.ph134.split.us ]
  %.unr206.ph = phi double [ %41, %.prol.preheader202 ], [ 0.000000e+00, %.lr.ph134.split.us ]
  %.lcssa165.unr.ph = phi double [ %41, %.prol.preheader202 ], [ undef, %.lr.ph134.split.us ]
  br i1 %12, label %.prol.loopexit203.._crit_edge.us_crit_edge, label %.lr.ph134.split.us.new.preheader

.lr.ph134.split.us.new.preheader:                 ; preds = %.prol.loopexit203
  %42 = sub nsw i64 %10, %indvars.iv198.unr.ph
  %43 = lshr i64 %42, 1
  %44 = and i64 %43, 1
  %lcmp.mod = icmp eq i64 %44, 0
  br i1 %lcmp.mod, label %.lr.ph134.split.us.new.prol.preheader, label %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa

.lr.ph134.split.us.new.prol.preheader:            ; preds = %.lr.ph134.split.us.new.preheader
  br label %.lr.ph134.split.us.new.prol

.lr.ph134.split.us.new.prol:                      ; preds = %.lr.ph134.split.us.new.prol.preheader
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198.unr.ph, i64 %37
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %.unr206.ph
  %sunkaddr237.prol = shl nsw i64 %37, 3
  %sunkaddr238.prol = add i64 %sunkaddr.prol, %sunkaddr237.prol
  %sunkaddr239.prol = inttoptr i64 %sunkaddr238.prol to double*
  store double %47, double* %sunkaddr239.prol, align 8
  %indvars.iv.next199.prol = add nuw nsw i64 %indvars.iv198.unr.ph, 1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.prol, i64 %37
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %sunkaddr239.prol, align 8
  %indvars.iv.next199.1.prol = or i64 %indvars.iv198.unr.ph, 2
  br label %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa

.lr.ph134.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph134.split.us.new.preheader, %.lr.ph134.split.us.new.prol
  %sunkaddr239.lcssa.unr.ph = phi double* [ %sunkaddr239.prol, %.lr.ph134.split.us.new.prol ], [ undef, %.lr.ph134.split.us.new.preheader ]
  %.lcssa295.unr.ph = phi double [ %50, %.lr.ph134.split.us.new.prol ], [ undef, %.lr.ph134.split.us.new.preheader ]
  %indvars.iv198.unr.ph297 = phi i64 [ %indvars.iv.next199.1.prol, %.lr.ph134.split.us.new.prol ], [ %indvars.iv198.unr.ph, %.lr.ph134.split.us.new.preheader ]
  %.unr.ph298 = phi double [ %50, %.lr.ph134.split.us.new.prol ], [ %.unr206.ph, %.lr.ph134.split.us.new.preheader ]
  br label %.lr.ph134.split.us.new.prol.loopexit

.lr.ph134.split.us.new.prol.loopexit:             ; preds = %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa
  %51 = icmp eq i64 %43, 0
  br i1 %51, label %._crit_edge.us.loopexit, label %.lr.ph134.split.us.new.preheader.new

.lr.ph134.split.us.new.preheader.new:             ; preds = %.lr.ph134.split.us.new.prol.loopexit
  %sunkaddr237 = shl nsw i64 %37, 3
  %sunkaddr238 = add i64 %sunkaddr, %sunkaddr237
  %sunkaddr239 = inttoptr i64 %sunkaddr238 to double*
  %sunkaddr237.1 = shl nsw i64 %37, 3
  %sunkaddr238.1 = add i64 %sunkaddr.1, %sunkaddr237.1
  %sunkaddr239.1 = inttoptr i64 %sunkaddr238.1 to double*
  br label %.lr.ph134.split.us.new

.prol.loopexit203.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit203
  %.pre280 = shl nsw i64 %37, 3
  %.pre281 = add i64 %.pre, %.pre280
  %.pre282 = inttoptr i64 %.pre281 to double*
  br label %._crit_edge.us

.lr.ph134.split.us.new:                           ; preds = %.lr.ph134.split.us.new, %.lr.ph134.split.us.new.preheader.new
  %indvars.iv198 = phi i64 [ %indvars.iv198.unr.ph297, %.lr.ph134.split.us.new.preheader.new ], [ %indvars.iv.next199.1.1, %.lr.ph134.split.us.new ]
  %52 = phi double [ %.unr.ph298, %.lr.ph134.split.us.new.preheader.new ], [ %64, %.lr.ph134.split.us.new ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198, i64 %37
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %sunkaddr239, align 8
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199, i64 %37
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %sunkaddr239, align 8
  %indvars.iv.next199.1 = add nsw i64 %indvars.iv198, 2
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1, i64 %37
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %sunkaddr239.1, align 8
  %indvars.iv.next199.1299 = add nsw i64 %indvars.iv198, 3
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1299, i64 %37
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %sunkaddr239.1, align 8
  %indvars.iv.next199.1.1 = add nsw i64 %indvars.iv198, 4
  %exitcond201.1.1 = icmp eq i64 %indvars.iv.next199.1.1, %wide.trip.count200.1
  br i1 %exitcond201.1.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph134.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph134.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph134.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %sunkaddr239.lcssa = phi double* [ %sunkaddr239.lcssa.unr.ph, %.lr.ph134.split.us.new.prol.loopexit ], [ %sunkaddr239.1, %._crit_edge.us.loopexit.unr-lcssa ]
  %.lcssa295 = phi double [ %.lcssa295.unr.ph, %.lr.ph134.split.us.new.prol.loopexit ], [ %64, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit203.._crit_edge.us_crit_edge
  %sunkaddr147.pre-phi = phi double* [ %.pre282, %.prol.loopexit203.._crit_edge.us_crit_edge ], [ %sunkaddr239.lcssa, %._crit_edge.us.loopexit ]
  %.lcssa165 = phi double [ %.lcssa165.unr.ph, %.prol.loopexit203.._crit_edge.us_crit_edge ], [ %.lcssa295, %._crit_edge.us.loopexit ]
  %65 = fdiv double %.lcssa165, %2
  store double %65, double* %sunkaddr147.pre-phi, align 8
  %66 = add nsw i32 %storemerge132.us, 1
  %67 = icmp slt i32 %66, %0
  br i1 %67, label %.lr.ph134.split.us, label %.._crit_edge_crit_edge.loopexit

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit292:               ; preds = %.lr.ph134.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit292, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph128, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge89_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge89_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge89_crit_edge

.lr.ph128:                                        ; preds = %.lr.ph134.split.prol.loopexit, %.._crit_edge_crit_edge
  br i1 %9, label %.lr.ph128.split.us.preheader, label %.lr.ph128.split.preheader

.lr.ph128.split.us.preheader:                     ; preds = %.lr.ph128
  %xtraiter189 = and i32 %1, 1
  %wide.trip.count185.1 = zext i32 %1 to i64
  %68 = icmp eq i32 %xtraiter189, 0
  %69 = icmp eq i32 %1, 1
  %.pre283 = ptrtoint double* %6 to i64
  %sunkaddr244 = ptrtoint double* %5 to i64
  %sunkaddr248 = ptrtoint double* %6 to i64
  %70 = ptrtoint double* %6 to i64
  %71 = ptrtoint double* %5 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.preheader:                        ; preds = %.lr.ph128
  %xtraiter196 = and i32 %0, 1
  %lcmp.mod197 = icmp eq i32 %xtraiter196, 0
  br i1 %lcmp.mod197, label %.lr.ph128.split.prol.loopexit, label %.lr.ph128.split.prol

.lr.ph128.split.prol:                             ; preds = %.lr.ph128.split.preheader
  %72 = fdiv double 0.000000e+00, %2
  store double %72, double* %6, align 8
  %73 = tail call double @sqrt(double %72) #4
  %74 = fcmp ugt double %73, 1.000000e-01
  %75 = select i1 %74, double %73, double 1.000000e+00
  store double %75, double* %6, align 8
  br label %.lr.ph128.split.prol.loopexit

.lr.ph128.split.prol.loopexit:                    ; preds = %.lr.ph128.split.preheader, %.lr.ph128.split.prol
  %indvars.iv192.unr = phi i64 [ 0, %.lr.ph128.split.preheader ], [ 1, %.lr.ph128.split.prol ]
  %76 = icmp eq i32 %0, 1
  br i1 %76, label %._crit_edge.._crit_edge89_crit_edge, label %.lr.ph128.split.preheader217

.lr.ph128.split.preheader217:                     ; preds = %.lr.ph128.split.prol.loopexit
  %77 = fdiv double 0.000000e+00, %2
  %wide.trip.count194.1 = zext i32 %0 to i64
  br label %.lr.ph128.split

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %._crit_edge125.us
  %storemerge1127.us = phi i32 [ %103, %._crit_edge125.us ], [ 0, %.lr.ph128.split.us.preheader ]
  %78 = sext i32 %storemerge1127.us to i64
  %79 = getelementptr inbounds double, double* %6, i64 %78
  store double 0.000000e+00, double* %79, align 8
  br i1 %68, label %.prol.loopexit188, label %.prol.preheader187

.prol.preheader187:                               ; preds = %.lr.ph128.split.us
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %78
  %81 = load double, double* %80, align 8
  %sunkaddr149.prol = shl nsw i64 %78, 3
  %sunkaddr150.prol = add i64 %71, %sunkaddr149.prol
  %sunkaddr151.prol = inttoptr i64 %sunkaddr150.prol to double*
  %82 = load double, double* %sunkaddr151.prol, align 8
  %83 = fsub double %81, %82
  %84 = fmul double %83, %83
  %85 = fadd double %84, 0.000000e+00
  %sunkaddr154.prol = add i64 %70, %sunkaddr149.prol
  %sunkaddr155.prol = inttoptr i64 %sunkaddr154.prol to double*
  store double %85, double* %sunkaddr155.prol, align 8
  br label %.prol.loopexit188

.prol.loopexit188:                                ; preds = %.prol.preheader187, %.lr.ph128.split.us
  %indvars.iv183.unr.ph = phi i64 [ 1, %.prol.preheader187 ], [ 0, %.lr.ph128.split.us ]
  %.unr191.ph = phi double [ %85, %.prol.preheader187 ], [ 0.000000e+00, %.lr.ph128.split.us ]
  %.lcssa164.unr.ph = phi double [ %85, %.prol.preheader187 ], [ undef, %.lr.ph128.split.us ]
  br i1 %69, label %.prol.loopexit188.._crit_edge125.us_crit_edge, label %.lr.ph128.split.us.new.preheader

.lr.ph128.split.us.new.preheader:                 ; preds = %.prol.loopexit188
  %sunkaddr245 = shl nsw i64 %78, 3
  %sunkaddr246 = add i64 %sunkaddr244, %sunkaddr245
  %sunkaddr247 = inttoptr i64 %sunkaddr246 to double*
  %sunkaddr250 = add i64 %sunkaddr248, %sunkaddr245
  %sunkaddr251 = inttoptr i64 %sunkaddr250 to double*
  br label %.lr.ph128.split.us.new

.prol.loopexit188.._crit_edge125.us_crit_edge:    ; preds = %.prol.loopexit188
  %.pre285 = shl nsw i64 %78, 3
  %.pre286 = add i64 %.pre283, %.pre285
  %.pre287 = inttoptr i64 %.pre286 to double*
  br label %._crit_edge125.us

.lr.ph128.split.us.new:                           ; preds = %.lr.ph128.split.us.new.preheader, %.lr.ph128.split.us.new
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.1, %.lr.ph128.split.us.new ], [ %indvars.iv183.unr.ph, %.lr.ph128.split.us.new.preheader ]
  %86 = phi double [ %98, %.lr.ph128.split.us.new ], [ %.unr191.ph, %.lr.ph128.split.us.new.preheader ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv183, i64 %78
  %88 = load double, double* %87, align 8
  %89 = load double, double* %sunkaddr247, align 8
  %90 = fsub double %88, %89
  %91 = fmul double %90, %90
  %92 = fadd double %86, %91
  store double %92, double* %sunkaddr251, align 8
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next184, i64 %78
  %94 = load double, double* %93, align 8
  %95 = load double, double* %sunkaddr247, align 8
  %96 = fsub double %94, %95
  %97 = fmul double %96, %96
  %98 = fadd double %92, %97
  store double %98, double* %sunkaddr251, align 8
  %indvars.iv.next184.1 = add nsw i64 %indvars.iv183, 2
  %exitcond186.1 = icmp eq i64 %indvars.iv.next184.1, %wide.trip.count185.1
  br i1 %exitcond186.1, label %._crit_edge125.us.loopexit, label %.lr.ph128.split.us.new

._crit_edge125.us.loopexit:                       ; preds = %.lr.ph128.split.us.new
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %._crit_edge125.us.loopexit, %.prol.loopexit188.._crit_edge125.us_crit_edge
  %sunkaddr159.pre-phi = phi double* [ %.pre287, %.prol.loopexit188.._crit_edge125.us_crit_edge ], [ %sunkaddr251, %._crit_edge125.us.loopexit ]
  %.lcssa164 = phi double [ %.lcssa164.unr.ph, %.prol.loopexit188.._crit_edge125.us_crit_edge ], [ %98, %._crit_edge125.us.loopexit ]
  %99 = fdiv double %.lcssa164, %2
  store double %99, double* %sunkaddr159.pre-phi, align 8
  %100 = tail call double @sqrt(double %99) #4
  %101 = fcmp ugt double %100, 1.000000e-01
  %102 = select i1 %101, double %100, double 1.000000e+00
  store double %102, double* %sunkaddr159.pre-phi, align 8
  %103 = add nsw i32 %storemerge1127.us, 1
  %104 = icmp slt i32 %103, %0
  br i1 %104, label %.lr.ph128.split.us, label %._crit_edge.._crit_edge89_crit_edge.loopexit

.lr.ph134.split:                                  ; preds = %.lr.ph134.split.preheader291, %.lr.ph134.split
  %indvars.iv207 = phi i64 [ %indvars.iv.next208.3, %.lr.ph134.split ], [ %indvars.iv207.ph, %.lr.ph134.split.preheader291 ]
  %105 = getelementptr inbounds double, double* %5, i64 %indvars.iv207
  store double %18, double* %105, align 8
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %106 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208
  store double %18, double* %106, align 8
  %indvars.iv.next208.1 = add nsw i64 %indvars.iv207, 2
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.1
  store double %18, double* %107, align 8
  %indvars.iv.next208.2 = add nsw i64 %indvars.iv207, 3
  %108 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.2
  store double %18, double* %108, align 8
  %indvars.iv.next208.3 = add nsw i64 %indvars.iv207, 4
  %exitcond210.3 = icmp eq i64 %indvars.iv.next208.3, %wide.trip.count209.3
  br i1 %exitcond210.3, label %.._crit_edge_crit_edge.loopexit292, label %.lr.ph134.split, !llvm.loop !6

._crit_edge.._crit_edge89_crit_edge.loopexit:     ; preds = %._crit_edge125.us
  br label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge.loopexit290:  ; preds = %.lr.ph128.split
  br label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge:              ; preds = %._crit_edge.._crit_edge89_crit_edge.loopexit290, %._crit_edge.._crit_edge89_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge89_crit_edge_crit_edge, %7, %.lr.ph128.split.prol.loopexit
  %109 = icmp sgt i32 %1, 0
  br i1 %109, label %._crit_edge89.._crit_edge91_crit_edge.lr.ph, label %._crit_edge89.._crit_edge92_crit_edge

._crit_edge89.._crit_edge91_crit_edge.lr.ph:      ; preds = %._crit_edge.._crit_edge89_crit_edge
  br i1 %8, label %._crit_edge89.._crit_edge91_crit_edge.us.preheader, label %._crit_edge89.._crit_edge92_crit_edge.thread

._crit_edge89.._crit_edge91_crit_edge.us.preheader: ; preds = %._crit_edge89.._crit_edge91_crit_edge.lr.ph
  %wide.trip.count180 = zext i32 %0 to i64
  br label %._crit_edge89.._crit_edge91_crit_edge.us

._crit_edge89.._crit_edge92_crit_edge.thread:     ; preds = %._crit_edge89.._crit_edge91_crit_edge.lr.ph
  %110 = add nsw i32 %0, -1
  br label %._crit_edge92._crit_edge

._crit_edge89.._crit_edge91_crit_edge.us:         ; preds = %._crit_edge89.._crit_edge91_crit_edge.us.preheader, %._crit_edge91._crit_edge.us
  %storemerge2121.us = phi i32 [ %123, %._crit_edge91._crit_edge.us ], [ 0, %._crit_edge89.._crit_edge91_crit_edge.us.preheader ]
  %111 = sext i32 %storemerge2121.us to i64
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %._crit_edge89.._crit_edge91_crit_edge.us
  %indvars.iv178 = phi i64 [ 0, %._crit_edge89.._crit_edge91_crit_edge.us ], [ %indvars.iv.next179, %._crit_edge91.us ]
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv178
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %111, i64 %indvars.iv178
  %115 = load double, double* %114, align 8
  %116 = fsub double %115, %113
  store double %116, double* %114, align 8
  %117 = tail call double @sqrt(double %2) #4
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv178
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = load double, double* %114, align 8
  %122 = fdiv double %121, %120
  store double %122, double* %114, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next179, %wide.trip.count180
  br i1 %exitcond181, label %._crit_edge91._crit_edge.us, label %._crit_edge91.us

._crit_edge91._crit_edge.us:                      ; preds = %._crit_edge91.us
  %123 = add nsw i32 %storemerge2121.us, 1
  %124 = icmp slt i32 %123, %1
  br i1 %124, label %._crit_edge89.._crit_edge91_crit_edge.us, label %._crit_edge89.._crit_edge92_crit_edge.loopexit

.lr.ph128.split:                                  ; preds = %.lr.ph128.split.preheader217, %.lr.ph128.split
  %indvars.iv192 = phi i64 [ %indvars.iv.next193.1, %.lr.ph128.split ], [ %indvars.iv192.unr, %.lr.ph128.split.preheader217 ]
  %125 = getelementptr inbounds double, double* %6, i64 %indvars.iv192
  store double %77, double* %125, align 8
  %126 = tail call double @sqrt(double %77) #4
  %127 = fcmp ugt double %126, 1.000000e-01
  %128 = select i1 %127, double %126, double 1.000000e+00
  store double %128, double* %125, align 8
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1
  %129 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next193
  store double %77, double* %129, align 8
  %130 = tail call double @sqrt(double %77) #4
  %131 = fcmp ugt double %130, 1.000000e-01
  %132 = select i1 %131, double %130, double 1.000000e+00
  store double %132, double* %129, align 8
  %indvars.iv.next193.1 = add nsw i64 %indvars.iv192, 2
  %exitcond195.1 = icmp eq i64 %indvars.iv.next193.1, %wide.trip.count194.1
  br i1 %exitcond195.1, label %._crit_edge.._crit_edge89_crit_edge.loopexit290, label %.lr.ph128.split

._crit_edge89.._crit_edge92_crit_edge.loopexit:   ; preds = %._crit_edge91._crit_edge.us
  br label %._crit_edge89.._crit_edge92_crit_edge

._crit_edge89.._crit_edge92_crit_edge:            ; preds = %._crit_edge89.._crit_edge92_crit_edge.loopexit, %._crit_edge.._crit_edge89_crit_edge
  %133 = add nsw i32 %0, -1
  %134 = icmp sgt i32 %0, 1
  br i1 %134, label %.lr.ph109, label %._crit_edge92._crit_edge

.lr.ph109:                                        ; preds = %._crit_edge89.._crit_edge92_crit_edge
  br i1 %109, label %.lr.ph109.split.us.preheader, label %.lr.ph109.split.preheader

.lr.ph109.split.us.preheader:                     ; preds = %.lr.ph109
  %xtraiter = and i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %135 = icmp eq i32 %xtraiter, 0
  %136 = icmp eq i32 %1, 1
  %sunkaddr260 = ptrtoint [1200 x double]* %3 to i64
  br label %.lr.ph109.split.us

.lr.ph109.split.preheader:                        ; preds = %.lr.ph109
  %137 = zext i32 %133 to i64
  %138 = add i32 %0, -2
  %139 = zext i32 %138 to i64
  %wide.trip.count170.3 = zext i32 %0 to i64
  br label %.lr.ph109.split

.lr.ph109.split.us:                               ; preds = %.lr.ph109.split.us.preheader, %._crit_edge92.us
  %storemerge3108.us = phi i32 [ %storemerge4103.us, %._crit_edge92.us ], [ 0, %.lr.ph109.split.us.preheader ]
  %140 = sext i32 %storemerge3108.us to i64
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %140, i64 %140
  store double 1.000000e+00, double* %141, align 8
  %storemerge4103.us = add nsw i32 %storemerge3108.us, 1
  %142 = icmp slt i32 %storemerge4103.us, %0
  br i1 %142, label %.lr.ph.us.us.preheader, label %._crit_edge92.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph109.split.us
  %sunkaddr261 = shl nsw i64 %140, 3
  %sunkaddr262 = add i64 %sunkaddr260, %sunkaddr261
  %sunkaddr263 = inttoptr i64 %sunkaddr262 to double*
  br label %.lr.ph.us.us

._crit_edge92.us.loopexit:                        ; preds = %._crit_edge101.us.us
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.loopexit, %.lr.ph109.split.us
  %143 = icmp slt i32 %storemerge4103.us, %133
  br i1 %143, label %.lr.ph109.split.us, label %._crit_edge92._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge101.us.us
  %storemerge4104.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge101.us.us ], [ %storemerge4103.us, %.lr.ph.us.us.preheader ]
  %144 = sext i32 %storemerge4104.us.us to i64
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %140, i64 %144
  store double 0.000000e+00, double* %145, align 8
  br i1 %135, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %146 = load double, double* %sunkaddr263, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %144
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fadd double %149, 0.000000e+00
  store double %150, double* %145, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %150, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %150, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %136, label %._crit_edge101.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge101.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge101.us.us

._crit_edge101.us.us:                             ; preds = %._crit_edge101.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %165, %._crit_edge101.us.us.loopexit ]
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %144, i64 %140
  store double %.lcssa, double* %151, align 8
  %storemerge4.us.us = add nsw i32 %storemerge4104.us.us, 1
  %152 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %152, label %.lr.ph.us.us, label %._crit_edge92.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %153 = phi double [ %165, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %140
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %144
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %153, %158
  store double %159, double* %145, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %140
  %161 = load double, double* %160, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %144
  %163 = load double, double* %162, align 8
  %164 = fmul double %161, %163
  %165 = fadd double %159, %164
  store double %165, double* %145, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge101.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph109.split:                                  ; preds = %._crit_edge92, %.lr.ph109.split.preheader
  %indvar = phi i64 [ 0, %.lr.ph109.split.preheader ], [ %indvar.next, %._crit_edge92 ]
  %indvars.iv166 = phi i64 [ 1, %.lr.ph109.split.preheader ], [ %indvars.iv.next167, %._crit_edge92 ]
  %storemerge3108 = phi i32 [ 0, %.lr.ph109.split.preheader ], [ %storemerge4103, %._crit_edge92 ]
  %166 = sub i64 %139, %indvar
  %167 = trunc i64 %166 to i32
  %168 = sext i32 %storemerge3108 to i64
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %168, i64 %168
  store double 1.000000e+00, double* %169, align 8
  %storemerge4103 = add nsw i32 %storemerge3108, 1
  %170 = icmp slt i32 %storemerge4103, %0
  br i1 %170, label %.lr.ph106.split.preheader, label %._crit_edge92

.lr.ph106.split.preheader:                        ; preds = %.lr.ph109.split
  %171 = sub i64 %137, %indvar
  %172 = trunc i64 %171 to i32
  %xtraiter173 = and i32 %172, 3
  %lcmp.mod174 = icmp eq i32 %xtraiter173, 0
  br i1 %lcmp.mod174, label %.lr.ph106.split.prol.loopexit, label %.lr.ph106.split.prol.preheader

.lr.ph106.split.prol.preheader:                   ; preds = %.lr.ph106.split.preheader
  br label %.lr.ph106.split.prol

.lr.ph106.split.prol:                             ; preds = %.lr.ph106.split.prol.preheader, %.lr.ph106.split.prol
  %indvars.iv168.prol = phi i64 [ %indvars.iv.next169.prol, %.lr.ph106.split.prol ], [ %indvars.iv166, %.lr.ph106.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph106.split.prol ], [ %xtraiter173, %.lr.ph106.split.prol.preheader ]
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %168, i64 %indvars.iv168.prol
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv168.prol, i64 %168
  %175 = bitcast double* %174 to i64*
  store i64 0, i64* %175, align 8
  %indvars.iv.next169.prol = add nuw nsw i64 %indvars.iv168.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph106.split.prol.loopexit.loopexit, label %.lr.ph106.split.prol, !llvm.loop !8

.lr.ph106.split.prol.loopexit.loopexit:           ; preds = %.lr.ph106.split.prol
  br label %.lr.ph106.split.prol.loopexit

.lr.ph106.split.prol.loopexit:                    ; preds = %.lr.ph106.split.prol.loopexit.loopexit, %.lr.ph106.split.preheader
  %indvars.iv168.unr = phi i64 [ %indvars.iv166, %.lr.ph106.split.preheader ], [ %indvars.iv.next169.prol, %.lr.ph106.split.prol.loopexit.loopexit ]
  %176 = icmp ult i32 %167, 3
  br i1 %176, label %._crit_edge92, label %.lr.ph106.split.preheader288

.lr.ph106.split.preheader288:                     ; preds = %.lr.ph106.split.prol.loopexit
  br label %.lr.ph106.split

.lr.ph106.split:                                  ; preds = %.lr.ph106.split.preheader288, %.lr.ph106.split
  %indvars.iv168 = phi i64 [ %indvars.iv.next169.3, %.lr.ph106.split ], [ %indvars.iv168.unr, %.lr.ph106.split.preheader288 ]
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %168, i64 %indvars.iv168
  store double 0.000000e+00, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv168, i64 %168
  %179 = bitcast double* %178 to i64*
  store i64 0, i64* %179, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %168, i64 %indvars.iv.next169
  store double 0.000000e+00, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169, i64 %168
  %182 = bitcast double* %181 to i64*
  store i64 0, i64* %182, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %168, i64 %indvars.iv.next169.1
  store double 0.000000e+00, double* %183, align 8
  %184 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169.1, i64 %168
  %185 = bitcast double* %184 to i64*
  store i64 0, i64* %185, align 8
  %indvars.iv.next169.2 = add nsw i64 %indvars.iv168, 3
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %168, i64 %indvars.iv.next169.2
  store double 0.000000e+00, double* %186, align 8
  %187 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169.2, i64 %168
  %188 = bitcast double* %187 to i64*
  store i64 0, i64* %188, align 8
  %indvars.iv.next169.3 = add nsw i64 %indvars.iv168, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next169.3, %wide.trip.count170.3
  br i1 %exitcond.3, label %._crit_edge92.loopexit, label %.lr.ph106.split

._crit_edge92.loopexit:                           ; preds = %.lr.ph106.split
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %.lr.ph106.split.prol.loopexit, %.lr.ph109.split
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %137
  br i1 %exitcond, label %._crit_edge92._crit_edge.loopexit289, label %.lr.ph109.split

._crit_edge92._crit_edge.loopexit:                ; preds = %._crit_edge92.us
  br label %._crit_edge92._crit_edge

._crit_edge92._crit_edge.loopexit289:             ; preds = %._crit_edge92
  br label %._crit_edge92._crit_edge

._crit_edge92._crit_edge:                         ; preds = %._crit_edge92._crit_edge.loopexit289, %._crit_edge92._crit_edge.loopexit, %._crit_edge89.._crit_edge92_crit_edge.thread, %._crit_edge89.._crit_edge92_crit_edge
  %189 = phi i32 [ %110, %._crit_edge89.._crit_edge92_crit_edge.thread ], [ %133, %._crit_edge89.._crit_edge92_crit_edge ], [ %133, %._crit_edge92._crit_edge.loopexit ], [ %133, %._crit_edge92._crit_edge.loopexit289 ]
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %190, i64 %190
  store double 1.000000e+00, double* %191, align 8
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
  br i1 %7, label %.._crit_edge_crit_edge.us.preheader, label %._crit_edge

.._crit_edge_crit_edge.us.preheader:              ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %.._crit_edge_crit_edge.us.preheader, %._crit_edge._crit_edge.us
  %storemerge11.us = phi i32 [ %22, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %8 = mul nsw i32 %storemerge11.us, %0
  %9 = sext i32 %storemerge11.us to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge9.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge9.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %11

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge9.us
  %22 = add nsw i32 %storemerge11.us, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %.._crit_edge_crit_edge.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
