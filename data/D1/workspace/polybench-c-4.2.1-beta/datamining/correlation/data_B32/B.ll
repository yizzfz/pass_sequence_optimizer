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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %22 ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = fadd <2 x double> %8, %19
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond10, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph126, label %._crit_edge89

.lr.ph126:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph126.split.us.preheader, label %.lr.ph126.split.preheader

.lr.ph126.split.preheader:                        ; preds = %.lr.ph126
  %10 = zext i32 %0 to i64
  %11 = add nsw i64 %10, -1
  %xtraiter199 = and i64 %10, 3
  %lcmp.mod200 = icmp eq i64 %xtraiter199, 0
  br i1 %lcmp.mod200, label %.lr.ph126.split.prol.loopexit, label %.lr.ph126.split.prol.preheader

.lr.ph126.split.prol.preheader:                   ; preds = %.lr.ph126.split.preheader
  %12 = fdiv double 0.000000e+00, %2
  br label %.lr.ph126.split.prol

.lr.ph126.split.prol:                             ; preds = %.lr.ph126.split.prol.preheader, %.lr.ph126.split.prol
  %indvars.iv182.prol = phi i64 [ %indvars.iv.next183.prol, %.lr.ph126.split.prol ], [ 0, %.lr.ph126.split.prol.preheader ]
  %prol.iter201 = phi i64 [ %prol.iter201.sub, %.lr.ph126.split.prol ], [ %xtraiter199, %.lr.ph126.split.prol.preheader ]
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv182.prol
  store double %12, double* %13, align 8
  %indvars.iv.next183.prol = add nuw nsw i64 %indvars.iv182.prol, 1
  %prol.iter201.sub = add i64 %prol.iter201, -1
  %prol.iter201.cmp = icmp eq i64 %prol.iter201.sub, 0
  br i1 %prol.iter201.cmp, label %.lr.ph126.split.prol.loopexit.loopexit, label %.lr.ph126.split.prol, !llvm.loop !1

.lr.ph126.split.prol.loopexit.loopexit:           ; preds = %.lr.ph126.split.prol
  br label %.lr.ph126.split.prol.loopexit

.lr.ph126.split.prol.loopexit:                    ; preds = %.lr.ph126.split.prol.loopexit.loopexit, %.lr.ph126.split.preheader
  %indvars.iv182.unr = phi i64 [ 0, %.lr.ph126.split.preheader ], [ %indvars.iv.next183.prol, %.lr.ph126.split.prol.loopexit.loopexit ]
  %14 = icmp ult i64 %11, 3
  br i1 %14, label %.lr.ph119, label %.lr.ph126.split.preheader206

.lr.ph126.split.preheader206:                     ; preds = %.lr.ph126.split.prol.loopexit
  %15 = fdiv double 0.000000e+00, %2
  %16 = add nsw i64 %10, -4
  %17 = sub i64 %16, %indvars.iv182.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 4
  br i1 %min.iters.check, label %.lr.ph126.split.preheader263, label %min.iters.checked

.lr.ph126.split.preheader263:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph126.split.preheader206
  %indvars.iv182.ph = phi i64 [ %indvars.iv182.unr, %min.iters.checked ], [ %indvars.iv182.unr, %.lr.ph126.split.preheader206 ], [ %ind.end, %middle.block ]
  br label %.lr.ph126.split

min.iters.checked:                                ; preds = %.lr.ph126.split.preheader206
  %n.mod.vf = and i64 %19, 3
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = shl nuw i64 %18, 2
  %21 = add i64 %indvars.iv182.unr, %20
  %22 = add i64 %21, 4
  %23 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero, label %.lr.ph126.split.preheader263, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert255 = insertelement <2 x double> undef, double %15, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert255, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %24 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv182.unr, %24
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
  br i1 %cmp.n, label %.lr.ph119, label %.lr.ph126.split.preheader263

.lr.ph126.split.us.preheader:                     ; preds = %.lr.ph126
  %34 = zext i32 %1 to i64
  %35 = add nsw i64 %34, -1
  %xtraiter196 = and i64 %34, 3
  %wide.trip.count180 = zext i32 %0 to i64
  %36 = icmp eq i64 %xtraiter196, 0
  %37 = icmp ult i64 %35, 3
  %.pre = ptrtoint double* %5 to i64
  %sunkaddr211 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph126.split.us

