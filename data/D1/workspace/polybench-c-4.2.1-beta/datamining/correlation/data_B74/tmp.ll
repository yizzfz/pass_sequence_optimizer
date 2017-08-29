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

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv12 = phi i64 [ 0, %2 ], [ %indvars.iv.next13, %19 ]
  %3 = trunc i64 %indvars.iv12 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv12
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv12
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
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond14, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
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

.lr.ph151.split.preheader:                        ; preds = %.lr.ph151
  %10 = zext i32 %0 to i64
  %11 = add nsw i64 %10, -1
  %xtraiter264 = and i64 %10, 3
  %lcmp.mod265 = icmp eq i64 %xtraiter264, 0
  br i1 %lcmp.mod265, label %.lr.ph151.split.prol.loopexit, label %.lr.ph151.split.prol.preheader

.lr.ph151.split.prol.preheader:                   ; preds = %.lr.ph151.split.preheader
  %12 = fdiv double 0.000000e+00, %2
  br label %.lr.ph151.split.prol

.lr.ph151.split.prol:                             ; preds = %.lr.ph151.split.prol.preheader, %.lr.ph151.split.prol
  %indvars.iv207.prol = phi i64 [ %indvars.iv.next208.prol, %.lr.ph151.split.prol ], [ 0, %.lr.ph151.split.prol.preheader ]
  %prol.iter266 = phi i64 [ %prol.iter266.sub, %.lr.ph151.split.prol ], [ %xtraiter264, %.lr.ph151.split.prol.preheader ]
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv207.prol
  store double %12, double* %13, align 8
  %indvars.iv.next208.prol = add nuw nsw i64 %indvars.iv207.prol, 1
  %prol.iter266.sub = add i64 %prol.iter266, -1
  %prol.iter266.cmp = icmp eq i64 %prol.iter266.sub, 0
  br i1 %prol.iter266.cmp, label %.lr.ph151.split.prol.loopexit.loopexit, label %.lr.ph151.split.prol, !llvm.loop !1

.lr.ph151.split.prol.loopexit.loopexit:           ; preds = %.lr.ph151.split.prol
  br label %.lr.ph151.split.prol.loopexit

