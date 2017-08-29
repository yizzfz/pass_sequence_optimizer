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
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %19 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
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
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph150, label %._crit_edge.._crit_edge110_crit_edge

.lr.ph150:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph150.split.us.preheader, label %.lr.ph150.split.preheader

.lr.ph150.split.us.preheader:                     ; preds = %.lr.ph150
  %xtraiter220 = and i32 %1, 1
  %lcmp.mod221 = icmp eq i32 %xtraiter220, 0
  %10 = icmp eq i32 %1, 1
  %sunkaddr160 = ptrtoint double* %5 to i64
  %wide.trip.count216.1 = zext i32 %1 to i64
  %11 = zext i32 %0 to i64
  %12 = add nsw i64 %wide.trip.count216.1, -2
  br label %.lr.ph150.split.us

.lr.ph150.split.preheader:                        ; preds = %.lr.ph150
  %13 = add i32 %0, -1
  %xtraiter227 = and i32 %0, 3
  %lcmp.mod228 = icmp eq i32 %xtraiter227, 0
  br i1 %lcmp.mod228, label %.lr.ph150.split.prol.loopexit, label %.lr.ph150.split.prol.preheader

.lr.ph150.split.prol.preheader:                   ; preds = %.lr.ph150.split.preheader
  %14 = fdiv double 0.000000e+00, %2
  %15 = add nsw i32 %xtraiter227, -1
  br label %.lr.ph150.split.prol

.lr.ph150.split.prol:                             ; preds = %.lr.ph150.split.prol.preheader, %.lr.ph150.split.prol
  %indvars.iv223.prol = phi i64 [ %indvars.iv.next224.prol, %.lr.ph150.split.prol ], [ 0, %.lr.ph150.split.prol.preheader ]
  %prol.iter229 = phi i32 [ %prol.iter229.sub, %.lr.ph150.split.prol ], [ %xtraiter227, %.lr.ph150.split.prol.preheader ]
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv223.prol
  store double %14, double* %16, align 8
  %indvars.iv.next224.prol = add nuw nsw i64 %indvars.iv223.prol, 1
  %prol.iter229.sub = add nsw i32 %prol.iter229, -1
  %prol.iter229.cmp = icmp eq i32 %prol.iter229.sub, 0
  br i1 %prol.iter229.cmp, label %.lr.ph150.split.prol.loopexit.loopexit, label %.lr.ph150.split.prol, !llvm.loop !1

.lr.ph150.split.prol.loopexit.loopexit:           ; preds = %.lr.ph150.split.prol
  %17 = zext i32 %15 to i64
  %18 = add nuw nsw i64 %17, 1
  br label %.lr.ph150.split.prol.loopexit

.lr.ph150.split.prol.loopexit:                    ; preds = %.lr.ph150.split.prol.loopexit.loopexit, %.lr.ph150.split.preheader
  %indvars.iv223.unr = phi i64 [ 0, %.lr.ph150.split.preheader ], [ %18, %.lr.ph150.split.prol.loopexit.loopexit ]
  %19 = icmp ult i32 %13, 3
  br i1 %19, label %.lr.ph144, label %.lr.ph150.split.preheader235

.lr.ph150.split.preheader235:                     ; preds = %.lr.ph150.split.prol.loopexit
  %20 = fdiv double 0.000000e+00, %2
  %wide.trip.count225.3 = zext i32 %0 to i64
  %21 = add nsw i64 %wide.trip.count225.3, -4
  %22 = sub nsw i64 %21, %indvars.iv223.unr
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check = icmp ult i64 %24, 4
  br i1 %min.iters.check, label %.lr.ph150.split.preheader290, label %min.iters.checked

.lr.ph150.split.preheader290:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph150.split.preheader235
  %indvars.iv223.ph = phi i64 [ %indvars.iv223.unr, %min.iters.checked ], [ %indvars.iv223.unr, %.lr.ph150.split.preheader235 ], [ %ind.end, %middle.block ]
  br label %.lr.ph150.split

min.iters.checked:                                ; preds = %.lr.ph150.split.preheader235
  %n.mod.vf = and i64 %24, 3
  %n.vec = sub nsw i64 %24, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %25 = shl nuw i64 %23, 2
  %26 = add i64 %indvars.iv223.unr, %25
  %27 = add i64 %26, 4
  %28 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %27, %28
  br i1 %cmp.zero, label %.lr.ph150.split.preheader290, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert273 = insertelement <2 x double> undef, double %20, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert273, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %29 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv223.unr, %29
  %30 = add nsw i64 %offset.idx, 3
  %31 = add i64 %offset.idx, 11
  %32 = getelementptr inbounds double, double* %5, i64 %30
  %33 = getelementptr inbounds double, double* %5, i64 %31
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = getelementptr double, double* %33, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %35, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8
  %index.next = add i64 %index, 4
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph150.split.preheader290