.lr.ph126.split.us:                               ; preds = %._crit_edge123.us, %.lr.ph126.split.us.preheader
  %indvars.iv178 = phi i64 [ 0, %.lr.ph126.split.us.preheader ], [ %indvars.iv.next179, %._crit_edge123.us ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv178
  store double 0.000000e+00, double* %38, align 8
  br i1 %36, label %.prol.loopexit195, label %.prol.preheader194.preheader

.prol.preheader194.preheader:                     ; preds = %.lr.ph126.split.us
  %sunkaddr208 = shl i64 %indvars.iv178, 3
  %sunkaddr209 = add i64 %sunkaddr, %sunkaddr208
  %sunkaddr210 = inttoptr i64 %sunkaddr209 to double*
  br label %.prol.preheader194

.prol.preheader194:                               ; preds = %.prol.preheader194.preheader, %.prol.preheader194
  %indvars.iv174.prol = phi i64 [ %indvars.iv.next175.prol, %.prol.preheader194 ], [ 0, %.prol.preheader194.preheader ]
  %prol.iter198 = phi i64 [ %prol.iter198.sub, %.prol.preheader194 ], [ %xtraiter196, %.prol.preheader194.preheader ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv174.prol, i64 %indvars.iv178
  %40 = load double, double* %39, align 8
  %41 = load double, double* %sunkaddr210, align 8
  %42 = fadd double %40, %41
  store double %42, double* %sunkaddr210, align 8
  %indvars.iv.next175.prol = add nuw nsw i64 %indvars.iv174.prol, 1
  %prol.iter198.sub = add i64 %prol.iter198, -1
  %prol.iter198.cmp = icmp eq i64 %prol.iter198.sub, 0
  br i1 %prol.iter198.cmp, label %.prol.loopexit195.loopexit, label %.prol.preheader194, !llvm.loop !6

.prol.loopexit195.loopexit:                       ; preds = %.prol.preheader194
  br label %.prol.loopexit195

.prol.loopexit195:                                ; preds = %.prol.loopexit195.loopexit, %.lr.ph126.split.us
  %indvars.iv174.unr = phi i64 [ 0, %.lr.ph126.split.us ], [ %indvars.iv.next175.prol, %.prol.loopexit195.loopexit ]
  br i1 %37, label %.prol.loopexit195.._crit_edge123.us_crit_edge, label %.lr.ph126.split.us.new.preheader

.lr.ph126.split.us.new.preheader:                 ; preds = %.prol.loopexit195
  %sunkaddr212 = shl i64 %indvars.iv178, 3
  %sunkaddr213 = add i64 %sunkaddr211, %sunkaddr212
  %sunkaddr214 = inttoptr i64 %sunkaddr213 to double*
  br label %.lr.ph126.split.us.new

.prol.loopexit195.._crit_edge123.us_crit_edge:    ; preds = %.prol.loopexit195
  %.pre243 = shl i64 %indvars.iv178, 3
  %.pre244 = add i64 %.pre, %.pre243
  %.pre245 = inttoptr i64 %.pre244 to double*
  %.pre258 = load double, double* %.pre245, align 8
  br label %._crit_edge123.us

.lr.ph126.split.us.new:                           ; preds = %.lr.ph126.split.us.new.preheader, %.lr.ph126.split.us.new
  %indvars.iv174 = phi i64 [ %indvars.iv.next175.3, %.lr.ph126.split.us.new ], [ %indvars.iv174.unr, %.lr.ph126.split.us.new.preheader ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv178
  %44 = load double, double* %43, align 8
  %45 = load double, double* %sunkaddr214, align 8
  %46 = fadd double %44, %45
  store double %46, double* %sunkaddr214, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv178
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %sunkaddr214, align 8
  %indvars.iv.next175.1 = add nsw i64 %indvars.iv174, 2
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175.1, i64 %indvars.iv178
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %sunkaddr214, align 8
  %indvars.iv.next175.2 = add nsw i64 %indvars.iv174, 3
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175.2, i64 %indvars.iv178
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %sunkaddr214, align 8
  %indvars.iv.next175.3 = add nsw i64 %indvars.iv174, 4
  %exitcond177.3 = icmp eq i64 %indvars.iv.next175.3, %34
  br i1 %exitcond177.3, label %._crit_edge123.us.loopexit, label %.lr.ph126.split.us.new

._crit_edge123.us.loopexit:                       ; preds = %.lr.ph126.split.us.new
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %.prol.loopexit195.._crit_edge123.us_crit_edge
  %56 = phi double [ %.pre258, %.prol.loopexit195.._crit_edge123.us_crit_edge ], [ %55, %._crit_edge123.us.loopexit ]
  %sunkaddr218.pre-phi = phi double* [ %.pre245, %.prol.loopexit195.._crit_edge123.us_crit_edge ], [ %sunkaddr214, %._crit_edge123.us.loopexit ]
  %57 = fdiv double %56, %2
  store double %57, double* %sunkaddr218.pre-phi, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next179, %wide.trip.count180
  br i1 %exitcond181, label %.lr.ph119.loopexit, label %.lr.ph126.split.us

.lr.ph119.loopexit:                               ; preds = %._crit_edge123.us
  br label %.lr.ph119

.lr.ph119.loopexit264:                            ; preds = %.lr.ph126.split
  br label %.lr.ph119

.lr.ph119:                                        ; preds = %.lr.ph119.loopexit264, %.lr.ph119.loopexit, %.lr.ph126.split.prol.loopexit, %middle.block
  br i1 %9, label %.lr.ph119.split.us.preheader, label %.lr.ph119.split.preheader

.lr.ph119.split.us.preheader:                     ; preds = %.lr.ph119
  %58 = and i32 %1, 1
  %wide.trip.count168 = zext i32 %0 to i64
  %wide.trip.count164.1 = zext i32 %1 to i64
  %59 = icmp eq i32 %58, 0
  %60 = icmp eq i32 %1, 1
  %.pre246 = ptrtoint double* %6 to i64
  %sunkaddr227 = ptrtoint double* %5 to i64
  %sunkaddr231 = ptrtoint double* %6 to i64
  %sunkaddr219 = ptrtoint double* %5 to i64
  %sunkaddr223 = ptrtoint double* %6 to i64
  br label %.lr.ph119.split.us

.lr.ph119.split.preheader:                        ; preds = %.lr.ph119
  %61 = and i32 %0, 1
  %lcmp.mod193 = icmp eq i32 %61, 0
  br i1 %lcmp.mod193, label %.lr.ph119.split.prol.loopexit, label %.lr.ph119.split.prol

.lr.ph119.split.prol:                             ; preds = %.lr.ph119.split.preheader
  %62 = fdiv double 0.000000e+00, %2
  store double %62, double* %6, align 8
  %63 = tail call double @sqrt(double %62) #4
  %64 = fcmp ugt double %63, 1.000000e-01
  %65 = select i1 %64, double %63, double 1.000000e+00
  store double %65, double* %6, align 8
  br label %.lr.ph119.split.prol.loopexit

.lr.ph119.split.prol.loopexit:                    ; preds = %.lr.ph119.split.preheader, %.lr.ph119.split.prol
  %indvars.iv170.unr = phi i64 [ 0, %.lr.ph119.split.preheader ], [ 1, %.lr.ph119.split.prol ]
  %66 = icmp eq i32 %0, 1
  br i1 %66, label %._crit_edge89, label %.lr.ph119.split.preheader204

.lr.ph119.split.preheader204:                     ; preds = %.lr.ph119.split.prol.loopexit
  %67 = fdiv double 0.000000e+00, %2
  %wide.trip.count172.1 = zext i32 %0 to i64
  br label %.lr.ph119.split

.lr.ph119.split.us:                               ; preds = %.lr.ph119.split.us.preheader, %._crit_edge117.us
  %indvars.iv166 = phi i64 [ %indvars.iv.next167, %._crit_edge117.us ], [ 0, %.lr.ph119.split.us.preheader ]
  %68 = getelementptr inbounds double, double* %6, i64 %indvars.iv166
  store double 0.000000e+00, double* %68, align 8
  br i1 %59, label %.prol.loopexit189, label %.prol.preheader188

.prol.preheader188:                               ; preds = %.lr.ph119.split.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv166
  %70 = load double, double* %69, align 8
  %sunkaddr220 = shl i64 %indvars.iv166, 3
  %sunkaddr221 = add i64 %sunkaddr219, %sunkaddr220
  %sunkaddr222 = inttoptr i64 %sunkaddr221 to double*
  %71 = load double, double* %sunkaddr222, align 8
  %72 = fsub double %70, %71
  %73 = fmul double %72, %72
  %sunkaddr225 = add i64 %sunkaddr223, %sunkaddr220
  %sunkaddr226 = inttoptr i64 %sunkaddr225 to double*
  %74 = load double, double* %sunkaddr226, align 8
  %75 = fadd double %74, %73
  store double %75, double* %sunkaddr226, align 8
  br label %.prol.loopexit189

.prol.loopexit189:                                ; preds = %.prol.preheader188, %.lr.ph119.split.us
  %indvars.iv162.unr.ph = phi i64 [ 1, %.prol.preheader188 ], [ 0, %.lr.ph119.split.us ]
  br i1 %60, label %.prol.loopexit189.._crit_edge117.us_crit_edge, label %.lr.ph119.split.us.new.preheader

.lr.ph119.split.us.new.preheader:                 ; preds = %.prol.loopexit189
  %sunkaddr228 = shl i64 %indvars.iv166, 3
  %sunkaddr229 = add i64 %sunkaddr227, %sunkaddr228
  %sunkaddr230 = inttoptr i64 %sunkaddr229 to double*
  %sunkaddr233 = add i64 %sunkaddr231, %sunkaddr228
  %sunkaddr234 = inttoptr i64 %sunkaddr233 to double*
  br label %.lr.ph119.split.us.new

.prol.loopexit189.._crit_edge117.us_crit_edge:    ; preds = %.prol.loopexit189
  %.pre247 = shl i64 %indvars.iv166, 3
  %.pre248 = add i64 %.pre246, %.pre247
  %.pre249 = inttoptr i64 %.pre248 to double*
  %.pre259 = load double, double* %.pre249, align 8
  br label %._crit_edge117.us

.lr.ph119.split.us.new:                           ; preds = %.lr.ph119.split.us.new.preheader, %.lr.ph119.split.us.new
  %indvars.iv162 = phi i64 [ %indvars.iv.next163.1, %.lr.ph119.split.us.new ], [ %indvars.iv162.unr.ph, %.lr.ph119.split.us.new.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv162, i64 %indvars.iv166
  %77 = load double, double* %76, align 8
  %78 = load double, double* %sunkaddr230, align 8
  %79 = fsub double %77, %78
  %80 = fmul double %79, %79
  %81 = load double, double* %sunkaddr234, align 8
  %82 = fadd double %81, %80
  store double %82, double* %sunkaddr234, align 8
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next163, i64 %indvars.iv166
  %84 = load double, double* %83, align 8
  %85 = load double, double* %sunkaddr230, align 8
  %86 = fsub double %84, %85
  %87 = fmul double %86, %86
  %88 = fadd double %82, %87
  store double %88, double* %sunkaddr234, align 8
  %indvars.iv.next163.1 = add nsw i64 %indvars.iv162, 2
  %exitcond165.1 = icmp eq i64 %indvars.iv.next163.1, %wide.trip.count164.1
  br i1 %exitcond165.1, label %._crit_edge117.us.loopexit, label %.lr.ph119.split.us.new

._crit_edge117.us.loopexit:                       ; preds = %.lr.ph119.split.us.new
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %.prol.loopexit189.._crit_edge117.us_crit_edge
  %89 = phi double [ %.pre259, %.prol.loopexit189.._crit_edge117.us_crit_edge ], [ %88, %._crit_edge117.us.loopexit ]
  %sunkaddr238.pre-phi = phi double* [ %.pre249, %.prol.loopexit189.._crit_edge117.us_crit_edge ], [ %sunkaddr234, %._crit_edge117.us.loopexit ]
  %90 = fdiv double %89, %2
  store double %90, double* %sunkaddr238.pre-phi, align 8
  %91 = tail call double @sqrt(double %90) #4
  %92 = fcmp ugt double %91, 1.000000e-01
  %93 = select i1 %92, double %91, double 1.000000e+00
  store double %93, double* %sunkaddr238.pre-phi, align 8
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next167, %wide.trip.count168
  br i1 %exitcond169, label %._crit_edge89.loopexit, label %.lr.ph119.split.us

.lr.ph126.split:                                  ; preds = %.lr.ph126.split.preheader263, %.lr.ph126.split
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.3, %.lr.ph126.split ], [ %indvars.iv182.ph, %.lr.ph126.split.preheader263 ]
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv182
  store double %15, double* %94, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %95 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next183
  store double %15, double* %95, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %96 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next183.1
  store double %15, double* %96, align 8
  %indvars.iv.next183.2 = add nsw i64 %indvars.iv182, 3
  %97 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next183.2
  store double %15, double* %97, align 8
  %indvars.iv.next183.3 = add nsw i64 %indvars.iv182, 4
  %exitcond185.3 = icmp eq i64 %indvars.iv.next183.3, %10
  br i1 %exitcond185.3, label %.lr.ph119.loopexit264, label %.lr.ph126.split, !llvm.loop !7

._crit_edge89.loopexit:                           ; preds = %._crit_edge117.us
  br label %._crit_edge89

._crit_edge89.loopexit262:                        ; preds = %.lr.ph119.split
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit262, %._crit_edge89.loopexit, %7, %.lr.ph119.split.prol.loopexit
  %98 = icmp sgt i32 %1, 0
  br i1 %98, label %._crit_edge90.lr.ph, label %._crit_edge91

._crit_edge90.lr.ph:                              ; preds = %._crit_edge89
  br i1 %8, label %._crit_edge90.us.preheader, label %._crit_edge91.thread

._crit_edge90.us.preheader:                       ; preds = %._crit_edge90.lr.ph
  %wide.trip.count155 = zext i32 %0 to i64
  %wide.trip.count159 = zext i32 %1 to i64
  br label %._crit_edge90.us

._crit_edge91.thread:                             ; preds = %._crit_edge90.lr.ph
  %99 = add nsw i32 %0, -1
  br label %._crit_edge102

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.preheader, %._crit_edge112.us
  %indvars.iv157 = phi i64 [ %indvars.iv.next158, %._crit_edge112.us ], [ 0, %._crit_edge90.us.preheader ]
  br label %100

; <label>:100:                                    ; preds = %100, %._crit_edge90.us
  %indvars.iv153 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next154, %100 ]
  %101 = getelementptr inbounds double, double* %5, i64 %indvars.iv153
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv157, i64 %indvars.iv153
  %104 = load double, double* %103, align 8
  %105 = fsub double %104, %102
  store double %105, double* %103, align 8
  %106 = tail call double @sqrt(double %2) #4
  %107 = getelementptr inbounds double, double* %6, i64 %indvars.iv153
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = load double, double* %103, align 8
  %111 = fdiv double %110, %109
  store double %111, double* %103, align 8
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %exitcond156 = icmp eq i64 %indvars.iv.next154, %wide.trip.count155
  br i1 %exitcond156, label %._crit_edge112.us, label %100

._crit_edge112.us:                                ; preds = %100
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond160 = icmp eq i64 %indvars.iv.next158, %wide.trip.count159
  br i1 %exitcond160, label %._crit_edge91.loopexit, label %._crit_edge90.us

.lr.ph119.split:                                  ; preds = %.lr.ph119.split.preheader204, %.lr.ph119.split
  %indvars.iv170 = phi i64 [ %indvars.iv.next171.1, %.lr.ph119.split ], [ %indvars.iv170.unr, %.lr.ph119.split.preheader204 ]
  %112 = getelementptr inbounds double, double* %6, i64 %indvars.iv170
  store double %67, double* %112, align 8
  %113 = tail call double @sqrt(double %67) #4
  %114 = fcmp ugt double %113, 1.000000e-01
  %115 = select i1 %114, double %113, double 1.000000e+00
  store double %115, double* %112, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %116 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next171
  store double %67, double* %116, align 8
  %117 = tail call double @sqrt(double %67) #4
  %118 = fcmp ugt double %117, 1.000000e-01
  %119 = select i1 %118, double %117, double 1.000000e+00
  store double %119, double* %116, align 8
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  %exitcond173.1 = icmp eq i64 %indvars.iv.next171.1, %wide.trip.count172.1
  br i1 %exitcond173.1, label %._crit_edge89.loopexit262, label %.lr.ph119.split

._crit_edge91.loopexit:                           ; preds = %._crit_edge112.us
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %._crit_edge89
  %120 = add nsw i32 %0, -1
  %121 = icmp sgt i32 %0, 1
  br i1 %121, label %.lr.ph101, label %._crit_edge102

.lr.ph101:                                        ; preds = %._crit_edge91
  %122 = sext i32 %0 to i64
  br i1 %98, label %.lr.ph101.split.us.preheader, label %.lr.ph101.split.preheader

.lr.ph101.split.preheader:                        ; preds = %.lr.ph101
  %123 = zext i32 %0 to i64
  %124 = add nuw nsw i64 %123, 3
  %125 = add nsw i64 %123, -2
  %wide.trip.count151 = zext i32 %120 to i64
  br label %.lr.ph101.split

.lr.ph101.split.us.preheader:                     ; preds = %.lr.ph101
  %wide.trip.count140 = zext i32 %120 to i64
  %126 = and i32 %1, 1
  %wide.trip.count135 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %127 = icmp eq i32 %126, 0
  %128 = icmp eq i32 %1, 1
  %sunkaddr239 = ptrtoint [1200 x double]* %3 to i64
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %._crit_edge99.us-lcssa.us.us, %.lr.ph101.split.us.preheader
  %indvars.iv138 = phi i64 [ 0, %.lr.ph101.split.us.preheader ], [ %indvars.iv.next139, %._crit_edge99.us-lcssa.us.us ]
  %indvars.iv131 = phi i64 [ 1, %.lr.ph101.split.us.preheader ], [ %indvars.iv.next132, %._crit_edge99.us-lcssa.us.us ]
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %129, align 8
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %130 = icmp slt i64 %indvars.iv.next139, %122
  br i1 %130, label %.lr.ph.us.us.preheader, label %._crit_edge99.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph101.split.us
  %sunkaddr240 = shl i64 %indvars.iv138, 3
  %sunkaddr241 = add i64 %sunkaddr239, %sunkaddr240
  %sunkaddr242 = inttoptr i64 %sunkaddr241 to double*
  br label %.lr.ph.us.us

._crit_edge99.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge94.us.us
  br label %._crit_edge99.us-lcssa.us.us

._crit_edge99.us-lcssa.us.us:                     ; preds = %._crit_edge99.us-lcssa.us.us.loopexit, %.lr.ph101.split.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next139, %wide.trip.count140
  br i1 %exitcond141, label %._crit_edge102.loopexit, label %.lr.ph101.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge94.us.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge94.us.us ], [ %indvars.iv131, %.lr.ph.us.us.preheader ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv138, i64 %indvars.iv133
  store double 0.000000e+00, double* %131, align 8
  br i1 %127, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %132 = load double, double* %sunkaddr242, align 8
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv133
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fadd double %135, 0.000000e+00
  store double %136, double* %131, align 8
  %137 = bitcast double %136 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %138 = phi i64 [ %137, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %139 = phi double [ %136, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %128, label %._crit_edge94.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge94.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %140 = bitcast double %156 to i64
  br label %._crit_edge94.us.us

._crit_edge94.us.us:                              ; preds = %._crit_edge94.us.us.loopexit, %.prol.loopexit
  %141 = phi i64 [ %138, %.prol.loopexit ], [ %140, %._crit_edge94.us.us.loopexit ]
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv133, i64 %indvars.iv138
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  br i1 %exitcond136, label %._crit_edge99.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %144 = phi double [ %156, %.lr.ph.us.us.new ], [ %139, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv138
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv133
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fadd double %144, %149
  store double %150, double* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv138
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv133
  %154 = load double, double* %153, align 8
  %155 = fmul double %152, %154
  %156 = fadd double %150, %155
  store double %156, double* %131, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge94.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph101.split:                                  ; preds = %._crit_edge99, %.lr.ph101.split.preheader
  %indvars.iv149 = phi i64 [ 0, %.lr.ph101.split.preheader ], [ %indvars.iv.next150, %._crit_edge99 ]
  %indvars.iv142 = phi i64 [ 1, %.lr.ph101.split.preheader ], [ %indvars.iv.next143, %._crit_edge99 ]
  %157 = sub i64 %125, %indvars.iv149
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv149
  store double 1.000000e+00, double* %158, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %159 = icmp slt i64 %indvars.iv.next150, %122
  br i1 %159, label %.lr.ph98.split.preheader, label %._crit_edge99

.lr.ph98.split.preheader:                         ; preds = %.lr.ph101.split
  %160 = sub i64 %124, %indvars.iv149
  %xtraiter186 = and i64 %160, 3
  %lcmp.mod187 = icmp eq i64 %xtraiter186, 0
  br i1 %lcmp.mod187, label %.lr.ph98.split.prol.loopexit, label %.lr.ph98.split.prol.preheader

.lr.ph98.split.prol.preheader:                    ; preds = %.lr.ph98.split.preheader
  br label %.lr.ph98.split.prol

.lr.ph98.split.prol:                              ; preds = %.lr.ph98.split.prol.preheader, %.lr.ph98.split.prol
  %indvars.iv144.prol = phi i64 [ %indvars.iv.next145.prol, %.lr.ph98.split.prol ], [ %indvars.iv142, %.lr.ph98.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph98.split.prol ], [ %xtraiter186, %.lr.ph98.split.prol.preheader ]
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv144.prol
  store double 0.000000e+00, double* %161, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144.prol, i64 %indvars.iv149
  %163 = bitcast double* %162 to i64*
  store i64 0, i64* %163, align 8
  %indvars.iv.next145.prol = add nuw nsw i64 %indvars.iv144.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph98.split.prol.loopexit.loopexit, label %.lr.ph98.split.prol, !llvm.loop !9

.lr.ph98.split.prol.loopexit.loopexit:            ; preds = %.lr.ph98.split.prol
  br label %.lr.ph98.split.prol.loopexit

.lr.ph98.split.prol.loopexit:                     ; preds = %.lr.ph98.split.prol.loopexit.loopexit, %.lr.ph98.split.preheader
  %indvars.iv144.unr = phi i64 [ %indvars.iv142, %.lr.ph98.split.preheader ], [ %indvars.iv.next145.prol, %.lr.ph98.split.prol.loopexit.loopexit ]
  %164 = icmp ult i64 %157, 3
  br i1 %164, label %._crit_edge99, label %.lr.ph98.split.preheader260

.lr.ph98.split.preheader260:                      ; preds = %.lr.ph98.split.prol.loopexit
  br label %.lr.ph98.split

.lr.ph98.split:                                   ; preds = %.lr.ph98.split.preheader260, %.lr.ph98.split
  %indvars.iv144 = phi i64 [ %indvars.iv.next145.3, %.lr.ph98.split ], [ %indvars.iv144.unr, %.lr.ph98.split.preheader260 ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv144
  store double 0.000000e+00, double* %165, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv144, i64 %indvars.iv149
  %167 = bitcast double* %166 to i64*
  store i64 0, i64* %167, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv.next145
  store double 0.000000e+00, double* %168, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145, i64 %indvars.iv149
  %170 = bitcast double* %169 to i64*
  store i64 0, i64* %170, align 8
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv.next145.1
  store double 0.000000e+00, double* %171, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.1, i64 %indvars.iv149
  %173 = bitcast double* %172 to i64*
  store i64 0, i64* %173, align 8
  %indvars.iv.next145.2 = add nsw i64 %indvars.iv144, 3
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv.next145.2
  store double 0.000000e+00, double* %174, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next145.2, i64 %indvars.iv149
  %176 = bitcast double* %175 to i64*
  store i64 0, i64* %176, align 8
  %indvars.iv.next145.3 = add nsw i64 %indvars.iv144, 4
  %exitcond147.3 = icmp eq i64 %indvars.iv.next145.3, %123
  br i1 %exitcond147.3, label %._crit_edge99.loopexit, label %.lr.ph98.split

._crit_edge99.loopexit:                           ; preds = %.lr.ph98.split
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.loopexit, %.lr.ph98.split.prol.loopexit, %.lr.ph101.split
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next150, %wide.trip.count151
  br i1 %exitcond152, label %._crit_edge102.loopexit261, label %.lr.ph101.split

._crit_edge102.loopexit:                          ; preds = %._crit_edge99.us-lcssa.us.us
  br label %._crit_edge102

._crit_edge102.loopexit261:                       ; preds = %._crit_edge99
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit261, %._crit_edge102.loopexit, %._crit_edge91.thread, %._crit_edge91
  %177 = phi i32 [ %99, %._crit_edge91.thread ], [ %120, %._crit_edge91 ], [ %120, %._crit_edge102.loopexit ], [ %120, %._crit_edge102.loopexit261 ]
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %178, i64 %178
  store double 1.000000e+00, double* %179, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge13

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %11 = add nsw i64 %indvars.iv, %9
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
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge11.us, label %10

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %._crit_edge.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
