; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %19 ]
  %4 = trunc i64 %indvars.iv5 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %15, %7
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1400
  br i1 %exitcond7, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph53, label %.preheader9

.lr.ph53:                                         ; preds = %6
  br i1 true, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  br i1 false, label %.lr.ph53.split.preheader157, label %min.iters.checked

.lr.ph53.split.preheader157:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph53.split.preheader
  %indvars.iv88.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph53.split.preheader ], [ 1200, %middle.block ]
  br label %.lr.ph53.split

min.iters.checked:                                ; preds = %.lr.ph53.split.preheader
  br i1 false, label %.lr.ph53.split.preheader157, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert127 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat128 = shufflevector <2 x double> %broadcast.splatinsert127, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 false, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %7 = bitcast double* %5 to <2 x double>*
  %8 = fdiv <2 x double> zeroinitializer, %broadcast.splat128
  store <2 x double> %8, <2 x double>* %7, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ 2, %vector.body.prol ]
  br i1 false, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %9 = shl i64 %index, 32
  %10 = ashr exact i64 %9, 32
  %11 = getelementptr inbounds double, double* %5, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %12, align 8
  %13 = getelementptr inbounds double, double* %5, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %14, align 8
  %15 = fdiv <2 x double> %wide.load, %broadcast.splat128
  store <2 x double> %15, <2 x double>* %14, align 8
  %index.next = add i64 %index, 2
  %16 = shl i64 %index.next, 32
  %17 = ashr exact i64 %16, 32
  %18 = getelementptr inbounds double, double* %5, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %20 = getelementptr inbounds double, double* %5, i64 %index.next
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %21, align 8
  %22 = fdiv <2 x double> %wide.load.1, %broadcast.splat128
  store <2 x double> %22, <2 x double>* %21, align 8
  %index.next.1 = add i64 %index, 4
  %23 = icmp eq i64 %index.next.1, 1200
  br i1 %23, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !1

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 true, label %.preheader9, label %.lr.ph53.split.preheader157

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %sunkaddr160 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %._crit_edge48.us, %.lr.ph53.split.us.preheader
  %indvars.iv85 = phi i64 [ 0, %.lr.ph53.split.us.preheader ], [ %indvars.iv.next86, %._crit_edge48.us ]
  %sext91 = shl i64 %indvars.iv85, 32
  %24 = ashr exact i64 %sext91, 32
  %25 = getelementptr inbounds double, double* %5, i64 %24
  store double 0.000000e+00, double* %25, align 8
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv85
  %.pre = load double, double* %26, align 8
  br i1 true, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph53.split.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv85
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %.pre
  %sunkaddr117.prol = shl i64 %indvars.iv85, 3
  %sunkaddr118.prol = add i64 %sunkaddr.prol, %sunkaddr117.prol
  %sunkaddr119.prol = inttoptr i64 %sunkaddr118.prol to double*
  store double %29, double* %sunkaddr119.prol, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph53.split.us, %._crit_edge.prol
  %.unr178.ph = phi double [ %29, %._crit_edge.prol ], [ %.pre, %.lr.ph53.split.us ]
  %indvars.iv82.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.lr.ph53.split.us ]
  %.lcssa166.unr.ph = phi double [ %29, %._crit_edge.prol ], [ undef, %.lr.ph53.split.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge48.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %._crit_edge.prol.loopexit
  %sunkaddr117 = shl i64 %indvars.iv85, 3
  %sunkaddr118 = add i64 %sunkaddr, %sunkaddr117
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to double*
  %sunkaddr117.1 = shl i64 %indvars.iv85, 3
  %sunkaddr118.1 = add i64 %sunkaddr.1, %sunkaddr117.1
  %sunkaddr119.1 = inttoptr i64 %sunkaddr118.1 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph53.split.us.new
  %30 = phi double [ %.unr178.ph, %.lr.ph53.split.us.new ], [ %36, %._crit_edge ]
  %indvars.iv82 = phi i64 [ %indvars.iv82.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next83.1, %._crit_edge ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv82, i64 %indvars.iv85
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %sunkaddr119, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next83, i64 %indvars.iv85
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %sunkaddr119.1, align 8
  %indvars.iv.next83.1 = add nuw nsw i64 %indvars.iv82, 2
  %37 = icmp slt i64 %indvars.iv.next83.1, 1400
  br i1 %37, label %._crit_edge, label %._crit_edge48.us.unr-lcssa

._crit_edge48.us.unr-lcssa:                       ; preds = %._crit_edge
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge.prol.loopexit, %._crit_edge48.us.unr-lcssa
  %.lcssa166 = phi double [ %.lcssa166.unr.ph, %._crit_edge.prol.loopexit ], [ %36, %._crit_edge48.us.unr-lcssa ]
  %38 = fdiv double %.lcssa166, %2
  %sunkaddr161 = shl i64 %indvars.iv85, 3
  %sunkaddr162 = add i64 %sunkaddr160, %sunkaddr161
  %sunkaddr163 = inttoptr i64 %sunkaddr162 to double*
  store double %38, double* %sunkaddr163, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond190 = icmp ne i64 %indvars.iv.next86, 1200
  br i1 %exitcond190, label %.lr.ph53.split.us, label %.preheader9.loopexit

.preheader9.loopexit:                             ; preds = %._crit_edge48.us
  br label %.preheader9

.preheader9.loopexit165:                          ; preds = %.lr.ph53.split
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit165, %.preheader9.loopexit, %middle.block, %6
  br i1 true, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  br i1 true, label %.preheader8.us.preheader, label %._crit_edge19

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %scevgep141 = getelementptr double, double* %5, i64 1200
  %39 = bitcast double* %5 to <2 x double>*
  %40 = getelementptr double, double* %5, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge38.us, %.preheader8.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next81, %._crit_edge38.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 0
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 1200
  br i1 false, label %._crit_edge113.preheader, label %min.iters.checked133

min.iters.checked133:                             ; preds = %.preheader8.us
  br i1 false, label %._crit_edge113.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked133
  %bound0 = icmp ult double* %scevgep, %scevgep141
  %bound1 = icmp ugt double* %scevgep139, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge113.preheader, label %vector.body129.preheader

vector.body129.preheader:                         ; preds = %vector.memcheck
  br i1 false, label %vector.body129.prol.preheader, label %vector.body129.prol.loopexit.unr-lcssa

vector.body129.prol.preheader:                    ; preds = %vector.body129.preheader
  br label %vector.body129.prol

vector.body129.prol:                              ; preds = %vector.body129.prol.preheader
  %wide.load152.prol = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !4
  %wide.load153.prol = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !4
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 0
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load154.prol = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !7, !noalias !4
  %44 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load155.prol = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !7, !noalias !4
  %46 = fsub <2 x double> %wide.load154.prol, %wide.load152.prol
  %47 = fsub <2 x double> %wide.load155.prol, %wide.load153.prol
  store <2 x double> %46, <2 x double>* %43, align 8, !alias.scope !7, !noalias !4
  store <2 x double> %47, <2 x double>* %45, align 8, !alias.scope !7, !noalias !4
  br label %vector.body129.prol.loopexit.unr-lcssa

vector.body129.prol.loopexit.unr-lcssa:           ; preds = %vector.body129.preheader, %vector.body129.prol
  %index144.unr.ph = phi i64 [ 4, %vector.body129.prol ], [ 0, %vector.body129.preheader ]
  br label %vector.body129.prol.loopexit

vector.body129.prol.loopexit:                     ; preds = %vector.body129.prol.loopexit.unr-lcssa
  br i1 false, label %middle.block130, label %vector.body129.preheader.new

vector.body129.preheader.new:                     ; preds = %vector.body129.prol.loopexit
  br label %vector.body129

vector.body129:                                   ; preds = %vector.body129, %vector.body129.preheader.new
  %index144 = phi i64 [ %index144.unr.ph, %vector.body129.preheader.new ], [ %index.next145.1, %vector.body129 ]
  %48 = getelementptr inbounds double, double* %5, i64 %index144
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !4
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !4
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 %index144
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !7, !noalias !4
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !7, !noalias !4
  %56 = fsub <2 x double> %wide.load154, %wide.load152
  %57 = fsub <2 x double> %wide.load155, %wide.load153
  store <2 x double> %56, <2 x double>* %53, align 8, !alias.scope !7, !noalias !4
  store <2 x double> %57, <2 x double>* %55, align 8, !alias.scope !7, !noalias !4
  %index.next145 = add i64 %index144, 4
  %58 = getelementptr inbounds double, double* %5, i64 %index.next145
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load152.1 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !4
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load153.1 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !4
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 %index.next145
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load154.1 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !7, !noalias !4
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load155.1 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !7, !noalias !4
  %66 = fsub <2 x double> %wide.load154.1, %wide.load152.1
  %67 = fsub <2 x double> %wide.load155.1, %wide.load153.1
  store <2 x double> %66, <2 x double>* %63, align 8, !alias.scope !7, !noalias !4
  store <2 x double> %67, <2 x double>* %65, align 8, !alias.scope !7, !noalias !4
  %index.next145.1 = add i64 %index144, 8
  %68 = icmp eq i64 %index.next145.1, 1200
  br i1 %68, label %middle.block130.unr-lcssa, label %vector.body129, !llvm.loop !9

middle.block130.unr-lcssa:                        ; preds = %vector.body129
  br label %middle.block130

middle.block130:                                  ; preds = %vector.body129.prol.loopexit, %middle.block130.unr-lcssa
  br i1 true, label %._crit_edge38.us, label %._crit_edge113.preheader

._crit_edge113.preheader:                         ; preds = %middle.block130, %vector.memcheck, %min.iters.checked133, %.preheader8.us
  %indvars.iv78.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked133 ], [ 0, %.preheader8.us ], [ 1200, %middle.block130 ]
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.preheader, %._crit_edge113
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge113 ], [ %indvars.iv78.ph, %._crit_edge113.preheader ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv78
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv80, i64 %indvars.iv78
  %72 = load double, double* %71, align 8
  %73 = fsub double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %74 = icmp slt i64 %indvars.iv.next79, 1200
  br i1 %74, label %._crit_edge113, label %._crit_edge38.us.loopexit, !llvm.loop !10

._crit_edge38.us.loopexit:                        ; preds = %._crit_edge113
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %middle.block130
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond189 = icmp ne i64 %indvars.iv.next81, 1400
  br i1 %exitcond189, label %.preheader8.us, label %.preheader7.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split.preheader157, %.lr.ph53.split
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %.lr.ph53.split ], [ %indvars.iv88.ph, %.lr.ph53.split.preheader157 ]
  %sext = shl i64 %indvars.iv88, 32
  %75 = ashr exact i64 %sext, 32
  %76 = getelementptr inbounds double, double* %5, i64 %75
  store double 0.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds double, double* %5, i64 %indvars.iv88
  %78 = load double, double* %77, align 8
  %79 = fdiv double %78, %2
  store double %79, double* %77, align 8
  %indvars.iv.next89 = add nsw i64 %indvars.iv88, 1
  %80 = icmp slt i64 %indvars.iv.next89, 1200
  br i1 %80, label %.lr.ph53.split, label %.preheader9.loopexit165, !llvm.loop !11

