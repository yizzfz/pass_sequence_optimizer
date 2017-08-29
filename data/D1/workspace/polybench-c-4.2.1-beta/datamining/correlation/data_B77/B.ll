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
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br i1 true, label %.lr.ph134, label %._crit_edge.._crit_edge89_crit_edge

.lr.ph134:                                        ; preds = %7
  br i1 true, label %.lr.ph134.split.us.preheader, label %.lr.ph134.split.preheader

.lr.ph134.split.us.preheader:                     ; preds = %.lr.ph134
  %sunkaddr144 = ptrtoint double* %5 to i64
  br label %.lr.ph134.split.us

.lr.ph134.split.preheader:                        ; preds = %.lr.ph134
  br i1 true, label %.lr.ph134.split.prol.loopexit, label %.lr.ph134.split.prol.preheader

.lr.ph134.split.prol.preheader:                   ; preds = %.lr.ph134.split.preheader
  %8 = fdiv double 0.000000e+00, %2
  br label %.lr.ph134.split.prol

.lr.ph134.split.prol:                             ; preds = %.lr.ph134.split.prol.preheader, %.lr.ph134.split.prol
  %indvars.iv207.prol = phi i64 [ %indvars.iv.next208.prol, %.lr.ph134.split.prol ], [ 0, %.lr.ph134.split.prol.preheader ]
  %prol.iter213 = phi i32 [ %prol.iter213.sub, %.lr.ph134.split.prol ], [ 0, %.lr.ph134.split.prol.preheader ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv207.prol
  store double %8, double* %9, align 8
  %indvars.iv.next208.prol = add nuw nsw i64 %indvars.iv207.prol, 1
  %prol.iter213.sub = add nsw i32 %prol.iter213, -1
  %prol.iter213.cmp = icmp eq i32 %prol.iter213.sub, 0
  br i1 %prol.iter213.cmp, label %.lr.ph134.split.prol.loopexit.loopexit, label %.lr.ph134.split.prol, !llvm.loop !1

.lr.ph134.split.prol.loopexit.loopexit:           ; preds = %.lr.ph134.split.prol
  br label %.lr.ph134.split.prol.loopexit

.lr.ph134.split.prol.loopexit:                    ; preds = %.lr.ph134.split.prol.loopexit.loopexit, %.lr.ph134.split.preheader
  %indvars.iv207.unr = phi i64 [ 0, %.lr.ph134.split.preheader ], [ 4294967296, %.lr.ph134.split.prol.loopexit.loopexit ]
  br i1 false, label %.lr.ph128, label %.lr.ph134.split.preheader219

.lr.ph134.split.preheader219:                     ; preds = %.lr.ph134.split.prol.loopexit
  %10 = fdiv double 0.000000e+00, %2
  %11 = sub nsw i64 1196, %indvars.iv207.unr
  %12 = lshr i64 %11, 2
  %13 = add nuw nsw i64 %12, 1
  %min.iters.check = icmp ult i64 %13, 4
  br i1 %min.iters.check, label %.lr.ph134.split.preheader244, label %min.iters.checked

.lr.ph134.split.preheader244:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph134.split.preheader219
  %indvars.iv207.ph = phi i64 [ %indvars.iv207.unr, %min.iters.checked ], [ %indvars.iv207.unr, %.lr.ph134.split.preheader219 ], [ %ind.end, %middle.block ]
  br label %.lr.ph134.split

min.iters.checked:                                ; preds = %.lr.ph134.split.preheader219
  %n.mod.vf = and i64 %13, 3
  %n.vec = sub nsw i64 %13, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %14 = shl nuw i64 %12, 2
  %15 = add i64 %indvars.iv207.unr, %14
  %16 = add i64 %15, 4
  %17 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %16, %17
  br i1 %cmp.zero, label %.lr.ph134.split.preheader244, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert232 = insertelement <2 x double> undef, double %10, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert232, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %18 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv207.unr, %18
  %19 = add nsw i64 %offset.idx, 3
  %20 = add i64 %offset.idx, 11
  %21 = getelementptr inbounds double, double* %5, i64 %19
  %22 = getelementptr inbounds double, double* %5, i64 %20
  %23 = getelementptr double, double* %21, i64 -3
  %24 = bitcast double* %23 to <8 x double>*
  %25 = getelementptr double, double* %22, i64 -3
  %26 = bitcast double* %25 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %24, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %26, align 8
  %index.next = add i64 %index, 4
  %27 = icmp eq i64 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph134.split.preheader244

.lr.ph134.split.us:                               ; preds = %._crit_edge.us, %.lr.ph134.split.us.preheader
  %indvars.iv270 = phi i64 [ 0, %.lr.ph134.split.us.preheader ], [ %indvars.iv.next271, %._crit_edge.us ]
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv270
  store double 0.000000e+00, double* %28, align 8
  br i1 true, label %.prol.loopexit203, label %.prol.preheader202

.prol.preheader202:                               ; preds = %.lr.ph134.split.us
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv270
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, 0.000000e+00
  %sunkaddr141.prol = shl nsw i64 %indvars.iv270, 3
  %sunkaddr142.prol = add i64 %sunkaddr144, %sunkaddr141.prol
  %sunkaddr143.prol = inttoptr i64 %sunkaddr142.prol to double*
  store double %31, double* %sunkaddr143.prol, align 8
  br label %.prol.loopexit203

.prol.loopexit203:                                ; preds = %.prol.preheader202, %.lr.ph134.split.us
  %indvars.iv198.unr.ph = phi i64 [ 1, %.prol.preheader202 ], [ 0, %.lr.ph134.split.us ]
  %.unr206.ph = phi double [ %31, %.prol.preheader202 ], [ 0.000000e+00, %.lr.ph134.split.us ]
  %.lcssa165.unr.ph = phi double [ %31, %.prol.preheader202 ], [ undef, %.lr.ph134.split.us ]
  br i1 false, label %.prol.loopexit203.._crit_edge.us_crit_edge, label %.lr.ph134.split.us.new.preheader

.prol.loopexit203.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit203
  %.pre = shl nsw i64 %indvars.iv270, 3
  %.pre274 = add i64 %sunkaddr144, %.pre
  %.pre275 = inttoptr i64 %.pre274 to double*
  br label %._crit_edge.us

.lr.ph134.split.us.new.preheader:                 ; preds = %.prol.loopexit203
  %sunkaddr141 = shl nsw i64 %indvars.iv270, 3
  %sunkaddr142 = add i64 %sunkaddr144, %sunkaddr141
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to double*
  %32 = sub nsw i64 1398, %indvars.iv198.unr.ph
  %33 = lshr i64 %32, 1
  %34 = and i64 %33, 1
  %lcmp.mod283 = icmp eq i64 %34, 0
  br i1 %lcmp.mod283, label %.lr.ph134.split.us.new.prol.preheader, label %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa

.lr.ph134.split.us.new.prol.preheader:            ; preds = %.lr.ph134.split.us.new.preheader
  br label %.lr.ph134.split.us.new.prol

.lr.ph134.split.us.new.prol:                      ; preds = %.lr.ph134.split.us.new.prol.preheader
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198.unr.ph, i64 %indvars.iv270
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %.unr206.ph
  store double %37, double* %sunkaddr143, align 8
  %indvars.iv.next199.prol = add nuw nsw i64 %indvars.iv198.unr.ph, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.prol, i64 %indvars.iv270
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, %37
  store double %40, double* %sunkaddr143, align 8
  %indvars.iv.next199.1.prol = or i64 %indvars.iv198.unr.ph, 2
  br label %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa

.lr.ph134.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph134.split.us.new.preheader, %.lr.ph134.split.us.new.prol
  %.lcssa281.unr.ph = phi double [ %40, %.lr.ph134.split.us.new.prol ], [ undef, %.lr.ph134.split.us.new.preheader ]
  %indvars.iv198.unr.ph284 = phi i64 [ %indvars.iv.next199.1.prol, %.lr.ph134.split.us.new.prol ], [ %indvars.iv198.unr.ph, %.lr.ph134.split.us.new.preheader ]
  %.unr.ph285 = phi double [ %40, %.lr.ph134.split.us.new.prol ], [ %.unr206.ph, %.lr.ph134.split.us.new.preheader ]
  br label %.lr.ph134.split.us.new.prol.loopexit

.lr.ph134.split.us.new.prol.loopexit:             ; preds = %.lr.ph134.split.us.new.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge.us.loopexit, label %.lr.ph134.split.us.new.preheader.new

.lr.ph134.split.us.new.preheader.new:             ; preds = %.lr.ph134.split.us.new.prol.loopexit
  br label %.lr.ph134.split.us.new

.lr.ph134.split.us.new:                           ; preds = %.lr.ph134.split.us.new, %.lr.ph134.split.us.new.preheader.new
  %indvars.iv198 = phi i64 [ %indvars.iv198.unr.ph284, %.lr.ph134.split.us.new.preheader.new ], [ %indvars.iv.next199.1.1, %.lr.ph134.split.us.new ]
  %41 = phi double [ %.unr.ph285, %.lr.ph134.split.us.new.preheader.new ], [ %53, %.lr.ph134.split.us.new ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv198, i64 %indvars.iv270
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %sunkaddr143, align 8
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199, i64 %indvars.iv270
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %sunkaddr143, align 8
  %indvars.iv.next199.1 = add nuw nsw i64 %indvars.iv198, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1, i64 %indvars.iv270
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %sunkaddr143, align 8
  %indvars.iv.next199.1286 = add nsw i64 %indvars.iv198, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next199.1286, i64 %indvars.iv270
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %sunkaddr143, align 8
  %indvars.iv.next199.1.1 = add nsw i64 %indvars.iv198, 4
  %exitcond201.1.1 = icmp eq i64 %indvars.iv.next199.1.1, 1400
  br i1 %exitcond201.1.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph134.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph134.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph134.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %.lcssa281 = phi double [ %.lcssa281.unr.ph, %.lr.ph134.split.us.new.prol.loopexit ], [ %53, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit203.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %sunkaddr147.pre-phi = phi double* [ %.pre275, %.prol.loopexit203.._crit_edge.us_crit_edge ], [ %sunkaddr143, %._crit_edge.us.loopexit ]
  %.lcssa165 = phi double [ %.lcssa165.unr.ph, %.prol.loopexit203.._crit_edge.us_crit_edge ], [ %.lcssa281, %._crit_edge.us.loopexit ]
  %54 = fdiv double %.lcssa165, %2
  store double %54, double* %sunkaddr147.pre-phi, align 8
  %indvars.iv.next271 = add nuw nsw i64 %indvars.iv270, 1
  %exitcond273 = icmp eq i64 %indvars.iv.next271, 1200
  br i1 %exitcond273, label %.._crit_edge_crit_edge.loopexit, label %.lr.ph134.split.us

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit245:               ; preds = %.lr.ph134.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit245, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph128, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge89_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge89_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge89_crit_edge

.lr.ph128:                                        ; preds = %.lr.ph134.split.prol.loopexit, %.._crit_edge_crit_edge
  br i1 true, label %.lr.ph128.split.us.preheader, label %.lr.ph128.split.preheader

.lr.ph128.split.us.preheader:                     ; preds = %.lr.ph128
  %sunkaddr156 = ptrtoint double* %6 to i64
  %sunkaddr148 = ptrtoint double* %5 to i64
  br label %.lr.ph128.split.us

.lr.ph128.split.preheader:                        ; preds = %.lr.ph128
  br i1 true, label %.lr.ph128.split.prol.loopexit, label %.lr.ph128.split.prol

.lr.ph128.split.prol:                             ; preds = %.lr.ph128.split.preheader
  %55 = fdiv double 0.000000e+00, %2
  store double %55, double* %6, align 8
  %56 = tail call double @sqrt(double %55) #4
  %57 = fcmp ugt double %56, 1.000000e-01
  %58 = select i1 %57, double %56, double 1.000000e+00
  store double %58, double* %6, align 8
  br label %.lr.ph128.split.prol.loopexit

.lr.ph128.split.prol.loopexit:                    ; preds = %.lr.ph128.split.preheader, %.lr.ph128.split.prol
  %indvars.iv192.unr = phi i64 [ 0, %.lr.ph128.split.preheader ], [ 1, %.lr.ph128.split.prol ]
  br i1 false, label %._crit_edge.._crit_edge89_crit_edge, label %.lr.ph128.split.preheader217

.lr.ph128.split.preheader217:                     ; preds = %.lr.ph128.split.prol.loopexit
  %59 = fdiv double 0.000000e+00, %2
  br label %.lr.ph128.split

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %._crit_edge125.us
  %indvars.iv268 = phi i64 [ 0, %.lr.ph128.split.us.preheader ], [ %indvars.iv.next269, %._crit_edge125.us ]
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv268
  store double 0.000000e+00, double* %60, align 8
  br i1 true, label %.prol.loopexit188, label %.prol.preheader187

.prol.preheader187:                               ; preds = %.lr.ph128.split.us
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv268
  %62 = load double, double* %61, align 8
  %sunkaddr149.prol = shl nsw i64 %indvars.iv268, 3
  %sunkaddr150.prol = add i64 %sunkaddr148, %sunkaddr149.prol
  %sunkaddr151.prol = inttoptr i64 %sunkaddr150.prol to double*
  %63 = load double, double* %sunkaddr151.prol, align 8
  %64 = fsub double %62, %63
  %65 = fmul double %64, %64
  %66 = fadd double %65, 0.000000e+00
  %sunkaddr154.prol = add i64 %sunkaddr156, %sunkaddr149.prol
  %sunkaddr155.prol = inttoptr i64 %sunkaddr154.prol to double*
  store double %66, double* %sunkaddr155.prol, align 8
  br label %.prol.loopexit188

.prol.loopexit188:                                ; preds = %.prol.preheader187, %.lr.ph128.split.us
  %indvars.iv183.unr.ph = phi i64 [ 1, %.prol.preheader187 ], [ 0, %.lr.ph128.split.us ]
  %.unr191.ph = phi double [ %66, %.prol.preheader187 ], [ 0.000000e+00, %.lr.ph128.split.us ]
  %.lcssa164.unr.ph = phi double [ %66, %.prol.preheader187 ], [ undef, %.lr.ph128.split.us ]
  br i1 false, label %.prol.loopexit188.._crit_edge125.us_crit_edge, label %.lr.ph128.split.us.new.preheader

.prol.loopexit188.._crit_edge125.us_crit_edge:    ; preds = %.prol.loopexit188
  %.pre276 = shl nsw i64 %indvars.iv268, 3
  %.pre277 = add i64 %sunkaddr156, %.pre276
  %.pre278 = inttoptr i64 %.pre277 to double*
  br label %._crit_edge125.us

.lr.ph128.split.us.new.preheader:                 ; preds = %.prol.loopexit188
  %sunkaddr149 = shl nsw i64 %indvars.iv268, 3
  %sunkaddr150 = add i64 %sunkaddr148, %sunkaddr149
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  %sunkaddr154 = add i64 %sunkaddr156, %sunkaddr149
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to double*
  br label %.lr.ph128.split.us.new

.lr.ph128.split.us.new:                           ; preds = %.lr.ph128.split.us.new.preheader, %.lr.ph128.split.us.new
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.1, %.lr.ph128.split.us.new ], [ %indvars.iv183.unr.ph, %.lr.ph128.split.us.new.preheader ]
  %67 = phi double [ %79, %.lr.ph128.split.us.new ], [ %.unr191.ph, %.lr.ph128.split.us.new.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv183, i64 %indvars.iv268
  %69 = load double, double* %68, align 8
  %70 = load double, double* %sunkaddr151, align 8
  %71 = fsub double %69, %70
  %72 = fmul double %71, %71
  %73 = fadd double %67, %72
  store double %73, double* %sunkaddr155, align 8
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next184, i64 %indvars.iv268
  %75 = load double, double* %74, align 8
  %76 = load double, double* %sunkaddr151, align 8
  %77 = fsub double %75, %76
  %78 = fmul double %77, %77
  %79 = fadd double %73, %78
  store double %79, double* %sunkaddr155, align 8
  %indvars.iv.next184.1 = add nuw nsw i64 %indvars.iv183, 2
  %exitcond186.1 = icmp eq i64 %indvars.iv.next184.1, 1400
  br i1 %exitcond186.1, label %._crit_edge125.us.loopexit, label %.lr.ph128.split.us.new

._crit_edge125.us.loopexit:                       ; preds = %.lr.ph128.split.us.new
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %.prol.loopexit188.._crit_edge125.us_crit_edge, %._crit_edge125.us.loopexit
  %sunkaddr159.pre-phi = phi double* [ %.pre278, %.prol.loopexit188.._crit_edge125.us_crit_edge ], [ %sunkaddr155, %._crit_edge125.us.loopexit ]
  %.lcssa164 = phi double [ %.lcssa164.unr.ph, %.prol.loopexit188.._crit_edge125.us_crit_edge ], [ %79, %._crit_edge125.us.loopexit ]
  %80 = fdiv double %.lcssa164, %2
  store double %80, double* %sunkaddr159.pre-phi, align 8
  %81 = tail call double @sqrt(double %80) #4
  %82 = fcmp ugt double %81, 1.000000e-01
  %83 = select i1 %82, double %81, double 1.000000e+00
  store double %83, double* %sunkaddr159.pre-phi, align 8
  %indvars.iv.next269 = add nuw nsw i64 %indvars.iv268, 1
  %84 = icmp slt i64 %indvars.iv.next269, 1200
  br i1 %84, label %.lr.ph128.split.us, label %._crit_edge.._crit_edge89_crit_edge.loopexit

.lr.ph134.split:                                  ; preds = %.lr.ph134.split.preheader244, %.lr.ph134.split
  %indvars.iv207 = phi i64 [ %indvars.iv.next208.3, %.lr.ph134.split ], [ %indvars.iv207.ph, %.lr.ph134.split.preheader244 ]
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv207
  store double %10, double* %85, align 8
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208
  store double %10, double* %86, align 8
  %indvars.iv.next208.1 = add nsw i64 %indvars.iv207, 2
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.1
  store double %10, double* %87, align 8
  %indvars.iv.next208.2 = add nsw i64 %indvars.iv207, 3
  %88 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next208.2
  store double %10, double* %88, align 8
  %indvars.iv.next208.3 = add nsw i64 %indvars.iv207, 4
  %exitcond210.3 = icmp eq i64 %indvars.iv.next208.3, 1200
  br i1 %exitcond210.3, label %.._crit_edge_crit_edge.loopexit245, label %.lr.ph134.split, !llvm.loop !6

._crit_edge.._crit_edge89_crit_edge.loopexit:     ; preds = %._crit_edge125.us
  br label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge.loopexit243:  ; preds = %.lr.ph128.split
  br label %._crit_edge.._crit_edge89_crit_edge

._crit_edge.._crit_edge89_crit_edge:              ; preds = %.._crit_edge_crit_edge.._crit_edge.._crit_edge89_crit_edge_crit_edge, %._crit_edge.._crit_edge89_crit_edge.loopexit243, %._crit_edge.._crit_edge89_crit_edge.loopexit, %7, %.lr.ph128.split.prol.loopexit
  br i1 true, label %._crit_edge89.._crit_edge91_crit_edge.lr.ph, label %._crit_edge89.._crit_edge92_crit_edge

._crit_edge89.._crit_edge91_crit_edge.lr.ph:      ; preds = %._crit_edge.._crit_edge89_crit_edge
  br i1 true, label %._crit_edge89.._crit_edge91_crit_edge.us.preheader, label %._crit_edge89.._crit_edge92_crit_edge.thread

._crit_edge89.._crit_edge91_crit_edge.us.preheader: ; preds = %._crit_edge89.._crit_edge91_crit_edge.lr.ph
  br label %._crit_edge89.._crit_edge91_crit_edge.us

._crit_edge89.._crit_edge92_crit_edge.thread:     ; preds = %._crit_edge89.._crit_edge91_crit_edge.lr.ph
  br label %._crit_edge92._crit_edge

._crit_edge89.._crit_edge91_crit_edge.us:         ; preds = %._crit_edge91._crit_edge.us, %._crit_edge89.._crit_edge91_crit_edge.us.preheader
  %indvars.iv264 = phi i64 [ 0, %._crit_edge89.._crit_edge91_crit_edge.us.preheader ], [ %indvars.iv.next265, %._crit_edge91._crit_edge.us ]
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %._crit_edge89.._crit_edge91_crit_edge.us
  %indvars.iv178 = phi i64 [ 0, %._crit_edge89.._crit_edge91_crit_edge.us ], [ %indvars.iv.next179, %._crit_edge91.us ]
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv178
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv264, i64 %indvars.iv178
  %92 = load double, double* %91, align 8
  %93 = fsub double %92, %90
  store double %93, double* %91, align 8
  %94 = tail call double @sqrt(double %2) #4
  %95 = getelementptr inbounds double, double* %6, i64 %indvars.iv178
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = load double, double* %91, align 8
  %99 = fdiv double %98, %97
  store double %99, double* %91, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next179, 1200
  br i1 %exitcond181, label %._crit_edge91._crit_edge.us, label %._crit_edge91.us

._crit_edge91._crit_edge.us:                      ; preds = %._crit_edge91.us
  %indvars.iv.next265 = add nuw nsw i64 %indvars.iv264, 1
  %exitcond267 = icmp eq i64 %indvars.iv.next265, 1400
  br i1 %exitcond267, label %._crit_edge89.._crit_edge92_crit_edge.loopexit, label %._crit_edge89.._crit_edge91_crit_edge.us

.lr.ph128.split:                                  ; preds = %.lr.ph128.split.preheader217, %.lr.ph128.split
  %indvars.iv192 = phi i64 [ %indvars.iv.next193.1, %.lr.ph128.split ], [ %indvars.iv192.unr, %.lr.ph128.split.preheader217 ]
  %100 = getelementptr inbounds double, double* %6, i64 %indvars.iv192
  store double %59, double* %100, align 8
  %101 = tail call double @sqrt(double %59) #4
  %102 = fcmp ugt double %101, 1.000000e-01
  %103 = select i1 %102, double %101, double 1.000000e+00
  store double %103, double* %100, align 8
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next193
  store double %59, double* %104, align 8
  %105 = tail call double @sqrt(double %59) #4
  %106 = fcmp ugt double %105, 1.000000e-01
  %107 = select i1 %106, double %105, double 1.000000e+00
  store double %107, double* %104, align 8
  %indvars.iv.next193.1 = add nsw i64 %indvars.iv192, 2
  %exitcond195.1 = icmp eq i64 %indvars.iv.next193.1, 1200
  br i1 %exitcond195.1, label %._crit_edge.._crit_edge89_crit_edge.loopexit243, label %.lr.ph128.split

._crit_edge89.._crit_edge92_crit_edge.loopexit:   ; preds = %._crit_edge91._crit_edge.us
  br label %._crit_edge89.._crit_edge92_crit_edge

._crit_edge89.._crit_edge92_crit_edge:            ; preds = %._crit_edge89.._crit_edge92_crit_edge.loopexit, %._crit_edge.._crit_edge89_crit_edge
  br i1 true, label %.lr.ph109, label %._crit_edge92._crit_edge

.lr.ph109:                                        ; preds = %._crit_edge89.._crit_edge92_crit_edge
  br i1 true, label %.lr.ph109.split.us.preheader, label %.lr.ph109.split.preheader

.lr.ph109.split.us.preheader:                     ; preds = %.lr.ph109
  br label %.lr.ph109.split.us

.lr.ph109.split.preheader:                        ; preds = %.lr.ph109
  br label %.lr.ph109.split

.lr.ph109.split.us:                               ; preds = %._crit_edge92.us, %.lr.ph109.split.us.preheader
  %indvars.iv254 = phi i64 [ 0, %.lr.ph109.split.us.preheader ], [ %indvars.iv.next255, %._crit_edge92.us ]
  %indvars.iv249 = phi i64 [ 1, %.lr.ph109.split.us.preheader ], [ %indvars.iv.next250, %._crit_edge92.us ]
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv254, i64 %indvars.iv254
  store double 1.000000e+00, double* %108, align 8
  %indvars.iv.next255 = add nuw nsw i64 %indvars.iv254, 1
  %109 = icmp slt i64 %indvars.iv.next255, 1200
  br i1 %109, label %.lr.ph.us.us.preheader, label %._crit_edge92.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph109.split.us
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv254
  br label %.lr.ph.us.us

._crit_edge92.us.loopexit:                        ; preds = %._crit_edge101.us.us
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.loopexit, %.lr.ph109.split.us
  %indvars.iv.next250 = add nuw nsw i64 %indvars.iv249, 1
  %exitcond257 = icmp eq i64 %indvars.iv.next255, 1199
  br i1 %exitcond257, label %._crit_edge92._crit_edge.loopexit, label %.lr.ph109.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge101.us.us, %.lr.ph.us.us.preheader
  %indvars.iv251 = phi i64 [ %indvars.iv249, %.lr.ph.us.us.preheader ], [ %indvars.iv.next252, %._crit_edge101.us.us ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv254, i64 %indvars.iv251
  store double 0.000000e+00, double* %111, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %112 = load double, double* %110, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv251
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fadd double %115, 0.000000e+00
  store double %116, double* %111, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %116, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %116, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge101.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge101.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge101.us.us

._crit_edge101.us.us:                             ; preds = %._crit_edge101.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %130, %._crit_edge101.us.us.loopexit ]
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv251, i64 %indvars.iv254
  store double %.lcssa, double* %117, align 8
  %indvars.iv.next252 = add nuw nsw i64 %indvars.iv251, 1
  %exitcond253 = icmp eq i64 %indvars.iv.next252, 1200
  br i1 %exitcond253, label %._crit_edge92.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %118 = phi double [ %130, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv254
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv251
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fadd double %118, %123
  store double %124, double* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv254
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv251
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = fadd double %124, %129
  store double %130, double* %111, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge101.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph109.split:                                  ; preds = %._crit_edge92, %.lr.ph109.split.preheader
  %indvars.iv262 = phi i64 [ %indvars.iv.next263, %._crit_edge92 ], [ 0, %.lr.ph109.split.preheader ]
  %indvars.iv260 = phi i2 [ %indvars.iv.next261, %._crit_edge92 ], [ -1, %.lr.ph109.split.preheader ]
  %indvars.iv258 = phi i64 [ %indvars.iv.next259, %._crit_edge92 ], [ 2, %.lr.ph109.split.preheader ]
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %._crit_edge92 ], [ 1, %.lr.ph109.split.preheader ]
  %131 = zext i2 %indvars.iv260 to i64
  %132 = add nuw nsw i64 %131, 4294967295
  %133 = and i64 %132, 4294967295
  %134 = add i64 %indvars.iv258, %133
  %135 = sub i64 1198, %indvars.iv262
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv262, i64 %indvars.iv262
  store double 1.000000e+00, double* %137, align 8
  %indvars.iv.next263 = add nuw nsw i64 %indvars.iv262, 1
  %138 = icmp slt i64 %indvars.iv.next263, 1200
  br i1 %138, label %.lr.ph106.split.preheader, label %._crit_edge92

.lr.ph106.split.preheader:                        ; preds = %.lr.ph109.split
  %139 = sub i64 1199, %indvars.iv262
  %140 = trunc i64 %139 to i32
  %xtraiter173 = and i32 %140, 3
  %lcmp.mod174 = icmp eq i32 %xtraiter173, 0
  br i1 %lcmp.mod174, label %.lr.ph106.split.prol.loopexit, label %.lr.ph106.split.prol.preheader

.lr.ph106.split.prol.preheader:                   ; preds = %.lr.ph106.split.preheader
  br label %.lr.ph106.split.prol

.lr.ph106.split.prol:                             ; preds = %.lr.ph106.split.prol.preheader, %.lr.ph106.split.prol
  %indvars.iv168.prol = phi i64 [ %indvars.iv.next169.prol, %.lr.ph106.split.prol ], [ %indvars.iv166, %.lr.ph106.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph106.split.prol ], [ %xtraiter173, %.lr.ph106.split.prol.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv262, i64 %indvars.iv168.prol
  store double 0.000000e+00, double* %141, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv168.prol, i64 %indvars.iv262
  %143 = bitcast double* %142 to i64*
  store i64 0, i64* %143, align 8
  %indvars.iv.next169.prol = add nuw nsw i64 %indvars.iv168.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph106.split.prol.loopexit.loopexit, label %.lr.ph106.split.prol, !llvm.loop !8

.lr.ph106.split.prol.loopexit.loopexit:           ; preds = %.lr.ph106.split.prol
  br label %.lr.ph106.split.prol.loopexit

.lr.ph106.split.prol.loopexit:                    ; preds = %.lr.ph106.split.prol.loopexit.loopexit, %.lr.ph106.split.preheader
  %indvars.iv168.unr = phi i64 [ %indvars.iv166, %.lr.ph106.split.preheader ], [ %134, %.lr.ph106.split.prol.loopexit.loopexit ]
  %144 = icmp ult i32 %136, 3
  br i1 %144, label %._crit_edge92, label %.lr.ph106.split.preheader241

.lr.ph106.split.preheader241:                     ; preds = %.lr.ph106.split.prol.loopexit
  br label %.lr.ph106.split

.lr.ph106.split:                                  ; preds = %.lr.ph106.split.preheader241, %.lr.ph106.split
  %indvars.iv168 = phi i64 [ %indvars.iv.next169.3, %.lr.ph106.split ], [ %indvars.iv168.unr, %.lr.ph106.split.preheader241 ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv262, i64 %indvars.iv168
  store double 0.000000e+00, double* %145, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv168, i64 %indvars.iv262
  %147 = bitcast double* %146 to i64*
  store i64 0, i64* %147, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv262, i64 %indvars.iv.next169
  store double 0.000000e+00, double* %148, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169, i64 %indvars.iv262
  %150 = bitcast double* %149 to i64*
  store i64 0, i64* %150, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv262, i64 %indvars.iv.next169.1
  store double 0.000000e+00, double* %151, align 8
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169.1, i64 %indvars.iv262
  %153 = bitcast double* %152 to i64*
  store i64 0, i64* %153, align 8
  %indvars.iv.next169.2 = add nsw i64 %indvars.iv168, 3
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv262, i64 %indvars.iv.next169.2
  store double 0.000000e+00, double* %154, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next169.2, i64 %indvars.iv262
  %156 = bitcast double* %155 to i64*
  store i64 0, i64* %156, align 8
  %indvars.iv.next169.3 = add nsw i64 %indvars.iv168, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next169.3, 1200
  br i1 %exitcond.3, label %._crit_edge92.loopexit, label %.lr.ph106.split

._crit_edge92.loopexit:                           ; preds = %.lr.ph106.split
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %.lr.ph106.split.prol.loopexit, %.lr.ph109.split
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %exitcond = icmp eq i64 %indvars.iv.next263, 1199
  %indvars.iv.next259 = add nuw i64 %indvars.iv258, 1
  %indvars.iv.next261 = add i2 %indvars.iv260, -1
  br i1 %exitcond, label %._crit_edge92._crit_edge.loopexit242, label %.lr.ph109.split

._crit_edge92._crit_edge.loopexit:                ; preds = %._crit_edge92.us
  br label %._crit_edge92._crit_edge

._crit_edge92._crit_edge.loopexit242:             ; preds = %._crit_edge92
  br label %._crit_edge92._crit_edge

._crit_edge92._crit_edge:                         ; preds = %._crit_edge92._crit_edge.loopexit242, %._crit_edge92._crit_edge.loopexit, %._crit_edge89.._crit_edge92_crit_edge.thread, %._crit_edge89.._crit_edge92_crit_edge
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %157, align 8
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
  br i1 true, label %.._crit_edge_crit_edge.us.preheader, label %._crit_edge

.._crit_edge_crit_edge.us.preheader:              ; preds = %2
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %indvars.iv.next13, %._crit_edge._crit_edge.us ]
  %7 = trunc i64 %indvars.iv12 to i32
  %8 = mul nsw i32 %7, 1200
  %9 = zext i32 %8 to i64
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %11 = add i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge9.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge9.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond15, label %._crit_edge.loopexit, label %.._crit_edge_crit_edge.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