.lr.ph150.split.us:                               ; preds = %._crit_edge.us, %.lr.ph150.split.us.preheader
  %indvars.iv268 = phi i64 [ 0, %.lr.ph150.split.us.preheader ], [ %indvars.iv.next269, %._crit_edge.us ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv268
  store double 0.000000e+00, double* %39, align 8
  br i1 %lcmp.mod221, label %.prol.loopexit219, label %.prol.preheader218

.prol.preheader218:                               ; preds = %.lr.ph150.split.us
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv268
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, 0.000000e+00
  %sunkaddr157.prol = shl nsw i64 %indvars.iv268, 3
  %sunkaddr158.prol = add i64 %sunkaddr160, %sunkaddr157.prol
  %sunkaddr159.prol = inttoptr i64 %sunkaddr158.prol to double*
  store double %42, double* %sunkaddr159.prol, align 8
  br label %.prol.loopexit219

.prol.loopexit219:                                ; preds = %.prol.preheader218, %.lr.ph150.split.us
  %indvars.iv214.unr.ph = phi i64 [ 1, %.prol.preheader218 ], [ 0, %.lr.ph150.split.us ]
  %.unr222.ph = phi double [ %42, %.prol.preheader218 ], [ 0.000000e+00, %.lr.ph150.split.us ]
  %.lcssa181.unr.ph = phi double [ %42, %.prol.preheader218 ], [ undef, %.lr.ph150.split.us ]
  br i1 %10, label %.prol.loopexit219.._crit_edge.us_crit_edge, label %.lr.ph150.split.us.new.preheader

.prol.loopexit219.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit219
  %.pre = shl nsw i64 %indvars.iv268, 3
  %.pre282 = add i64 %sunkaddr160, %.pre
  %.pre283 = inttoptr i64 %.pre282 to double*
  br label %._crit_edge.us

.lr.ph150.split.us.new.preheader:                 ; preds = %.prol.loopexit219
  %sunkaddr157 = shl nsw i64 %indvars.iv268, 3
  %sunkaddr158 = add i64 %sunkaddr160, %sunkaddr157
  %sunkaddr159 = inttoptr i64 %sunkaddr158 to double*
  %43 = sub nsw i64 %12, %indvars.iv214.unr.ph
  %44 = lshr i64 %43, 1
  %45 = and i64 %44, 1
  %lcmp.mod303 = icmp eq i64 %45, 0
  br i1 %lcmp.mod303, label %.lr.ph150.split.us.new.prol.preheader, label %.lr.ph150.split.us.new.prol.loopexit.unr-lcssa

.lr.ph150.split.us.new.prol.preheader:            ; preds = %.lr.ph150.split.us.new.preheader
  br label %.lr.ph150.split.us.new.prol

.lr.ph150.split.us.new.prol:                      ; preds = %.lr.ph150.split.us.new.prol.preheader
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv214.unr.ph, i64 %indvars.iv268
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %.unr222.ph
  store double %48, double* %sunkaddr159, align 8
  %indvars.iv.next215.prol = add nuw nsw i64 %indvars.iv214.unr.ph, 1
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next215.prol, i64 %indvars.iv268
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %sunkaddr159, align 8
  %indvars.iv.next215.1.prol = or i64 %indvars.iv214.unr.ph, 2
  br label %.lr.ph150.split.us.new.prol.loopexit.unr-lcssa

.lr.ph150.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph150.split.us.new.preheader, %.lr.ph150.split.us.new.prol
  %.lcssa301.unr.ph = phi double [ %51, %.lr.ph150.split.us.new.prol ], [ undef, %.lr.ph150.split.us.new.preheader ]
  %indvars.iv214.unr.ph304 = phi i64 [ %indvars.iv.next215.1.prol, %.lr.ph150.split.us.new.prol ], [ %indvars.iv214.unr.ph, %.lr.ph150.split.us.new.preheader ]
  %.unr.ph305 = phi double [ %51, %.lr.ph150.split.us.new.prol ], [ %.unr222.ph, %.lr.ph150.split.us.new.preheader ]
  br label %.lr.ph150.split.us.new.prol.loopexit

.lr.ph150.split.us.new.prol.loopexit:             ; preds = %.lr.ph150.split.us.new.prol.loopexit.unr-lcssa
  %52 = icmp eq i64 %44, 0
  br i1 %52, label %._crit_edge.us.loopexit, label %.lr.ph150.split.us.new.preheader.new

.lr.ph150.split.us.new.preheader.new:             ; preds = %.lr.ph150.split.us.new.prol.loopexit
  br label %.lr.ph150.split.us.new

.lr.ph150.split.us.new:                           ; preds = %.lr.ph150.split.us.new, %.lr.ph150.split.us.new.preheader.new
  %indvars.iv214 = phi i64 [ %indvars.iv214.unr.ph304, %.lr.ph150.split.us.new.preheader.new ], [ %indvars.iv.next215.1.1, %.lr.ph150.split.us.new ]
  %53 = phi double [ %.unr.ph305, %.lr.ph150.split.us.new.preheader.new ], [ %65, %.lr.ph150.split.us.new ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv214, i64 %indvars.iv268
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %sunkaddr159, align 8
  %indvars.iv.next215 = add nuw nsw i64 %indvars.iv214, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next215, i64 %indvars.iv268
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %sunkaddr159, align 8
  %indvars.iv.next215.1 = add nuw nsw i64 %indvars.iv214, 2
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next215.1, i64 %indvars.iv268
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %sunkaddr159, align 8
  %indvars.iv.next215.1306 = add nsw i64 %indvars.iv214, 3
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next215.1306, i64 %indvars.iv268
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %sunkaddr159, align 8
  %indvars.iv.next215.1.1 = add nsw i64 %indvars.iv214, 4
  %exitcond217.1.1 = icmp eq i64 %indvars.iv.next215.1.1, %wide.trip.count216.1
  br i1 %exitcond217.1.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph150.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph150.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph150.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %.lcssa301 = phi double [ %.lcssa301.unr.ph, %.lr.ph150.split.us.new.prol.loopexit ], [ %65, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit219.._crit_edge.us_crit_edge
  %sunkaddr163.pre-phi = phi double* [ %.pre283, %.prol.loopexit219.._crit_edge.us_crit_edge ], [ %sunkaddr159, %._crit_edge.us.loopexit ]
  %.lcssa181 = phi double [ %.lcssa181.unr.ph, %.prol.loopexit219.._crit_edge.us_crit_edge ], [ %.lcssa301, %._crit_edge.us.loopexit ]
  %66 = fdiv double %.lcssa181, %2
  store double %66, double* %sunkaddr163.pre-phi, align 8
  %indvars.iv.next269 = add nuw nsw i64 %indvars.iv268, 1
  %exitcond298 = icmp eq i64 %indvars.iv.next269, %11
  br i1 %exitcond298, label %.._crit_edge_crit_edge.loopexit, label %.lr.ph150.split.us

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit291:               ; preds = %.lr.ph150.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit291, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph144, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge110_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge110_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge110_crit_edge

.lr.ph144:                                        ; preds = %.lr.ph150.split.prol.loopexit, %.._crit_edge_crit_edge
  br i1 %9, label %.lr.ph144.split.us.preheader, label %.lr.ph144.split.preheader

.lr.ph144.split.us.preheader:                     ; preds = %.lr.ph144
  %xtraiter205 = and i32 %1, 1
  %lcmp.mod206 = icmp eq i32 %xtraiter205, 0
  %67 = icmp eq i32 %1, 1
  %sunkaddr172 = ptrtoint double* %6 to i64
  %sunkaddr164 = ptrtoint double* %5 to i64
  %wide.trip.count201.1 = zext i32 %1 to i64
  %68 = sext i32 %0 to i64
  br label %.lr.ph144.split.us

.lr.ph144.split.preheader:                        ; preds = %.lr.ph144
  %xtraiter212 = and i32 %0, 1
  %lcmp.mod213 = icmp eq i32 %xtraiter212, 0
  br i1 %lcmp.mod213, label %.lr.ph144.split.prol.loopexit, label %.lr.ph144.split.prol

.lr.ph144.split.prol:                             ; preds = %.lr.ph144.split.preheader
  %69 = fdiv double 0.000000e+00, %2
  store double %69, double* %6, align 8
  %70 = tail call double @sqrt(double %69) #4
  %71 = fcmp ugt double %70, 1.000000e-01
  %72 = select i1 %71, double %70, double 1.000000e+00
  store double %72, double* %6, align 8
  br label %.lr.ph144.split.prol.loopexit

.lr.ph144.split.prol.loopexit:                    ; preds = %.lr.ph144.split.preheader, %.lr.ph144.split.prol
  %indvars.iv208.unr = phi i64 [ 0, %.lr.ph144.split.preheader ], [ 1, %.lr.ph144.split.prol ]
  %73 = icmp eq i32 %0, 1
  br i1 %73, label %._crit_edge.._crit_edge110_crit_edge, label %.lr.ph144.split.preheader233

.lr.ph144.split.preheader233:                     ; preds = %.lr.ph144.split.prol.loopexit
  %74 = fdiv double 0.000000e+00, %2
  %wide.trip.count210.1 = zext i32 %0 to i64
  br label %.lr.ph144.split

.lr.ph144.split.us:                               ; preds = %.lr.ph144.split.us.preheader, %._crit_edge141.us
  %indvars.iv266 = phi i64 [ 0, %.lr.ph144.split.us.preheader ], [ %indvars.iv.next267, %._crit_edge141.us ]
  %75 = getelementptr inbounds double, double* %6, i64 %indvars.iv266
  store double 0.000000e+00, double* %75, align 8
  br i1 %lcmp.mod206, label %.prol.loopexit204, label %.prol.preheader203

.prol.preheader203:                               ; preds = %.lr.ph144.split.us
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv266
  %77 = load double, double* %76, align 8
  %sunkaddr165.prol = shl nsw i64 %indvars.iv266, 3
  %sunkaddr166.prol = add i64 %sunkaddr164, %sunkaddr165.prol
  %sunkaddr167.prol = inttoptr i64 %sunkaddr166.prol to double*
  %78 = load double, double* %sunkaddr167.prol, align 8
  %79 = fsub double %77, %78
  %80 = fmul double %79, %79
  %81 = fadd double %80, 0.000000e+00
  %sunkaddr170.prol = add i64 %sunkaddr172, %sunkaddr165.prol
  %sunkaddr171.prol = inttoptr i64 %sunkaddr170.prol to double*
  store double %81, double* %sunkaddr171.prol, align 8
  br label %.prol.loopexit204

.prol.loopexit204:                                ; preds = %.prol.preheader203, %.lr.ph144.split.us
  %indvars.iv199.unr.ph = phi i64 [ 1, %.prol.preheader203 ], [ 0, %.lr.ph144.split.us ]
  %.unr207.ph = phi double [ %81, %.prol.preheader203 ], [ 0.000000e+00, %.lr.ph144.split.us ]
  %.lcssa180.unr.ph = phi double [ %81, %.prol.preheader203 ], [ undef, %.lr.ph144.split.us ]
  br i1 %67, label %.prol.loopexit204.._crit_edge141.us_crit_edge, label %.lr.ph144.split.us.new.preheader

.prol.loopexit204.._crit_edge141.us_crit_edge:    ; preds = %.prol.loopexit204
  %.pre284 = shl nsw i64 %indvars.iv266, 3
  %.pre285 = add i64 %sunkaddr172, %.pre284
  %.pre286 = inttoptr i64 %.pre285 to double*
  br label %._crit_edge141.us

.lr.ph144.split.us.new.preheader:                 ; preds = %.prol.loopexit204
  %sunkaddr165 = shl nsw i64 %indvars.iv266, 3
  %sunkaddr166 = add i64 %sunkaddr164, %sunkaddr165
  %sunkaddr167 = inttoptr i64 %sunkaddr166 to double*
  %sunkaddr170 = add i64 %sunkaddr172, %sunkaddr165
  %sunkaddr171 = inttoptr i64 %sunkaddr170 to double*
  br label %.lr.ph144.split.us.new

.lr.ph144.split.us.new:                           ; preds = %.lr.ph144.split.us.new.preheader, %.lr.ph144.split.us.new
  %indvars.iv199 = phi i64 [ %indvars.iv.next200.1, %.lr.ph144.split.us.new ], [ %indvars.iv199.unr.ph, %.lr.ph144.split.us.new.preheader ]
  %82 = phi double [ %94, %.lr.ph144.split.us.new ], [ %.unr207.ph, %.lr.ph144.split.us.new.preheader ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv199, i64 %indvars.iv266
  %84 = load double, double* %83, align 8
  %85 = load double, double* %sunkaddr167, align 8
  %86 = fsub double %84, %85
  %87 = fmul double %86, %86
  %88 = fadd double %82, %87
  store double %88, double* %sunkaddr171, align 8
  %indvars.iv.next200 = add nuw nsw i64 %indvars.iv199, 1
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next200, i64 %indvars.iv266
  %90 = load double, double* %89, align 8
  %91 = load double, double* %sunkaddr167, align 8
  %92 = fsub double %90, %91
  %93 = fmul double %92, %92
  %94 = fadd double %88, %93
  store double %94, double* %sunkaddr171, align 8
  %indvars.iv.next200.1 = add nuw nsw i64 %indvars.iv199, 2
  %exitcond202.1 = icmp eq i64 %indvars.iv.next200.1, %wide.trip.count201.1
  br i1 %exitcond202.1, label %._crit_edge141.us.loopexit, label %.lr.ph144.split.us.new

._crit_edge141.us.loopexit:                       ; preds = %.lr.ph144.split.us.new
  br label %._crit_edge141.us

._crit_edge141.us:                                ; preds = %._crit_edge141.us.loopexit, %.prol.loopexit204.._crit_edge141.us_crit_edge
  %sunkaddr175.pre-phi = phi double* [ %.pre286, %.prol.loopexit204.._crit_edge141.us_crit_edge ], [ %sunkaddr171, %._crit_edge141.us.loopexit ]
  %.lcssa180 = phi double [ %.lcssa180.unr.ph, %.prol.loopexit204.._crit_edge141.us_crit_edge ], [ %94, %._crit_edge141.us.loopexit ]
  %95 = fdiv double %.lcssa180, %2
  store double %95, double* %sunkaddr175.pre-phi, align 8
  %96 = tail call double @sqrt(double %95) #4
  %97 = fcmp ugt double %96, 1.000000e-01
  %98 = select i1 %97, double %96, double 1.000000e+00
  store double %98, double* %sunkaddr175.pre-phi, align 8
  %indvars.iv.next267 = add nuw nsw i64 %indvars.iv266, 1
  %99 = icmp slt i64 %indvars.iv.next267, %68
  br i1 %99, label %.lr.ph144.split.us, label %._crit_edge.._crit_edge110_crit_edge.loopexit

.lr.ph150.split:                                  ; preds = %.lr.ph150.split.preheader290, %.lr.ph150.split
  %indvars.iv223 = phi i64 [ %indvars.iv.next224.3, %.lr.ph150.split ], [ %indvars.iv223.ph, %.lr.ph150.split.preheader290 ]
  %100 = getelementptr inbounds double, double* %5, i64 %indvars.iv223
  store double %20, double* %100, align 8
  %indvars.iv.next224 = add nuw nsw i64 %indvars.iv223, 1
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next224
  store double %20, double* %101, align 8
  %indvars.iv.next224.1 = add nsw i64 %indvars.iv223, 2
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next224.1
  store double %20, double* %102, align 8
  %indvars.iv.next224.2 = add nsw i64 %indvars.iv223, 3
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next224.2
  store double %20, double* %103, align 8
  %indvars.iv.next224.3 = add nsw i64 %indvars.iv223, 4
  %exitcond226.3 = icmp eq i64 %indvars.iv.next224.3, %wide.trip.count225.3
  br i1 %exitcond226.3, label %.._crit_edge_crit_edge.loopexit291, label %.lr.ph150.split, !llvm.loop !6

._crit_edge.._crit_edge110_crit_edge.loopexit:    ; preds = %._crit_edge141.us
  br label %._crit_edge.._crit_edge110_crit_edge

._crit_edge.._crit_edge110_crit_edge.loopexit289: ; preds = %.lr.ph144.split
  br label %._crit_edge.._crit_edge110_crit_edge

._crit_edge.._crit_edge110_crit_edge:             ; preds = %._crit_edge.._crit_edge110_crit_edge.loopexit289, %._crit_edge.._crit_edge110_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge110_crit_edge_crit_edge, %7, %.lr.ph144.split.prol.loopexit
  %104 = icmp sgt i32 %1, 0
  br i1 %104, label %._crit_edge110.._crit_edge112_crit_edge.lr.ph, label %._crit_edge110.._crit_edge113_crit_edge

._crit_edge110.._crit_edge112_crit_edge.lr.ph:    ; preds = %._crit_edge.._crit_edge110_crit_edge
  br i1 %8, label %._crit_edge110.._crit_edge112_crit_edge.us.preheader, label %._crit_edge110.._crit_edge113_crit_edge.thread

._crit_edge110.._crit_edge112_crit_edge.us.preheader: ; preds = %._crit_edge110.._crit_edge112_crit_edge.lr.ph
  %wide.trip.count196 = zext i32 %0 to i64
  %105 = zext i32 %1 to i64
  br label %._crit_edge110.._crit_edge112_crit_edge.us

._crit_edge110.._crit_edge113_crit_edge.thread:   ; preds = %._crit_edge110.._crit_edge112_crit_edge.lr.ph
  %106 = add nsw i32 %0, -1
  br label %._crit_edge113._crit_edge

._crit_edge110.._crit_edge112_crit_edge.us:       ; preds = %._crit_edge112._crit_edge.us, %._crit_edge110.._crit_edge112_crit_edge.us.preheader
  %indvars.iv262 = phi i64 [ 0, %._crit_edge110.._crit_edge112_crit_edge.us.preheader ], [ %indvars.iv.next263, %._crit_edge112._crit_edge.us ]
  br label %._crit_edge112.us

._crit_edge112.us:                                ; preds = %._crit_edge112.us, %._crit_edge110.._crit_edge112_crit_edge.us
  %indvars.iv194 = phi i64 [ 0, %._crit_edge110.._crit_edge112_crit_edge.us ], [ %indvars.iv.next195, %._crit_edge112.us ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv194
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv262, i64 %indvars.iv194
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %112 = tail call double @sqrt(double %2) #4
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv194
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = load double, double* %109, align 8
  %117 = fdiv double %116, %115
  store double %117, double* %109, align 8
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %exitcond197 = icmp eq i64 %indvars.iv.next195, %wide.trip.count196
  br i1 %exitcond197, label %._crit_edge112._crit_edge.us, label %._crit_edge112.us

._crit_edge112._crit_edge.us:                     ; preds = %._crit_edge112.us
  %indvars.iv.next263 = add nuw nsw i64 %indvars.iv262, 1
  %exitcond297 = icmp eq i64 %indvars.iv.next263, %105
  br i1 %exitcond297, label %._crit_edge110.._crit_edge113_crit_edge.loopexit, label %._crit_edge110.._crit_edge112_crit_edge.us

.lr.ph144.split:                                  ; preds = %.lr.ph144.split.preheader233, %.lr.ph144.split
  %indvars.iv208 = phi i64 [ %indvars.iv.next209.1, %.lr.ph144.split ], [ %indvars.iv208.unr, %.lr.ph144.split.preheader233 ]
  %118 = getelementptr inbounds double, double* %6, i64 %indvars.iv208
  store double %74, double* %118, align 8
  %119 = tail call double @sqrt(double %74) #4
  %120 = fcmp ugt double %119, 1.000000e-01
  %121 = select i1 %120, double %119, double 1.000000e+00
  store double %121, double* %118, align 8
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %122 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next209
  store double %74, double* %122, align 8
  %123 = tail call double @sqrt(double %74) #4
  %124 = fcmp ugt double %123, 1.000000e-01
  %125 = select i1 %124, double %123, double 1.000000e+00
  store double %125, double* %122, align 8
  %indvars.iv.next209.1 = add nsw i64 %indvars.iv208, 2
  %exitcond211.1 = icmp eq i64 %indvars.iv.next209.1, %wide.trip.count210.1
  br i1 %exitcond211.1, label %._crit_edge.._crit_edge110_crit_edge.loopexit289, label %.lr.ph144.split

._crit_edge110.._crit_edge113_crit_edge.loopexit: ; preds = %._crit_edge112._crit_edge.us
  br label %._crit_edge110.._crit_edge113_crit_edge

._crit_edge110.._crit_edge113_crit_edge:          ; preds = %._crit_edge110.._crit_edge113_crit_edge.loopexit, %._crit_edge.._crit_edge110_crit_edge
  %126 = add nsw i32 %0, -1
  %127 = icmp sgt i32 %0, 1
  br i1 %127, label %._crit_edge113.._crit_edge114_crit_edge.lr.ph, label %._crit_edge113._crit_edge

._crit_edge113.._crit_edge114_crit_edge.lr.ph:    ; preds = %._crit_edge110.._crit_edge113_crit_edge
  br i1 %104, label %._crit_edge113.._crit_edge114_crit_edge.us.preheader, label %._crit_edge113.._crit_edge114_crit_edge.preheader

._crit_edge113.._crit_edge114_crit_edge.us.preheader: ; preds = %._crit_edge113.._crit_edge114_crit_edge.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %128 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %129 = sext i32 %0 to i64
  %130 = zext i32 %0 to i64
  %131 = zext i32 %126 to i64
  br label %._crit_edge113.._crit_edge114_crit_edge.us

._crit_edge113.._crit_edge114_crit_edge.preheader: ; preds = %._crit_edge113.._crit_edge114_crit_edge.lr.ph
  %132 = zext i32 %126 to i64
  %133 = add i32 %0, -2
  %134 = zext i32 %133 to i64
  %wide.trip.count186.3 = zext i32 %0 to i64
  %135 = trunc i32 %126 to i2
  %136 = sext i32 %0 to i64
  br label %._crit_edge113.._crit_edge114_crit_edge

._crit_edge113.._crit_edge114_crit_edge.us:       ; preds = %._crit_edge113.us, %._crit_edge113.._crit_edge114_crit_edge.us.preheader
  %indvars.iv252 = phi i64 [ 0, %._crit_edge113.._crit_edge114_crit_edge.us.preheader ], [ %indvars.iv.next253, %._crit_edge113.us ]
  %indvars.iv247 = phi i64 [ 1, %._crit_edge113.._crit_edge114_crit_edge.us.preheader ], [ %indvars.iv.next248, %._crit_edge113.us ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv252, i64 %indvars.iv252
  store double 1.000000e+00, double* %137, align 8
  %indvars.iv.next253 = add nuw nsw i64 %indvars.iv252, 1
  %138 = icmp slt i64 %indvars.iv.next253, %129
  br i1 %138, label %.lr.ph.us.us.preheader, label %._crit_edge113.us

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge113.._crit_edge114_crit_edge.us
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv252
  br label %.lr.ph.us.us

._crit_edge113.us.loopexit:                       ; preds = %._crit_edge123.us.us
  br label %._crit_edge113.us

._crit_edge113.us:                                ; preds = %._crit_edge113.us.loopexit, %._crit_edge113.._crit_edge114_crit_edge.us
  %indvars.iv.next248 = add nuw nsw i64 %indvars.iv247, 1
  %exitcond296 = icmp eq i64 %indvars.iv.next253, %131
  br i1 %exitcond296, label %._crit_edge113._crit_edge.loopexit, label %._crit_edge113.._crit_edge114_crit_edge.us

.lr.ph.us.us:                                     ; preds = %._crit_edge123.us.us, %.lr.ph.us.us.preheader
  %indvars.iv249 = phi i64 [ %indvars.iv247, %.lr.ph.us.us.preheader ], [ %indvars.iv.next250, %._crit_edge123.us.us ]
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv252, i64 %indvars.iv249
  store double 0.000000e+00, double* %140, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %141 = load double, double* %139, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv249
  %143 = load double, double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %144, 0.000000e+00
  store double %145, double* %140, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %145, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %145, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %128, label %._crit_edge123.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge123.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge123.us.us

._crit_edge123.us.us:                             ; preds = %._crit_edge123.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %159, %._crit_edge123.us.us.loopexit ]
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv249, i64 %indvars.iv252
  store double %.lcssa, double* %146, align 8
  %indvars.iv.next250 = add nuw nsw i64 %indvars.iv249, 1
  %exitcond295 = icmp eq i64 %indvars.iv.next250, %130
  br i1 %exitcond295, label %._crit_edge113.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %147 = phi double [ %159, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv252
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv249
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = fadd double %147, %152
  store double %153, double* %140, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv252
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv249
  %157 = load double, double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fadd double %153, %158
  store double %159, double* %140, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge123.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge113.._crit_edge114_crit_edge:          ; preds = %._crit_edge113, %._crit_edge113.._crit_edge114_crit_edge.preheader
  %indvars.iv260 = phi i64 [ %indvars.iv.next261, %._crit_edge113 ], [ 0, %._crit_edge113.._crit_edge114_crit_edge.preheader ]
  %indvars.iv258 = phi i2 [ %indvars.iv.next259, %._crit_edge113 ], [ %135, %._crit_edge113.._crit_edge114_crit_edge.preheader ]
  %indvars.iv256 = phi i64 [ %indvars.iv.next257, %._crit_edge113 ], [ 2, %._crit_edge113.._crit_edge114_crit_edge.preheader ]
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %._crit_edge113 ], [ 1, %._crit_edge113.._crit_edge114_crit_edge.preheader ]
  %160 = zext i2 %indvars.iv258 to i64
  %161 = add nuw nsw i64 %160, 4294967295
  %162 = and i64 %161, 4294967295
  %163 = add i64 %indvars.iv256, %162
  %164 = sub i64 %134, %indvars.iv260
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv260, i64 %indvars.iv260
  store double 1.000000e+00, double* %166, align 8
  %indvars.iv.next261 = add nuw nsw i64 %indvars.iv260, 1
  %167 = icmp slt i64 %indvars.iv.next261, %136
  br i1 %167, label %.lr.ph124.split.preheader, label %._crit_edge113

.lr.ph124.split.preheader:                        ; preds = %._crit_edge113.._crit_edge114_crit_edge
  %168 = sub i64 %132, %indvars.iv260
  %169 = trunc i64 %168 to i32
  %xtraiter189 = and i32 %169, 3
  %lcmp.mod190 = icmp eq i32 %xtraiter189, 0
  br i1 %lcmp.mod190, label %.lr.ph124.split.prol.loopexit, label %.lr.ph124.split.prol.preheader

.lr.ph124.split.prol.preheader:                   ; preds = %.lr.ph124.split.preheader
  br label %.lr.ph124.split.prol

.lr.ph124.split.prol:                             ; preds = %.lr.ph124.split.prol.preheader, %.lr.ph124.split.prol
  %indvars.iv184.prol = phi i64 [ %indvars.iv.next185.prol, %.lr.ph124.split.prol ], [ %indvars.iv182, %.lr.ph124.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph124.split.prol ], [ %xtraiter189, %.lr.ph124.split.prol.preheader ]
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv260, i64 %indvars.iv184.prol
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv184.prol, i64 %indvars.iv260
  store double 0.000000e+00, double* %171, align 8
  %indvars.iv.next185.prol = add nuw nsw i64 %indvars.iv184.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph124.split.prol.loopexit.loopexit, label %.lr.ph124.split.prol, !llvm.loop !8

.lr.ph124.split.prol.loopexit.loopexit:           ; preds = %.lr.ph124.split.prol
  br label %.lr.ph124.split.prol.loopexit

.lr.ph124.split.prol.loopexit:                    ; preds = %.lr.ph124.split.prol.loopexit.loopexit, %.lr.ph124.split.preheader
  %indvars.iv184.unr = phi i64 [ %indvars.iv182, %.lr.ph124.split.preheader ], [ %163, %.lr.ph124.split.prol.loopexit.loopexit ]
  %172 = icmp ult i32 %165, 3
  br i1 %172, label %._crit_edge113, label %.lr.ph124.split.preheader287

.lr.ph124.split.preheader287:                     ; preds = %.lr.ph124.split.prol.loopexit
  br label %.lr.ph124.split

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader287, %.lr.ph124.split
  %indvars.iv184 = phi i64 [ %indvars.iv.next185.3, %.lr.ph124.split ], [ %indvars.iv184.unr, %.lr.ph124.split.preheader287 ]
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv260, i64 %indvars.iv184
  store double 0.000000e+00, double* %173, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv184, i64 %indvars.iv260
  store double 0.000000e+00, double* %174, align 8
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv260, i64 %indvars.iv.next185
  store double 0.000000e+00, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next185, i64 %indvars.iv260
  store double 0.000000e+00, double* %176, align 8
  %indvars.iv.next185.1 = add nsw i64 %indvars.iv184, 2
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv260, i64 %indvars.iv.next185.1
  store double 0.000000e+00, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next185.1, i64 %indvars.iv260
  store double 0.000000e+00, double* %178, align 8
  %indvars.iv.next185.2 = add nsw i64 %indvars.iv184, 3
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv260, i64 %indvars.iv.next185.2
  store double 0.000000e+00, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next185.2, i64 %indvars.iv260
  store double 0.000000e+00, double* %180, align 8
  %indvars.iv.next185.3 = add nsw i64 %indvars.iv184, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next185.3, %wide.trip.count186.3
  br i1 %exitcond.3, label %._crit_edge113.loopexit, label %.lr.ph124.split

._crit_edge113.loopexit:                          ; preds = %.lr.ph124.split
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.lr.ph124.split.prol.loopexit, %._crit_edge113.._crit_edge114_crit_edge
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond = icmp eq i64 %indvars.iv.next261, %132
  %indvars.iv.next257 = add nuw i64 %indvars.iv256, 1
  %indvars.iv.next259 = add i2 %indvars.iv258, -1
  br i1 %exitcond, label %._crit_edge113._crit_edge.loopexit288, label %._crit_edge113.._crit_edge114_crit_edge

._crit_edge113._crit_edge.loopexit:               ; preds = %._crit_edge113.us
  br label %._crit_edge113._crit_edge

._crit_edge113._crit_edge.loopexit288:            ; preds = %._crit_edge113
  br label %._crit_edge113._crit_edge

._crit_edge113._crit_edge:                        ; preds = %._crit_edge113._crit_edge.loopexit288, %._crit_edge113._crit_edge.loopexit, %._crit_edge110.._crit_edge113_crit_edge.thread, %._crit_edge110.._crit_edge113_crit_edge
  %181 = phi i32 [ %106, %._crit_edge110.._crit_edge113_crit_edge.thread ], [ %126, %._crit_edge110.._crit_edge113_crit_edge ], [ %126, %._crit_edge113._crit_edge.loopexit ], [ %126, %._crit_edge113._crit_edge.loopexit288 ]
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %182, i64 %182
  store double 1.000000e+00, double* %183, align 8
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
  br i1 %7, label %.._crit_edge12_crit_edge.us.preheader, label %._crit_edge15

.._crit_edge12_crit_edge.us.preheader:            ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge12_crit_edge.us

.._crit_edge12_crit_edge.us:                      ; preds = %._crit_edge12._crit_edge.us, %.._crit_edge12_crit_edge.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.._crit_edge12_crit_edge.us.preheader ], [ %indvars.iv.next17, %._crit_edge12._crit_edge.us ]
  %8 = trunc i64 %indvars.iv16 to i32
  %9 = mul nsw i32 %8, %0
  %10 = zext i32 %9 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge.us, %.._crit_edge12_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge12_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge12._crit_edge.us, label %11

._crit_edge12._crit_edge.us:                      ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %.._crit_edge12_crit_edge.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge12._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
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