.preheader7.loopexit:                             ; preds = %._crit_edge38.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9
  br i1 true, label %.preheader.lr.ph, label %._crit_edge19

.preheader.lr.ph:                                 ; preds = %.preheader7
  %81 = fadd double %2, -1.000000e+00
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %82 = fdiv double 0.000000e+00, %81
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %._crit_edge13.us-lcssa.us.us ], [ 0, %.preheader.us.preheader ]
  br i1 true, label %.lr.ph12.us, label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us:                     ; preds = %._crit_edge13.us-lcssa.us.us.loopexit, %.preheader.us
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond185 = icmp ne i64 %indvars.iv.next184, 1200
  br i1 %exitcond185, label %.preheader.us, label %._crit_edge19.loopexit

.lr.ph12.us:                                      ; preds = %.preheader.us
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv183
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.us
  %indvars.iv70 = phi i64 [ %indvars.iv183, %.lr.ph12.us ], [ %indvars.iv.next71, %._crit_edge.us.us ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv183, i64 %indvars.iv70
  store double 0.000000e+00, double* %84, align 8
  br i1 true, label %._crit_edge114.prol.loopexit.unr-lcssa, label %._crit_edge114.prol.preheader

._crit_edge114.prol.preheader:                    ; preds = %.lr.ph.us.us
  br label %._crit_edge114.prol

._crit_edge114.prol:                              ; preds = %._crit_edge114.prol.preheader
  %85 = load double, double* %83, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv70
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %88, 0.000000e+00
  store double %89, double* %84, align 8
  br label %._crit_edge114.prol.loopexit.unr-lcssa

._crit_edge114.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph.us.us, %._crit_edge114.prol
  %.unr.ph = phi double [ %89, %._crit_edge114.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge114.prol ], [ 0, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %89, %._crit_edge114.prol ], [ undef, %.lr.ph.us.us ]
  br label %._crit_edge114.prol.loopexit

._crit_edge114.prol.loopexit:                     ; preds = %._crit_edge114.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge114.prol.loopexit
  br label %._crit_edge114

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge114
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge114.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge114.prol.loopexit ], [ %104, %._crit_edge.us.us.unr-lcssa ]
  %90 = fdiv double %.lcssa, %81
  store double %90, double* %84, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv70, i64 %indvars.iv183
  store double %90, double* %91, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond = icmp eq i64 %indvars.iv.next71, 1200
  br i1 %exitcond, label %._crit_edge13.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

