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
  br i1 %8, label %.lr.ph134, label %._crit_edge.._crit_edge9_crit_edge

.lr.ph134:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph134.split.us.preheader, label %.lr.ph134.split.preheader

.lr.ph134.split.us.preheader:                     ; preds = %.lr.ph134
  %xtraiter204 = and i32 %1, 1
  %lcmp.mod205 = icmp eq i32 %xtraiter204, 0
  %10 = icmp eq i32 %1, 1
  %sunkaddr144 = ptrtoint double* %5 to i64
  %wide.trip.count200.1 = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count200.1, -2
  br label %.lr.ph134.split.us

.lr.ph134.split.preheader:                        ; preds = %.lr.ph134
  %12 = add i32 %0, -1
  %xtraiter211 = and i32 %0, 3
  %lcmp.mod212 = icmp eq i32 %xtraiter211, 0
  br i1 %lcmp.mod212, label %.lr.ph134.split.prol.loopexit, label %.lr.ph134.split.prol.preheader

.lr.ph134.split.prol.preheader:                   ; preds = %.lr.ph134.split.preheader
  %13 = fdiv double 0.000000e+00, %2
  br label %.lr.ph134.split.prol

.lr.ph134.split.prol:                             ; preds = %.lr.ph134.split.prol.preheader, %.lr.ph134.split.prol
  %indvars.iv207.prol = phi i64 [ %indvars.iv.next208.prol, %.lr.ph134.split.prol ], [ 0, %.lr.ph134.split.prol.preheader ]
  %prol.iter213 = phi i32 [ %prol.iter213.sub, %.lr.ph134.split.prol ], [ %xtraiter211, %.lr.ph134.split.prol.preheader ]
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv207.prol
  store double %13, double* %14, align 8
  %indvars.iv.next208.prol = add nuw nsw i64 %indvars.iv207.prol, 1
  %prol.iter213.sub = add i32 %prol.iter213, -1
  %prol.iter213.cmp = icmp eq i32 %prol.iter213.sub, 0
  br i1 %prol.iter213.cmp, label %.lr.ph134.split.prol.loopexit.loopexit, label %.lr.ph134.split.prol, !llvm.loop !1

.lr.ph134.split.prol.loopexit.loopexit:           ; preds = %.lr.ph134.split.prol
  br label %.lr.ph134.split.prol.loopexit