.lr.ph151.split.prol.loopexit:                    ; preds = %.lr.ph151.split.prol.loopexit.loopexit, %.lr.ph151.split.preheader
  %indvars.iv207.unr = phi i64 [ 0, %.lr.ph151.split.preheader ], [ %indvars.iv.next208.prol, %.lr.ph151.split.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %11, 3
  br i1 %14, label %.._crit_edge109_crit_edge, label %.lr.ph151.split.preheader271

.lr.ph151.split.preheader271:                     ; preds = %.lr.ph151.split.prol.loopexit
  %15 = fdiv double 0.000000e+00, %2
  %16 = add nsw i64 %10, -4
  %17 = sub i64 %16, %indvars.iv207.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 4
  br i1 %min.iters.check, label %.lr.ph151.split.preheader301, label %min.iters.checked

.lr.ph151.split.preheader301:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph151.split.preheader271
  %indvars.iv207.ph = phi i64 [ %indvars.iv207.unr, %min.iters.checked ], [ %indvars.iv207.unr, %.lr.ph151.split.preheader271 ], [ %ind.end, %middle.block ]
  br label %.lr.ph151.split

min.iters.checked:                                ; preds = %.lr.ph151.split.preheader271
  %n.mod.vf = and i64 %19, 3
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = shl nuw i64 %18, 2
  %21 = add i64 %indvars.iv207.unr, %20
  %22 = add i64 %21, 4
  %23 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %.lr.ph151.split.preheader301, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert284 = insertelement <2 x double> undef, double %15, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert284, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %24 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv207.unr, %24
  %25 = add nsw i64 %offset.idx, 3
  %26 = add i64 %offset.idx, 11
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr inbounds double, double* %5, i64 %26
  %29 = getelementptr double, double* %27, i64 -3
  %30 = bitcast double* %29 to <8 x double>*
  %31 = getelementptr double, double* %28, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %30, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8
  %index.next = add i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge109_crit_edge, label %.lr.ph151.split.preheader301

.lr.ph151.split.us.preheader:                     ; preds = %.lr.ph151
  %34 = zext i32 %1 to i64
  %35 = zext i32 %0 to i64
  %xtraiter259 = and i64 %34, 1
  %lcmp.mod260 = icmp eq i64 %xtraiter259, 0
  %36 = icmp eq i32 %1, 1
  %sunkaddr214 = ptrtoint double* %5 to i64
  %37 = add nsw i64 %34, -2
  br label %.lr.ph151.split.us

.lr.ph151.split.us:                               ; preds = %._crit_edge147.us, %.lr.ph151.split.us.preheader
  %indvars.iv203 = phi i64 [ 0, %.lr.ph151.split.us.preheader ], [ %indvars.iv.next204, %._crit_edge147.us ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv203
  store double 0.000000e+00, double* %38, align 8
  br i1 %lcmp.mod260, label %.prol.loopexit258, label %.prol.preheader257

.prol.preheader257:                               ; preds = %.lr.ph151.split.us
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv203
  %40 = load double, double* %39, align 8
  %41 = fadd double %40, 0.000000e+00
  %sunkaddr211.prol = shl nuw nsw i64 %indvars.iv203, 3
  %sunkaddr212.prol = add i64 %sunkaddr214, %sunkaddr211.prol
  %sunkaddr213.prol = inttoptr i64 %sunkaddr212.prol to double*
  store double %41, double* %sunkaddr213.prol, align 8
  br label %.prol.loopexit258

.prol.loopexit258:                                ; preds = %.prol.preheader257, %.lr.ph151.split.us
  %indvars.iv199.unr.ph = phi i64 [ 1, %.prol.preheader257 ], [ 0, %.lr.ph151.split.us ]
  %.unr261.ph = phi double [ %41, %.prol.preheader257 ], [ 0.000000e+00, %.lr.ph151.split.us ]
  %.lcssa235.unr.ph = phi double [ %41, %.prol.preheader257 ], [ undef, %.lr.ph151.split.us ]
  br i1 %36, label %.prol.loopexit258.._crit_edge147.us_crit_edge, label %.lr.ph151.split.us.new.preheader

.prol.loopexit258.._crit_edge147.us_crit_edge:    ; preds = %.prol.loopexit258
  %.pre = shl nuw nsw i64 %indvars.iv203, 3
  %.pre293 = add i64 %sunkaddr214, %.pre
  %.pre294 = inttoptr i64 %.pre293 to double*
  br label %._crit_edge147.us

.lr.ph151.split.us.new.preheader:                 ; preds = %.prol.loopexit258
  %sunkaddr211 = shl nuw nsw i64 %indvars.iv203, 3
  %sunkaddr212 = add i64 %sunkaddr214, %sunkaddr211
  %sunkaddr213 = inttoptr i64 %sunkaddr212 to double*
  %42 = sub nsw i64 %37, %indvars.iv199.unr.ph
  %43 = lshr i64 %42, 1
  %44 = and i64 %43, 1
  %lcmp.mod307 = icmp eq i64 %44, 0
  br i1 %lcmp.mod307, label %.lr.ph151.split.us.new.prol.preheader, label %.lr.ph151.split.us.new.prol.loopexit.unr-lcssa

.lr.ph151.split.us.new.prol.preheader:            ; preds = %.lr.ph151.split.us.new.preheader
  br label %.lr.ph151.split.us.new.prol

.lr.ph151.split.us.new.prol:                      ; preds = %.lr.ph151.split.us.new.prol.preheader
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv199.unr.ph, i64 %indvars.iv203
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %.unr261.ph
  store double %47, double* %sunkaddr213, align 8
  %indvars.iv.next200.prol = add nuw nsw i64 %indvars.iv199.unr.ph, 1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next200.prol, i64 %indvars.iv203
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %sunkaddr213, align 8
  %indvars.iv.next200.1.prol = or i64 %indvars.iv199.unr.ph, 2
  br label %.lr.ph151.split.us.new.prol.loopexit.unr-lcssa

.lr.ph151.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph151.split.us.new.preheader, %.lr.ph151.split.us.new.prol
  %.lcssa305.unr.ph = phi double [ %50, %.lr.ph151.split.us.new.prol ], [ undef, %.lr.ph151.split.us.new.preheader ]
  %indvars.iv199.unr.ph308 = phi i64 [ %indvars.iv.next200.1.prol, %.lr.ph151.split.us.new.prol ], [ %indvars.iv199.unr.ph, %.lr.ph151.split.us.new.preheader ]
  %.unr.ph309 = phi double [ %50, %.lr.ph151.split.us.new.prol ], [ %.unr261.ph, %.lr.ph151.split.us.new.preheader ]
  br label %.lr.ph151.split.us.new.prol.loopexit

.lr.ph151.split.us.new.prol.loopexit:             ; preds = %.lr.ph151.split.us.new.prol.loopexit.unr-lcssa
  %51 = icmp eq i64 %43, 0
  br i1 %51, label %._crit_edge147.us.loopexit, label %.lr.ph151.split.us.new.preheader.new

.lr.ph151.split.us.new.preheader.new:             ; preds = %.lr.ph151.split.us.new.prol.loopexit
  br label %.lr.ph151.split.us.new

.lr.ph151.split.us.new:                           ; preds = %.lr.ph151.split.us.new, %.lr.ph151.split.us.new.preheader.new
  %indvars.iv199 = phi i64 [ %indvars.iv199.unr.ph308, %.lr.ph151.split.us.new.preheader.new ], [ %indvars.iv.next200.1.1, %.lr.ph151.split.us.new ]
  %52 = phi double [ %.unr.ph309, %.lr.ph151.split.us.new.preheader.new ], [ %64, %.lr.ph151.split.us.new ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv199, i64 %indvars.iv203
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %sunkaddr213, align 8
  %indvars.iv.next200 = add nuw nsw i64 %indvars.iv199, 1
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next200, i64 %indvars.iv203
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %sunkaddr213, align 8
  %indvars.iv.next200.1 = add nsw i64 %indvars.iv199, 2
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next200.1, i64 %indvars.iv203
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %sunkaddr213, align 8
  %indvars.iv.next200.1310 = add nsw i64 %indvars.iv199, 3
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next200.1310, i64 %indvars.iv203
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %sunkaddr213, align 8
  %indvars.iv.next200.1.1 = add nsw i64 %indvars.iv199, 4
  %exitcond256.1.1 = icmp eq i64 %indvars.iv.next200.1.1, %34
  br i1 %exitcond256.1.1, label %._crit_edge147.us.loopexit.unr-lcssa, label %.lr.ph151.split.us.new

._crit_edge147.us.loopexit.unr-lcssa:             ; preds = %.lr.ph151.split.us.new
  br label %._crit_edge147.us.loopexit

._crit_edge147.us.loopexit:                       ; preds = %.lr.ph151.split.us.new.prol.loopexit, %._crit_edge147.us.loopexit.unr-lcssa
  %.lcssa305 = phi double [ %.lcssa305.unr.ph, %.lr.ph151.split.us.new.prol.loopexit ], [ %64, %._crit_edge147.us.loopexit.unr-lcssa ]
  br label %._crit_edge147.us

._crit_edge147.us:                                ; preds = %._crit_edge147.us.loopexit, %.prol.loopexit258.._crit_edge147.us_crit_edge
  %sunkaddr217.pre-phi = phi double* [ %.pre294, %.prol.loopexit258.._crit_edge147.us_crit_edge ], [ %sunkaddr213, %._crit_edge147.us.loopexit ]
  %.lcssa235 = phi double [ %.lcssa235.unr.ph, %.prol.loopexit258.._crit_edge147.us_crit_edge ], [ %.lcssa305, %._crit_edge147.us.loopexit ]
  %65 = fdiv double %.lcssa235, %2
  store double %65, double* %sunkaddr217.pre-phi, align 8
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %exitcond262 = icmp eq i64 %indvars.iv.next204, %35
  br i1 %exitcond262, label %.._crit_edge109_crit_edge.loopexit, label %.lr.ph151.split.us

.._crit_edge109_crit_edge.loopexit:               ; preds = %._crit_edge147.us
  br label %.._crit_edge109_crit_edge

.._crit_edge109_crit_edge.loopexit302:            ; preds = %.lr.ph151.split
  br label %.._crit_edge109_crit_edge

.._crit_edge109_crit_edge:                        ; preds = %.._crit_edge109_crit_edge.loopexit302, %.._crit_edge109_crit_edge.loopexit, %middle.block, %.lr.ph151.split.prol.loopexit
  br i1 true, label %.lr.ph143, label %.._crit_edge109_crit_edge.._crit_edge109.._crit_edge110_crit_edge_crit_edge

.._crit_edge109_crit_edge.._crit_edge109.._crit_edge110_crit_edge_crit_edge: ; preds = %.._crit_edge109_crit_edge
  br label %._crit_edge109.._crit_edge110_crit_edge

.lr.ph143:                                        ; preds = %.._crit_edge109_crit_edge
  br i1 %9, label %.lr.ph143.split.us.preheader, label %.lr.ph143.split.preheader

.lr.ph143.split.preheader:                        ; preds = %.lr.ph143
  %66 = zext i32 %0 to i64
  %xtraiter254 = and i64 %66, 1
  %lcmp.mod255 = icmp eq i64 %xtraiter254, 0
  br i1 %lcmp.mod255, label %.lr.ph143.split.prol.loopexit, label %.lr.ph143.split.prol

.lr.ph143.split.prol:                             ; preds = %.lr.ph143.split.preheader
  %67 = fdiv double 0.000000e+00, %2
  store double %67, double* %6, align 8
  %68 = tail call double @sqrt(double %67) #4
  %69 = fcmp ugt double %68, 1.000000e-01
  %70 = select i1 %69, double %68, double 1.000000e+00
  store double %70, double* %6, align 8
  br label %.lr.ph143.split.prol.loopexit

.lr.ph143.split.prol.loopexit:                    ; preds = %.lr.ph143.split.preheader, %.lr.ph143.split.prol
  %indvars.iv195.unr = phi i64 [ 0, %.lr.ph143.split.preheader ], [ 1, %.lr.ph143.split.prol ]
  %71 = icmp eq i32 %0, 1
  br i1 %71, label %._crit_edge109.._crit_edge110_crit_edge, label %.lr.ph143.split.preheader269

.lr.ph143.split.preheader269:                     ; preds = %.lr.ph143.split.prol.loopexit
  %72 = fdiv double 0.000000e+00, %2
  br label %.lr.ph143.split

.lr.ph143.split.us.preheader:                     ; preds = %.lr.ph143
  %73 = zext i32 %1 to i64
  %74 = zext i32 %0 to i64
  %xtraiter249 = and i64 %73, 1
  %lcmp.mod250 = icmp eq i64 %xtraiter249, 0
  %75 = icmp eq i32 %1, 1
  %sunkaddr226 = ptrtoint double* %6 to i64
  %sunkaddr218 = ptrtoint double* %5 to i64
  br label %.lr.ph143.split.us

.lr.ph143.split.us:                               ; preds = %._crit_edge140.us, %.lr.ph143.split.us.preheader
  %indvars.iv191 = phi i64 [ 0, %.lr.ph143.split.us.preheader ], [ %indvars.iv.next192, %._crit_edge140.us ]
  %76 = getelementptr inbounds double, double* %6, i64 %indvars.iv191
  store double 0.000000e+00, double* %76, align 8
  br i1 %lcmp.mod250, label %.prol.loopexit248, label %.prol.preheader247

.prol.preheader247:                               ; preds = %.lr.ph143.split.us
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv191
  %78 = load double, double* %77, align 8
  %sunkaddr219.prol = shl nuw nsw i64 %indvars.iv191, 3
  %sunkaddr220.prol = add i64 %sunkaddr218, %sunkaddr219.prol
  %sunkaddr221.prol = inttoptr i64 %sunkaddr220.prol to double*
  %79 = load double, double* %sunkaddr221.prol, align 8
  %80 = fsub double %78, %79
  %81 = fmul double %80, %80
  %82 = fadd double %81, 0.000000e+00
  %sunkaddr224.prol = add i64 %sunkaddr226, %sunkaddr219.prol
  %sunkaddr225.prol = inttoptr i64 %sunkaddr224.prol to double*
  store double %82, double* %sunkaddr225.prol, align 8
  br label %.prol.loopexit248

.prol.loopexit248:                                ; preds = %.prol.preheader247, %.lr.ph143.split.us
  %indvars.iv187.unr.ph = phi i64 [ 1, %.prol.preheader247 ], [ 0, %.lr.ph143.split.us ]
  %.unr251.ph = phi double [ %82, %.prol.preheader247 ], [ 0.000000e+00, %.lr.ph143.split.us ]
  %.lcssa234.unr.ph = phi double [ %82, %.prol.preheader247 ], [ undef, %.lr.ph143.split.us ]
  br i1 %75, label %.prol.loopexit248.._crit_edge140.us_crit_edge, label %.lr.ph143.split.us.new.preheader

.prol.loopexit248.._crit_edge140.us_crit_edge:    ; preds = %.prol.loopexit248
  %.pre295 = shl nuw nsw i64 %indvars.iv191, 3
  %.pre296 = add i64 %sunkaddr226, %.pre295
  %.pre297 = inttoptr i64 %.pre296 to double*
  br label %._crit_edge140.us

.lr.ph143.split.us.new.preheader:                 ; preds = %.prol.loopexit248
  %sunkaddr219 = shl nuw nsw i64 %indvars.iv191, 3
  %sunkaddr220 = add i64 %sunkaddr218, %sunkaddr219
  %sunkaddr221 = inttoptr i64 %sunkaddr220 to double*
  %sunkaddr224 = add i64 %sunkaddr226, %sunkaddr219
  %sunkaddr225 = inttoptr i64 %sunkaddr224 to double*
  br label %.lr.ph143.split.us.new

.lr.ph143.split.us.new:                           ; preds = %.lr.ph143.split.us.new.preheader, %.lr.ph143.split.us.new
  %indvars.iv187 = phi i64 [ %indvars.iv.next188.1, %.lr.ph143.split.us.new ], [ %indvars.iv187.unr.ph, %.lr.ph143.split.us.new.preheader ]
  %83 = phi double [ %95, %.lr.ph143.split.us.new ], [ %.unr251.ph, %.lr.ph143.split.us.new.preheader ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv191
  %85 = load double, double* %84, align 8
  %86 = load double, double* %sunkaddr221, align 8
  %87 = fsub double %85, %86
  %88 = fmul double %87, %87
  %89 = fadd double %83, %88
  store double %89, double* %sunkaddr225, align 8
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv191
  %91 = load double, double* %90, align 8
  %92 = load double, double* %sunkaddr221, align 8
  %93 = fsub double %91, %92
  %94 = fmul double %93, %93
  %95 = fadd double %89, %94
  store double %95, double* %sunkaddr225, align 8
  %indvars.iv.next188.1 = add nsw i64 %indvars.iv187, 2
  %exitcond246.1 = icmp eq i64 %indvars.iv.next188.1, %73
  br i1 %exitcond246.1, label %._crit_edge140.us.loopexit, label %.lr.ph143.split.us.new

._crit_edge140.us.loopexit:                       ; preds = %.lr.ph143.split.us.new
  br label %._crit_edge140.us

._crit_edge140.us:                                ; preds = %._crit_edge140.us.loopexit, %.prol.loopexit248.._crit_edge140.us_crit_edge
  %sunkaddr229.pre-phi = phi double* [ %.pre297, %.prol.loopexit248.._crit_edge140.us_crit_edge ], [ %sunkaddr225, %._crit_edge140.us.loopexit ]
  %.lcssa234 = phi double [ %.lcssa234.unr.ph, %.prol.loopexit248.._crit_edge140.us_crit_edge ], [ %95, %._crit_edge140.us.loopexit ]
  %96 = fdiv double %.lcssa234, %2
  store double %96, double* %sunkaddr229.pre-phi, align 8
  %97 = tail call double @sqrt(double %96) #4
  %98 = fcmp ugt double %97, 1.000000e-01
  %99 = select i1 %98, double %97, double 1.000000e+00
  store double %99, double* %sunkaddr229.pre-phi, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond252 = icmp eq i64 %indvars.iv.next192, %74
  br i1 %exitcond252, label %._crit_edge109.._crit_edge110_crit_edge.loopexit, label %.lr.ph143.split.us

.lr.ph151.split:                                  ; preds = %.lr.ph151.split.preheader301, %.lr.ph151.split
  %indvars.iv207 = phi i64 [ %indvars.iv.next208.3, %.lr.ph151.split ], [ %indvars.iv207.ph, %.lr.ph151.split.preheader301 ]
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv207
  store double %15, double* %100, align 8
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208
  store double %15, double* %101, align 8
  %indvars.iv.next208.1 = add nsw i64 %indvars.iv207, 2
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.1
  store double %15, double* %102, align 8
  %indvars.iv.next208.2 = add nsw i64 %indvars.iv207, 3
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.2
  store double %15, double* %103, align 8
  %indvars.iv.next208.3 = add nsw i64 %indvars.iv207, 4
  %exitcond263.3 = icmp eq i64 %indvars.iv.next208.3, %10
  br i1 %exitcond263.3, label %.._crit_edge109_crit_edge.loopexit302, label %.lr.ph151.split, !llvm.loop !6

._crit_edge109.._crit_edge110_crit_edge.loopexit: ; preds = %._crit_edge140.us
  br label %._crit_edge109.._crit_edge110_crit_edge

._crit_edge109.._crit_edge110_crit_edge.loopexit300: ; preds = %.lr.ph143.split
  br label %._crit_edge109.._crit_edge110_crit_edge

._crit_edge109.._crit_edge110_crit_edge:          ; preds = %._crit_edge109.._crit_edge110_crit_edge.loopexit300, %._crit_edge109.._crit_edge110_crit_edge.loopexit, %.._crit_edge109_crit_edge.._crit_edge109.._crit_edge110_crit_edge_crit_edge, %7, %.lr.ph143.split.prol.loopexit
  %104 = icmp sgt i32 %1, 0
  br i1 %104, label %._crit_edge110.._crit_edge111_crit_edge.lr.ph, label %._crit_edge110.._crit_edge112_crit_edge

._crit_edge110.._crit_edge111_crit_edge.lr.ph:    ; preds = %._crit_edge109.._crit_edge110_crit_edge
  br i1 %8, label %._crit_edge110.._crit_edge111_crit_edge.us.preheader, label %._crit_edge110.._crit_edge112_crit_edge.thread

._crit_edge110.._crit_edge112_crit_edge.thread:   ; preds = %._crit_edge110.._crit_edge111_crit_edge.lr.ph
  %105 = add nsw i32 %0, -1
  br label %._crit_edge112._crit_edge

._crit_edge110.._crit_edge111_crit_edge.us.preheader: ; preds = %._crit_edge110.._crit_edge111_crit_edge.lr.ph
  %106 = zext i32 %0 to i64
  %107 = zext i32 %1 to i64
  br label %._crit_edge110.._crit_edge111_crit_edge.us

._crit_edge110.._crit_edge111_crit_edge.us:       ; preds = %._crit_edge111._crit_edge.us, %._crit_edge110.._crit_edge111_crit_edge.us.preheader
  %indvars.iv182 = phi i64 [ 0, %._crit_edge110.._crit_edge111_crit_edge.us.preheader ], [ %indvars.iv.next183, %._crit_edge111._crit_edge.us ]
  br label %._crit_edge111.us

._crit_edge111.us:                                ; preds = %._crit_edge111.us, %._crit_edge110.._crit_edge111_crit_edge.us
  %indvars.iv178 = phi i64 [ 0, %._crit_edge110.._crit_edge111_crit_edge.us ], [ %indvars.iv.next179, %._crit_edge111.us ]
  %108 = getelementptr inbounds double, double* %5, i64 %indvars.iv178
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %indvars.iv178
  %111 = load double, double* %110, align 8
  %112 = fsub double %111, %109
  store double %112, double* %110, align 8
  %113 = tail call double @sqrt(double %2) #4
  %114 = getelementptr inbounds double, double* %6, i64 %indvars.iv178
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = load double, double* %110, align 8
  %118 = fdiv double %117, %116
  store double %118, double* %110, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond244 = icmp eq i64 %indvars.iv.next179, %106
  br i1 %exitcond244, label %._crit_edge111._crit_edge.us, label %._crit_edge111.us

._crit_edge111._crit_edge.us:                     ; preds = %._crit_edge111.us
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond245 = icmp eq i64 %indvars.iv.next183, %107
  br i1 %exitcond245, label %._crit_edge110.._crit_edge112_crit_edge.loopexit, label %._crit_edge110.._crit_edge111_crit_edge.us

.lr.ph143.split:                                  ; preds = %.lr.ph143.split.preheader269, %.lr.ph143.split
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.1, %.lr.ph143.split ], [ %indvars.iv195.unr, %.lr.ph143.split.preheader269 ]
  %119 = getelementptr inbounds double, double* %6, i64 %indvars.iv195
  store double %72, double* %119, align 8
  %120 = tail call double @sqrt(double %72) #4
  %121 = fcmp ugt double %120, 1.000000e-01
  %122 = select i1 %121, double %120, double 1.000000e+00
  store double %122, double* %119, align 8
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %123 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next196
  store double %72, double* %123, align 8
  %124 = tail call double @sqrt(double %72) #4
  %125 = fcmp ugt double %124, 1.000000e-01
  %126 = select i1 %125, double %124, double 1.000000e+00
  store double %126, double* %123, align 8
  %indvars.iv.next196.1 = add nsw i64 %indvars.iv195, 2
  %exitcond253.1 = icmp eq i64 %indvars.iv.next196.1, %66
  br i1 %exitcond253.1, label %._crit_edge109.._crit_edge110_crit_edge.loopexit300, label %.lr.ph143.split

._crit_edge110.._crit_edge112_crit_edge.loopexit: ; preds = %._crit_edge111._crit_edge.us
  br label %._crit_edge110.._crit_edge112_crit_edge

._crit_edge110.._crit_edge112_crit_edge:          ; preds = %._crit_edge110.._crit_edge112_crit_edge.loopexit, %._crit_edge109.._crit_edge110_crit_edge
  %127 = add nsw i32 %0, -1
  %128 = icmp sgt i32 %0, 1
  br i1 %128, label %._crit_edge112.._crit_edge113_crit_edge.lr.ph, label %._crit_edge112._crit_edge

._crit_edge112.._crit_edge113_crit_edge.lr.ph:    ; preds = %._crit_edge110.._crit_edge112_crit_edge
  %129 = sext i32 %0 to i64
  br i1 %104, label %._crit_edge112.._crit_edge113_crit_edge.us.preheader, label %._crit_edge112.._crit_edge113_crit_edge.preheader

._crit_edge112.._crit_edge113_crit_edge.preheader: ; preds = %._crit_edge112.._crit_edge113_crit_edge.lr.ph
  %130 = zext i32 %0 to i64
  %131 = add nuw nsw i64 %130, 3
  %132 = add nsw i64 %130, -2
  %133 = zext i32 %127 to i64
  br label %._crit_edge112.._crit_edge113_crit_edge

._crit_edge112.._crit_edge113_crit_edge.us.preheader: ; preds = %._crit_edge112.._crit_edge113_crit_edge.lr.ph
  %134 = zext i32 %1 to i64
  %135 = zext i32 %0 to i64
  %136 = zext i32 %127 to i64
  %xtraiter = and i64 %134, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %137 = icmp eq i32 %1, 1
  br label %._crit_edge112.._crit_edge113_crit_edge.us

._crit_edge112.._crit_edge113_crit_edge.us:       ; preds = %._crit_edge112.us, %._crit_edge112.._crit_edge113_crit_edge.us.preheader
  %indvars.iv164 = phi i64 [ 0, %._crit_edge112.._crit_edge113_crit_edge.us.preheader ], [ %indvars.iv.next165, %._crit_edge112.us ]
  %indvars.iv158 = phi i64 [ 1, %._crit_edge112.._crit_edge113_crit_edge.us.preheader ], [ %indvars.iv.next159, %._crit_edge112.us ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv164
  store double 1.000000e+00, double* %138, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %139 = icmp slt i64 %indvars.iv.next165, %129
  br i1 %139, label %.lr.ph.us.us.preheader, label %._crit_edge112.us

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge112.._crit_edge113_crit_edge.us
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv164
  br label %.lr.ph.us.us

._crit_edge112.us.loopexit:                       ; preds = %._crit_edge122.us.us
  br label %._crit_edge112.us

._crit_edge112.us:                                ; preds = %._crit_edge112.us.loopexit, %._crit_edge112.._crit_edge113_crit_edge.us
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond238 = icmp eq i64 %indvars.iv.next165, %136
  br i1 %exitcond238, label %._crit_edge112._crit_edge.loopexit, label %._crit_edge112.._crit_edge113_crit_edge.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge122.us.us
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge122.us.us ], [ %indvars.iv158, %.lr.ph.us.us.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv164, i64 %indvars.iv160
  store double 0.000000e+00, double* %141, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %142 = load double, double* %140, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv160
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %145, 0.000000e+00
  store double %146, double* %141, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %146, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %146, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %137, label %._crit_edge122.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge122.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge122.us.us

._crit_edge122.us.us:                             ; preds = %._crit_edge122.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %160, %._crit_edge122.us.us.loopexit ]
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv160, i64 %indvars.iv164
  store double %.lcssa, double* %147, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %exitcond = icmp eq i64 %indvars.iv.next161, %135
  br i1 %exitcond, label %._crit_edge112.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = phi double [ %160, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv164
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv160
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fadd double %148, %153
  store double %154, double* %141, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv164
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv160
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fadd double %154, %159
  store double %160, double* %141, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond236.1 = icmp eq i64 %indvars.iv.next.1, %134
  br i1 %exitcond236.1, label %._crit_edge122.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge112.._crit_edge113_crit_edge:          ; preds = %._crit_edge112, %._crit_edge112.._crit_edge113_crit_edge.preheader
  %indvars.iv174 = phi i64 [ 0, %._crit_edge112.._crit_edge113_crit_edge.preheader ], [ %indvars.iv.next175, %._crit_edge112 ]
  %indvars.iv168 = phi i64 [ 1, %._crit_edge112.._crit_edge113_crit_edge.preheader ], [ %indvars.iv.next169, %._crit_edge112 ]
  %161 = sub i64 %132, %indvars.iv174
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv174
  store double 1.000000e+00, double* %162, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %163 = icmp slt i64 %indvars.iv.next175, %129
  br i1 %163, label %.lr.ph123.split.preheader, label %._crit_edge112

.lr.ph123.split.preheader:                        ; preds = %._crit_edge112.._crit_edge113_crit_edge
  %164 = sub i64 %131, %indvars.iv174
  %xtraiter241 = and i64 %164, 3
  %lcmp.mod242 = icmp eq i64 %xtraiter241, 0
  br i1 %lcmp.mod242, label %.lr.ph123.split.prol.loopexit, label %.lr.ph123.split.prol.preheader

.lr.ph123.split.prol.preheader:                   ; preds = %.lr.ph123.split.preheader
  br label %.lr.ph123.split.prol

.lr.ph123.split.prol:                             ; preds = %.lr.ph123.split.prol.preheader, %.lr.ph123.split.prol
  %indvars.iv170.prol = phi i64 [ %indvars.iv.next171.prol, %.lr.ph123.split.prol ], [ %indvars.iv168, %.lr.ph123.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph123.split.prol ], [ %xtraiter241, %.lr.ph123.split.prol.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv170.prol
  store double 0.000000e+00, double* %165, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv170.prol, i64 %indvars.iv174
  store double 0.000000e+00, double* %166, align 8
  %indvars.iv.next171.prol = add nuw nsw i64 %indvars.iv170.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph123.split.prol.loopexit.loopexit, label %.lr.ph123.split.prol, !llvm.loop !8

.lr.ph123.split.prol.loopexit.loopexit:           ; preds = %.lr.ph123.split.prol
  br label %.lr.ph123.split.prol.loopexit

.lr.ph123.split.prol.loopexit:                    ; preds = %.lr.ph123.split.prol.loopexit.loopexit, %.lr.ph123.split.preheader
  %indvars.iv170.unr = phi i64 [ %indvars.iv168, %.lr.ph123.split.preheader ], [ %indvars.iv.next171.prol, %.lr.ph123.split.prol.loopexit.loopexit ]
  %167 = icmp ult i64 %161, 3
  br i1 %167, label %._crit_edge112, label %.lr.ph123.split.preheader298

.lr.ph123.split.preheader298:                     ; preds = %.lr.ph123.split.prol.loopexit
  br label %.lr.ph123.split

.lr.ph123.split:                                  ; preds = %.lr.ph123.split.preheader298, %.lr.ph123.split
  %indvars.iv170 = phi i64 [ %indvars.iv.next171.3, %.lr.ph123.split ], [ %indvars.iv170.unr, %.lr.ph123.split.preheader298 ]
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv170
  store double 0.000000e+00, double* %168, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv170, i64 %indvars.iv174
  store double 0.000000e+00, double* %169, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv.next171
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next171, i64 %indvars.iv174
  store double 0.000000e+00, double* %171, align 8
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv.next171.1
  store double 0.000000e+00, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next171.1, i64 %indvars.iv174
  store double 0.000000e+00, double* %173, align 8
  %indvars.iv.next171.2 = add nsw i64 %indvars.iv170, 3
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv174, i64 %indvars.iv.next171.2
  store double 0.000000e+00, double* %174, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next171.2, i64 %indvars.iv174
  store double 0.000000e+00, double* %175, align 8
  %indvars.iv.next171.3 = add nsw i64 %indvars.iv170, 4
  %exitcond239.3 = icmp eq i64 %indvars.iv.next171.3, %130
  br i1 %exitcond239.3, label %._crit_edge112.loopexit, label %.lr.ph123.split

._crit_edge112.loopexit:                          ; preds = %.lr.ph123.split
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph123.split.prol.loopexit, %._crit_edge112.._crit_edge113_crit_edge
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %exitcond243 = icmp eq i64 %indvars.iv.next175, %133
  br i1 %exitcond243, label %._crit_edge112._crit_edge.loopexit299, label %._crit_edge112.._crit_edge113_crit_edge

._crit_edge112._crit_edge.loopexit:               ; preds = %._crit_edge112.us
  br label %._crit_edge112._crit_edge

._crit_edge112._crit_edge.loopexit299:            ; preds = %._crit_edge112
  br label %._crit_edge112._crit_edge

._crit_edge112._crit_edge:                        ; preds = %._crit_edge112._crit_edge.loopexit299, %._crit_edge112._crit_edge.loopexit, %._crit_edge110.._crit_edge112_crit_edge.thread, %._crit_edge110.._crit_edge112_crit_edge
  %176 = phi i32 [ %105, %._crit_edge110.._crit_edge112_crit_edge.thread ], [ %127, %._crit_edge110.._crit_edge112_crit_edge ], [ %127, %._crit_edge112._crit_edge.loopexit ], [ %127, %._crit_edge112._crit_edge.loopexit299 ]
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %177, i64 %177
  store double 1.000000e+00, double* %178, align 8
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
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.._crit_edge11_crit_edge.us

.._crit_edge11_crit_edge.us:                      ; preds = %._crit_edge11._crit_edge.us, %.._crit_edge11_crit_edge.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.._crit_edge11_crit_edge.us.preheader ], [ %indvars.iv.next16, %._crit_edge11._crit_edge.us ]
  %10 = mul nsw i64 %indvars.iv15, %8
  br label %11

; <label>:11:                                     ; preds = %._crit_edge.us, %.._crit_edge11_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge11_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add nsw i64 %indvars.iv, %10
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond19, label %._crit_edge11._crit_edge.us, label %11

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %9
  br i1 %exitcond, label %._crit_edge14.loopexit, label %.._crit_edge11_crit_edge.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