._crit_edge114:                                   ; preds = %._crit_edge114, %.lr.ph.us.us.new
  %92 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %104, %._crit_edge114 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next.1, %._crit_edge114 ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv183
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv70
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fadd double %97, %92
  store double %98, double* %84, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv183
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv70
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fadd double %103, %98
  store double %104, double* %84, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %105 = icmp slt i64 %indvars.iv.next.1, 1400
  br i1 %105, label %._crit_edge114, label %._crit_edge.us.us.unr-lcssa

.preheader:                                       ; preds = %._crit_edge13, %.preheader.preheader
  %indvars.iv186 = phi i64 [ %indvars.iv.next187, %._crit_edge13 ], [ 0, %.preheader.preheader ]
  br i1 true, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %.preheader
  %106 = sub nsw i64 1200, %indvars.iv186
  %xtraiter = and i64 %106, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph12
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv186
  store double %82, double* %107, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv186
  store double %82, double* %108, align 8
  %indvars.iv.next75.prol = add nuw nsw i64 %indvars.iv186, 1
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph12, %.prol.preheader
  %indvars.iv74.unr.ph = phi i64 [ %indvars.iv.next75.prol, %.prol.preheader ], [ %indvars.iv186, %.lr.ph12 ]
  %109 = icmp eq i64 1199, %indvars.iv186
  br i1 %109, label %._crit_edge13, label %.lr.ph12.new.preheader