.lr.ph134.split.prol.loopexit:                    ; preds = %.lr.ph134.split.prol.loopexit.loopexit, %.lr.ph134.split.preheader
  %indvars.iv207.unr = phi i64 [ 0, %.lr.ph134.split.preheader ], [ %indvars.iv.next208.prol, %.lr.ph134.split.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %12, 3
  br i1 %15, label %.lr.ph128, label %.lr.ph134.split.preheader219

.lr.ph134.split.preheader219:                     ; preds = %.lr.ph134.split.prol.loopexit
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count209.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count209.3, -4
  %18 = sub i64 %17, %indvars.iv207.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph134.split.preheader249, label %min.iters.checked

.lr.ph134.split.preheader249:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph134.split.preheader219
  %indvars.iv207.ph = phi i64 [ %indvars.iv207.unr, %min.iters.checked ], [ %indvars.iv207.unr, %.lr.ph134.split.preheader219 ], [ %ind.end, %middle.block ]
  br label %.lr.ph134.split

min.iters.checked:                                ; preds = %.lr.ph134.split.preheader219
  %n.mod.vf = and i64 %20, 3
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = shl nuw i64 %19, 2
  %22 = add i64 %indvars.iv207.unr, %21
  %23 = add i64 %22, 4
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %.lr.ph134.split.preheader249, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert232 = insertelement <2 x double> undef, double %16, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert232, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv207.unr, %25
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
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph134.split.preheader249

.lr.ph134.split.us:                               ; preds = %.lr.ph134.split.us.preheader, %._crit_edge.us
  %storemerge132.us = phi i32 [ %64, %._crit_edge.us ], [ 0, %.lr.ph134.split.us.preheader ]
  %35 = sext i32 %storemerge132.us to i64
  %36 = getelementptr inbounds double, double* %5, i64 %35
  store double 0.000000e+00, double* %36, align 8
  br i1 %lcmp.mod205, label %.prol.loopexit203, label %.prol.preheader202

.prol.preheader202:                               ; preds = %.lr.ph134.split.us
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %35
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, 0.000000e+00
  %sunkaddr141.prol = shl nsw i64 %35, 3
  %sunkaddr142.prol = add i64 %sunkaddr144, %sunkaddr141.prol
  %sunkaddr143.prol = inttoptr i64 %sunkaddr142.prol to double*
  store double %39, double* %sunkaddr143.prol, align 8
  br label %.prol.loopexit203

.prol.loopexit203:                                ; preds = %.prol.preheader202, %.lr.ph134.split.us
  %indvars.iv198.unr.ph = phi i64 [ 1, %.prol.preheader202 ], [ 0, %.lr.ph134.split.us ]
  %.unr206.ph = phi double [ %39, %.prol.preheader202 ], [ 0.000000e+00, %.lr.ph134.split.us ]
  %.lcssa165.unr.ph = phi double [ %39, %.prol.preheader202 ], [ undef, %.lr.ph134.split.us ]
  br i1 %10, label %.prol.loopexit203.._crit_edge.us_crit_edge, label %.lr.ph134.split.us.new.preheader

.prol.loopexit203.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit203
  %.pre = shl nsw i64 %35, 3
  %.pre241 = add i64 %sunkaddr144, %.pre
  %.pre242 = inttoptr i64 %.pre241 to double*
  br label %._crit_edge.us

.lr.ph134.split.us.new.preheader:                 ; preds = %.prol.loopexit203
  %sunkaddr141 = shl nsw i64 %35, 3
  %sunkaddr142 = add i64 %sunkaddr144, %sunkaddr141
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to double*
  %40 = sub nsw i64 %11, %indvars.iv198.unr.ph
  %41 = lshr i64 %40, 1
  %42 = and i64 %41, 1
  %lcmp.mod255 = icmp eq i64 %42, 0
  br i1 %lcmp.mod255, label %.lr.ph134.split.us.new.prol.preheader, label %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa

.lr.ph134.split.us.new.prol.preheader:            ; preds = %.lr.ph134.split.us.new.preheader
  br label %.lr.ph134.split.us.new.prol

.lr.ph134.split.us.new.prol:                      ; preds = %.lr.ph134.split.us.new.prol.preheader
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198.unr.ph, i64 %35
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %.unr206.ph
  store double %45, double* %sunkaddr143, align 8
  %indvars.iv.next199.prol = add nuw nsw i64 %indvars.iv198.unr.ph, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.prol, i64 %35
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %sunkaddr143, align 8
  %indvars.iv.next199.1.prol = or i64 %indvars.iv198.unr.ph, 2
  br label %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa

.lr.ph134.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph134.split.us.new.preheader, %.lr.ph134.split.us.new.prol
  %.lcssa253.unr.ph = phi double [ %48, %.lr.ph134.split.us.new.prol ], [ undef, %.lr.ph134.split.us.new.preheader ]
  %indvars.iv198.unr.ph256 = phi i64 [ %indvars.iv.next199.1.prol, %.lr.ph134.split.us.new.prol ], [ %indvars.iv198.unr.ph, %.lr.ph134.split.us.new.preheader ]
  %.unr.ph257 = phi double [ %48, %.lr.ph134.split.us.new.prol ], [ %.unr206.ph, %.lr.ph134.split.us.new.preheader ]
  br label %.lr.ph134.split.us.new.prol.loopexit

.lr.ph134.split.us.new.prol.loopexit:             ; preds = %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa
  %49 = icmp eq i64 %41, 0
  br i1 %49, label %._crit_edge.us.loopexit, label %.lr.ph134.split.us.new.preheader.new

.lr.ph134.split.us.new.preheader.new:             ; preds = %.lr.ph134.split.us.new.prol.loopexit
  br label %.lr.ph134.split.us.new

.lr.ph134.split.us.new:                           ; preds = %.lr.ph134.split.us.new, %.lr.ph134.split.us.new.preheader.new
  %indvars.iv198 = phi i64 [ %indvars.iv198.unr.ph256, %.lr.ph134.split.us.new.preheader.new ], [ %indvars.iv.next199.1.1, %.lr.ph134.split.us.new ]
  %50 = phi double [ %.unr.ph257, %.lr.ph134.split.us.new.preheader.new ], [ %62, %.lr.ph134.split.us.new ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198, i64 %35
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %sunkaddr143, align 8
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199, i64 %35
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %sunkaddr143, align 8
  %indvars.iv.next199.1 = add nsw i64 %indvars.iv198, 2
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1, i64 %35
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %sunkaddr143, align 8
  %indvars.iv.next199.1258 = add nsw i64 %indvars.iv198, 3
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1258, i64 %35
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %sunkaddr143, align 8
  %indvars.iv.next199.1.1 = add nsw i64 %indvars.iv198, 4
  %exitcond201.1.1 = icmp eq i64 %indvars.iv.next199.1.1, %wide.trip.count200.1
  br i1 %exitcond201.1.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph134.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph134.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph134.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %.lcssa253 = phi double [ %.lcssa253.unr.ph, %.lr.ph134.split.us.new.prol.loopexit ], [ %62, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit203.._crit_edge.us_crit_edge
  %sunkaddr147.pre-phi = phi double* [ %.pre242, %.prol.loopexit203.._crit_edge.us_crit_edge ], [ %sunkaddr143, %._crit_edge.us.loopexit ]
  %.lcssa165 = phi double [ %.lcssa165.unr.ph, %.prol.loopexit203.._crit_edge.us_crit_edge ], [ %.lcssa253, %._crit_edge.us.loopexit ]
  %63 = fdiv double %.lcssa165, %2
  store double %63, double* %sunkaddr147.pre-phi, align 8
  %64 = add nsw i32 %storemerge132.us, 1
  %65 = icmp slt i32 %64, %0
  br i1 %65, label %.lr.ph134.split.us, label %.._crit_edge_crit_edge.loopexit

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit250:               ; preds = %.lr.ph134.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit250, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph128, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge9_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge9_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge9_crit_edge

.lr.ph128:                                        ; preds = %.lr.ph134.split.prol.loopexit, %.._crit_edge_crit_edge
  br i1 %9, label %.lr.ph128.split.us.preheader, label %.lr.ph128.split.preheader

.lr.ph128.split.us.preheader:                     ; preds = %.lr.ph128
  %xtraiter189 = and i32 %1, 1
  %lcmp.mod190 = icmp eq i32 %xtraiter189, 0
  %66 = icmp eq i32 %1, 1
  %sunkaddr156 = ptrtoint double* %6 to i64
  %sunkaddr148 = ptrtoint double* %5 to i64
  %wide.trip.count185.1 = zext i32 %1 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.preheader:                        ; preds = %.lr.ph128
  %xtraiter196 = and i32 %0, 1
  %lcmp.mod197 = icmp eq i32 %xtraiter196, 0
  br i1 %lcmp.mod197, label %.lr.ph128.split.prol.loopexit, label %.lr.ph128.split.prol

.lr.ph128.split.prol:                             ; preds = %.lr.ph128.split.preheader
  %67 = fdiv double 0.000000e+00, %2
  store double %67, double* %6, align 8
  %68 = tail call double @sqrt(double %67) #4
  %69 = fcmp ugt double %68, 1.000000e-01
  %70 = select i1 %69, double %68, double 1.000000e+00
  store double %70, double* %6, align 8
  br label %.lr.ph128.split.prol.loopexit

.lr.ph128.split.prol.loopexit:                    ; preds = %.lr.ph128.split.preheader, %.lr.ph128.split.prol
  %indvars.iv192.unr = phi i64 [ 0, %.lr.ph128.split.preheader ], [ 1, %.lr.ph128.split.prol ]
  %71 = icmp eq i32 %0, 1
  br i1 %71, label %._crit_edge.._crit_edge9_crit_edge, label %.lr.ph128.split.preheader217

.lr.ph128.split.preheader217:                     ; preds = %.lr.ph128.split.prol.loopexit
  %72 = fdiv double 0.000000e+00, %2
  %wide.trip.count194.1 = zext i32 %0 to i64
  br label %.lr.ph128.split

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %._crit_edge125.us
  %storemerge1127.us = phi i32 [ %98, %._crit_edge125.us ], [ 0, %.lr.ph128.split.us.preheader ]
  %73 = sext i32 %storemerge1127.us to i64
  %74 = getelementptr inbounds double, double* %6, i64 %73
  store double 0.000000e+00, double* %74, align 8
  br i1 %lcmp.mod190, label %.prol.loopexit188, label %.prol.preheader187

.prol.preheader187:                               ; preds = %.lr.ph128.split.us
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %73
  %76 = load double, double* %75, align 8
  %sunkaddr149.prol = shl nsw i64 %73, 3
  %sunkaddr150.prol = add i64 %sunkaddr148, %sunkaddr149.prol
  %sunkaddr151.prol = inttoptr i64 %sunkaddr150.prol to double*
  %77 = load double, double* %sunkaddr151.prol, align 8
  %78 = fsub double %76, %77
  %79 = fmul double %78, %78
  %80 = fadd double %79, 0.000000e+00
  %sunkaddr154.prol = add i64 %sunkaddr156, %sunkaddr149.prol
  %sunkaddr155.prol = inttoptr i64 %sunkaddr154.prol to double*
  store double %80, double* %sunkaddr155.prol, align 8
  br label %.prol.loopexit188

.prol.loopexit188:                                ; preds = %.prol.preheader187, %.lr.ph128.split.us
  %indvars.iv183.unr.ph = phi i64 [ 1, %.prol.preheader187 ], [ 0, %.lr.ph128.split.us ]
  %.unr191.ph = phi double [ %80, %.prol.preheader187 ], [ 0.000000e+00, %.lr.ph128.split.us ]
  %.lcssa164.unr.ph = phi double [ %80, %.prol.preheader187 ], [ undef, %.lr.ph128.split.us ]
  br i1 %66, label %.prol.loopexit188.._crit_edge125.us_crit_edge, label %.lr.ph128.split.us.new.preheader

.prol.loopexit188.._crit_edge125.us_crit_edge:    ; preds = %.prol.loopexit188
  %.pre243 = shl nsw i64 %73, 3
  %.pre244 = add i64 %sunkaddr156, %.pre243
  %.pre245 = inttoptr i64 %.pre244 to double*
  br label %._crit_edge125.us

.lr.ph128.split.us.new.preheader:                 ; preds = %.prol.loopexit188
  %sunkaddr149 = shl nsw i64 %73, 3
  %sunkaddr150 = add i64 %sunkaddr148, %sunkaddr149
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  %sunkaddr154 = add i64 %sunkaddr156, %sunkaddr149
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to double*
  br label %.lr.ph128.split.us.new

.lr.ph128.split.us.new:                           ; preds = %.lr.ph128.split.us.new.preheader, %.lr.ph128.split.us.new
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.1, %.lr.ph128.split.us.new ], [ %indvars.iv183.unr.ph, %.lr.ph128.split.us.new.preheader ]
  %81 = phi double [ %93, %.lr.ph128.split.us.new ], [ %.unr191.ph, %.lr.ph128.split.us.new.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv183, i64 %73
  %83 = load double, double* %82, align 8
  %84 = load double, double* %sunkaddr151, align 8
  %85 = fsub double %83, %84
  %86 = fmul double %85, %85
  %87 = fadd double %81, %86
  store double %87, double* %sunkaddr155, align 8
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next184, i64 %73
  %89 = load double, double* %88, align 8
  %90 = load double, double* %sunkaddr151, align 8
  %91 = fsub double %89, %90
  %92 = fmul double %91, %91
  %93 = fadd double %87, %92
  store double %93, double* %sunkaddr155, align 8
  %indvars.iv.next184.1 = add nsw i64 %indvars.iv183, 2
  %exitcond186.1 = icmp eq i64 %indvars.iv.next184.1, %wide.trip.count185.1
  br i1 %exitcond186.1, label %._crit_edge125.us.loopexit, label %.lr.ph128.split.us.new

._crit_edge125.us.loopexit:                       ; preds = %.lr.ph128.split.us.new
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %._crit_edge125.us.loopexit, %.prol.loopexit188.._crit_edge125.us_crit_edge
  %sunkaddr159.pre-phi = phi double* [ %.pre245, %.prol.loopexit188.._crit_edge125.us_crit_edge ], [ %sunkaddr155, %._crit_edge125.us.loopexit ]
  %.lcssa164 = phi double [ %.lcssa164.unr.ph, %.prol.loopexit188.._crit_edge125.us_crit_edge ], [ %93, %._crit_edge125.us.loopexit ]
  %94 = fdiv double %.lcssa164, %2
  store double %94, double* %sunkaddr159.pre-phi, align 8
  %95 = tail call double @sqrt(double %94) #4
  %96 = fcmp ugt double %95, 1.000000e-01
  %97 = select i1 %96, double %95, double 1.000000e+00
  store double %97, double* %sunkaddr159.pre-phi, align 8
  %98 = add nsw i32 %storemerge1127.us, 1
  %99 = icmp slt i32 %98, %0
  br i1 %99, label %.lr.ph128.split.us, label %._crit_edge.._crit_edge9_crit_edge.loopexit

.lr.ph134.split:                                  ; preds = %.lr.ph134.split.preheader249, %.lr.ph134.split
  %indvars.iv207 = phi i64 [ %indvars.iv.next208.3, %.lr.ph134.split ], [ %indvars.iv207.ph, %.lr.ph134.split.preheader249 ]
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv207
  store double %16, double* %100, align 8
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208
  store double %16, double* %101, align 8
  %indvars.iv.next208.1 = add nsw i64 %indvars.iv207, 2
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.1
  store double %16, double* %102, align 8
  %indvars.iv.next208.2 = add nsw i64 %indvars.iv207, 3
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.2
  store double %16, double* %103, align 8
  %indvars.iv.next208.3 = add nsw i64 %indvars.iv207, 4
  %exitcond210.3 = icmp eq i64 %indvars.iv.next208.3, %wide.trip.count209.3
  br i1 %exitcond210.3, label %.._crit_edge_crit_edge.loopexit250, label %.lr.ph134.split, !llvm.loop !6

._crit_edge.._crit_edge9_crit_edge.loopexit:      ; preds = %._crit_edge125.us
  br label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge.loopexit248:   ; preds = %.lr.ph128.split
  br label %._crit_edge.._crit_edge9_crit_edge

._crit_edge.._crit_edge9_crit_edge:               ; preds = %._crit_edge.._crit_edge9_crit_edge.loopexit248, %._crit_edge.._crit_edge9_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge9_crit_edge_crit_edge, %7, %.lr.ph128.split.prol.loopexit
  %104 = icmp sgt i32 %1, 0
  br i1 %104, label %._crit_edge9.._crit_edge11_crit_edge.lr.ph, label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge11_crit_edge.lr.ph:       ; preds = %._crit_edge.._crit_edge9_crit_edge
  br i1 %8, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %._crit_edge9.._crit_edge12_crit_edge.thread

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge9.._crit_edge11_crit_edge.lr.ph
  %wide.trip.count180 = zext i32 %0 to i64
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge12_crit_edge.thread:      ; preds = %._crit_edge9.._crit_edge11_crit_edge.lr.ph
  %105 = add nsw i32 %0, -1
  br label %._crit_edge12._crit_edge

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge9.._crit_edge11_crit_edge.us.preheader, %._crit_edge11._crit_edge.us
  %storemerge2121.us = phi i32 [ %118, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %106 = sext i32 %storemerge2121.us to i64
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv178 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next179, %._crit_edge11.us ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv178
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %106, i64 %indvars.iv178
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %112 = tail call double @sqrt(double %2) #4
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv178
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = load double, double* %109, align 8
  %117 = fdiv double %116, %115
  store double %117, double* %109, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next179, %wide.trip.count180
  br i1 %exitcond181, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %118 = add nsw i32 %storemerge2121.us, 1
  %119 = icmp slt i32 %118, %1
  br i1 %119, label %._crit_edge9.._crit_edge11_crit_edge.us, label %._crit_edge9.._crit_edge12_crit_edge.loopexit

.lr.ph128.split:                                  ; preds = %.lr.ph128.split.preheader217, %.lr.ph128.split
  %indvars.iv192 = phi i64 [ %indvars.iv.next193.1, %.lr.ph128.split ], [ %indvars.iv192.unr, %.lr.ph128.split.preheader217 ]
  %120 = getelementptr inbounds double, double* %6, i64 %indvars.iv192
  store double %72, double* %120, align 8
  %121 = tail call double @sqrt(double %72) #4
  %122 = fcmp ugt double %121, 1.000000e-01
  %123 = select i1 %122, double %121, double 1.000000e+00
  store double %123, double* %120, align 8
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1
  %124 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next193
  store double %72, double* %124, align 8
  %125 = tail call double @sqrt(double %72) #4
  %126 = fcmp ugt double %125, 1.000000e-01
  %127 = select i1 %126, double %125, double 1.000000e+00
  store double %127, double* %124, align 8
  %indvars.iv.next193.1 = add nsw i64 %indvars.iv192, 2
  %exitcond195.1 = icmp eq i64 %indvars.iv.next193.1, %wide.trip.count194.1
  br i1 %exitcond195.1, label %._crit_edge.._crit_edge9_crit_edge.loopexit248, label %.lr.ph128.split

._crit_edge9.._crit_edge12_crit_edge.loopexit:    ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge12_crit_edge:             ; preds = %._crit_edge9.._crit_edge12_crit_edge.loopexit, %._crit_edge.._crit_edge9_crit_edge
  %128 = add nsw i32 %0, -1
  %129 = icmp sgt i32 %0, 1
  br i1 %129, label %.lr.ph109, label %._crit_edge12._crit_edge

.lr.ph109:                                        ; preds = %._crit_edge9.._crit_edge12_crit_edge
  br i1 %104, label %.lr.ph109.split.us.preheader, label %.lr.ph109.split.preheader

.lr.ph109.split.us.preheader:                     ; preds = %.lr.ph109
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %130 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph109.split.us

.lr.ph109.split.preheader:                        ; preds = %.lr.ph109
  %131 = zext i32 %128 to i64
  %132 = add i32 %0, -2
  %133 = zext i32 %132 to i64
  %wide.trip.count170.3 = zext i32 %0 to i64
  br label %.lr.ph109.split

.lr.ph109.split.us:                               ; preds = %.lr.ph109.split.us.preheader, %._crit_edge12.us
  %storemerge3108.us = phi i32 [ %storemerge4103.us, %._crit_edge12.us ], [ 0, %.lr.ph109.split.us.preheader ]
  %134 = sext i32 %storemerge3108.us to i64
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %134, i64 %134
  store double 1.000000e+00, double* %135, align 8
  %storemerge4103.us = add nsw i32 %storemerge3108.us, 1
  %136 = icmp slt i32 %storemerge4103.us, %0
  br i1 %136, label %.lr.ph.us.us.preheader, label %._crit_edge12.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph109.split.us
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %134
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge101.us.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.lr.ph109.split.us
  %138 = icmp slt i32 %storemerge4103.us, %128
  br i1 %138, label %.lr.ph109.split.us, label %._crit_edge12._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge101.us.us
  %storemerge4104.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge101.us.us ], [ %storemerge4103.us, %.lr.ph.us.us.preheader ]
  %139 = sext i32 %storemerge4104.us.us to i64
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %134, i64 %139
  store double 0.000000e+00, double* %140, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %141 = load double, double* %137, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %139
  %143 = load double, double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %144, 0.000000e+00
  store double %145, double* %140, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %145, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %145, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %130, label %._crit_edge101.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge101.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge101.us.us

._crit_edge101.us.us:                             ; preds = %._crit_edge101.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %160, %._crit_edge101.us.us.loopexit ]
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %139, i64 %134
  store double %.lcssa, double* %146, align 8
  %storemerge4.us.us = add nsw i32 %storemerge4104.us.us, 1
  %147 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %147, label %.lr.ph.us.us, label %._crit_edge12.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = phi double [ %160, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %134
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %139
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fadd double %148, %153
  store double %154, double* %140, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %134
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %139
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fadd double %154, %159
  store double %160, double* %140, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge101.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph109.split:                                  ; preds = %._crit_edge12, %.lr.ph109.split.preheader
  %indvar = phi i64 [ 0, %.lr.ph109.split.preheader ], [ %indvar.next, %._crit_edge12 ]
  %indvars.iv166 = phi i64 [ 1, %.lr.ph109.split.preheader ], [ %indvars.iv.next167, %._crit_edge12 ]
  %storemerge3108 = phi i32 [ 0, %.lr.ph109.split.preheader ], [ %storemerge4103, %._crit_edge12 ]
  %161 = sub i64 %133, %indvar
  %162 = trunc i64 %161 to i32
  %163 = sext i32 %storemerge3108 to i64
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %163
  store double 1.000000e+00, double* %164, align 8
  %storemerge4103 = add nsw i32 %storemerge3108, 1
  %165 = icmp slt i32 %storemerge4103, %0
  br i1 %165, label %.lr.ph106.split.preheader, label %._crit_edge12

.lr.ph106.split.preheader:                        ; preds = %.lr.ph109.split
  %166 = sub i64 %131, %indvar
  %167 = trunc i64 %166 to i32
  %xtraiter173 = and i32 %167, 3
  %lcmp.mod174 = icmp eq i32 %xtraiter173, 0
  br i1 %lcmp.mod174, label %.lr.ph106.split.prol.loopexit, label %.lr.ph106.split.prol.preheader

.lr.ph106.split.prol.preheader:                   ; preds = %.lr.ph106.split.preheader
  br label %.lr.ph106.split.prol

.lr.ph106.split.prol:                             ; preds = %.lr.ph106.split.prol.preheader, %.lr.ph106.split.prol
  %indvars.iv168.prol = phi i64 [ %indvars.iv.next169.prol, %.lr.ph106.split.prol ], [ %indvars.iv166, %.lr.ph106.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph106.split.prol ], [ %xtraiter173, %.lr.ph106.split.prol.preheader ]
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %indvars.iv168.prol
  store double 0.000000e+00, double* %168, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv168.prol, i64 %163
  %170 = bitcast double* %169 to i64*
  store i64 0, i64* %170, align 8
  %indvars.iv.next169.prol = add nuw nsw i64 %indvars.iv168.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph106.split.prol.loopexit.loopexit, label %.lr.ph106.split.prol, !llvm.loop !8

.lr.ph106.split.prol.loopexit.loopexit:           ; preds = %.lr.ph106.split.prol
  br label %.lr.ph106.split.prol.loopexit

.lr.ph106.split.prol.loopexit:                    ; preds = %.lr.ph106.split.prol.loopexit.loopexit, %.lr.ph106.split.preheader
  %indvars.iv168.unr = phi i64 [ %indvars.iv166, %.lr.ph106.split.preheader ], [ %indvars.iv.next169.prol, %.lr.ph106.split.prol.loopexit.loopexit ]
  %171 = icmp ult i32 %162, 3
  br i1 %171, label %._crit_edge12, label %.lr.ph106.split.preheader246

.lr.ph106.split.preheader246:                     ; preds = %.lr.ph106.split.prol.loopexit
  br label %.lr.ph106.split

.lr.ph106.split:                                  ; preds = %.lr.ph106.split.preheader246, %.lr.ph106.split
  %indvars.iv168 = phi i64 [ %indvars.iv.next169.3, %.lr.ph106.split ], [ %indvars.iv168.unr, %.lr.ph106.split.preheader246 ]
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %indvars.iv168
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv168, i64 %163
  %174 = bitcast double* %173 to i64*
  store i64 0, i64* %174, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %indvars.iv.next169
  store double 0.000000e+00, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169, i64 %163
  %177 = bitcast double* %176 to i64*
  store i64 0, i64* %177, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %indvars.iv.next169.1
  store double 0.000000e+00, double* %178, align 8
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169.1, i64 %163
  %180 = bitcast double* %179 to i64*
  store i64 0, i64* %180, align 8
  %indvars.iv.next169.2 = add nsw i64 %indvars.iv168, 3
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %163, i64 %indvars.iv.next169.2
  store double 0.000000e+00, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169.2, i64 %163
  %183 = bitcast double* %182 to i64*
  store i64 0, i64* %183, align 8
  %indvars.iv.next169.3 = add nsw i64 %indvars.iv168, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next169.3, %wide.trip.count170.3
  br i1 %exitcond.3, label %._crit_edge12.loopexit, label %.lr.ph106.split

._crit_edge12.loopexit:                           ; preds = %.lr.ph106.split
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph106.split.prol.loopexit, %.lr.ph109.split
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %131
  br i1 %exitcond, label %._crit_edge12._crit_edge.loopexit247, label %.lr.ph109.split

._crit_edge12._crit_edge.loopexit:                ; preds = %._crit_edge12.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge.loopexit247:             ; preds = %._crit_edge12
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12._crit_edge.loopexit247, %._crit_edge12._crit_edge.loopexit, %._crit_edge9.._crit_edge12_crit_edge.thread, %._crit_edge9.._crit_edge12_crit_edge
  %184 = phi i32 [ %105, %._crit_edge9.._crit_edge12_crit_edge.thread ], [ %128, %._crit_edge9.._crit_edge12_crit_edge ], [ %128, %._crit_edge12._crit_edge.loopexit ], [ %128, %._crit_edge12._crit_edge.loopexit247 ]
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %185
  store double 1.000000e+00, double* %186, align 8
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

; <label>:11:                                     ; preds = %._crit_edge2.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge2.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %11

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
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