.lr.ph12.new.preheader:                           ; preds = %.prol.loopexit.unr-lcssa
  %110 = sub nsw i64 1198, %indvars.iv74.unr.ph
  %111 = lshr i64 %110, 1
  %112 = and i64 %111, 1
  %lcmp.mod170 = icmp eq i64 %112, 0
  br i1 %lcmp.mod170, label %.lr.ph12.new.prol.preheader, label %.lr.ph12.new.prol.loopexit.unr-lcssa

.lr.ph12.new.prol.preheader:                      ; preds = %.lr.ph12.new.preheader
  br label %.lr.ph12.new.prol

.lr.ph12.new.prol:                                ; preds = %.lr.ph12.new.prol.preheader
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv74.unr.ph
  store double %82, double* %113, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74.unr.ph, i64 %indvars.iv186
  store double %82, double* %114, align 8
  %indvars.iv.next75.prol171 = add nsw i64 %indvars.iv74.unr.ph, 1
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv.next75.prol171
  store double %82, double* %115, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next75.prol171, i64 %indvars.iv186
  store double %82, double* %116, align 8
  %indvars.iv.next75.1.prol = add nsw i64 %indvars.iv74.unr.ph, 2
  br label %.lr.ph12.new.prol.loopexit.unr-lcssa

.lr.ph12.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph12.new.preheader, %.lr.ph12.new.prol
  %indvars.iv74.unr.ph172 = phi i64 [ %indvars.iv.next75.1.prol, %.lr.ph12.new.prol ], [ %indvars.iv74.unr.ph, %.lr.ph12.new.preheader ]
  br label %.lr.ph12.new.prol.loopexit

.lr.ph12.new.prol.loopexit:                       ; preds = %.lr.ph12.new.prol.loopexit.unr-lcssa
  %117 = icmp eq i64 %111, 0
  br i1 %117, label %._crit_edge13.loopexit, label %.lr.ph12.new.preheader.new

.lr.ph12.new.preheader.new:                       ; preds = %.lr.ph12.new.prol.loopexit
  br label %.lr.ph12.new

.lr.ph12.new:                                     ; preds = %.lr.ph12.new, %.lr.ph12.new.preheader.new
  %indvars.iv74 = phi i64 [ %indvars.iv74.unr.ph172, %.lr.ph12.new.preheader.new ], [ %indvars.iv.next75.1.1, %.lr.ph12.new ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv74
  store double %82, double* %118, align 8
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv186
  store double %82, double* %119, align 8
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, 1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv.next75
  store double %82, double* %120, align 8
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next75, i64 %indvars.iv186
  store double %82, double* %121, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv.next75.1
  store double %82, double* %122, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next75.1, i64 %indvars.iv186
  store double %82, double* %123, align 8
  %indvars.iv.next75.1173 = add nsw i64 %indvars.iv74, 3
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv186, i64 %indvars.iv.next75.1173
  store double %82, double* %124, align 8
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next75.1173, i64 %indvars.iv186
  store double %82, double* %125, align 8
  %indvars.iv.next75.1.1 = add nsw i64 %indvars.iv74, 4
  %exitcond98.1.1 = icmp eq i64 %indvars.iv.next75.1.1, 1200
  br i1 %exitcond98.1.1, label %._crit_edge13.loopexit.unr-lcssa, label %.lr.ph12.new

._crit_edge13.loopexit.unr-lcssa:                 ; preds = %.lr.ph12.new
  br label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.new.prol.loopexit, %._crit_edge13.loopexit.unr-lcssa
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.prol.loopexit.unr-lcssa, %.preheader
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %exitcond188 = icmp ne i64 %indvars.iv.next187, 1200
  br i1 %exitcond188, label %.preheader, label %._crit_edge19.loopexit164

._crit_edge19.loopexit:                           ; preds = %._crit_edge13.us-lcssa.us.us
  br label %._crit_edge19

._crit_edge19.loopexit164:                        ; preds = %._crit_edge13
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit164, %._crit_edge19.loopexit, %.preheader7, %.preheader8.lr.ph
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv11, 1200
  %8 = trunc i64 %7 to i32
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = add nsw i32 %8, %9
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge15
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge15, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond16 = icmp ne i64 %indvars.iv.next12, 1200
  br i1 %exitcond16, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !2, !3}
!11 = distinct !{!11, !12, !2, !3}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
