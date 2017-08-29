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
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19, %4
  %indvars.iv7 = phi i64 [ 0, %4 ], [ %indvars.iv.next8, %19 ]
  %5 = trunc i64 %indvars.iv7 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = fadd double %6, %10
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv7
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.200000e+03
  %17 = fadd double %6, %16
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph119, label %._crit_edge.._crit_edge86_crit_edge

.lr.ph119:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph119.split.us.preheader, label %.lr.ph119.split.preheader

.lr.ph119.split.preheader:                        ; preds = %.lr.ph119
  %10 = add i32 %0, -1
  %xtraiter191 = and i32 %0, 3
  %lcmp.mod192 = icmp eq i32 %xtraiter191, 0
  br i1 %lcmp.mod192, label %.lr.ph119.split.prol.loopexit, label %.lr.ph119.split.prol.preheader

.lr.ph119.split.prol.preheader:                   ; preds = %.lr.ph119.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph119.split.prol

.lr.ph119.split.prol:                             ; preds = %.lr.ph119.split.prol.preheader, %.lr.ph119.split.prol
  %indvars.iv187.prol = phi i64 [ %indvars.iv.next188.prol, %.lr.ph119.split.prol ], [ 0, %.lr.ph119.split.prol.preheader ]
  %prol.iter193 = phi i32 [ %prol.iter193.sub, %.lr.ph119.split.prol ], [ %xtraiter191, %.lr.ph119.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv187.prol
  store double %11, double* %12, align 8
  %indvars.iv.next188.prol = add nuw nsw i64 %indvars.iv187.prol, 1
  %prol.iter193.sub = add i32 %prol.iter193, -1
  %prol.iter193.cmp = icmp eq i32 %prol.iter193.sub, 0
  br i1 %prol.iter193.cmp, label %.lr.ph119.split.prol.loopexit.loopexit, label %.lr.ph119.split.prol, !llvm.loop !1

.lr.ph119.split.prol.loopexit.loopexit:           ; preds = %.lr.ph119.split.prol
  br label %.lr.ph119.split.prol.loopexit

.lr.ph119.split.prol.loopexit:                    ; preds = %.lr.ph119.split.prol.loopexit.loopexit, %.lr.ph119.split.preheader
  %indvars.iv187.unr = phi i64 [ 0, %.lr.ph119.split.preheader ], [ %indvars.iv.next188.prol, %.lr.ph119.split.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %10, 3
  br i1 %13, label %.lr.ph114, label %.lr.ph119.split.preheader199

.lr.ph119.split.preheader199:                     ; preds = %.lr.ph119.split.prol.loopexit
  %14 = fdiv double 0.000000e+00, %2
  %wide.trip.count189.3 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count189.3, -4
  %16 = sub i64 %15, %indvars.iv187.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i64 %18, 4
  br i1 %min.iters.check, label %.lr.ph119.split.preheader218, label %min.iters.checked

.lr.ph119.split.preheader218:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph119.split.preheader199
  %indvars.iv187.ph = phi i64 [ %indvars.iv187.unr, %min.iters.checked ], [ %indvars.iv187.unr, %.lr.ph119.split.preheader199 ], [ %ind.end, %middle.block ]
  br label %.lr.ph119.split

min.iters.checked:                                ; preds = %.lr.ph119.split.preheader199
  %n.mod.vf = and i64 %18, 3
  %n.vec = sub nsw i64 %18, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = shl nuw i64 %17, 2
  %20 = add i64 %indvars.iv187.unr, %19
  %21 = add i64 %20, 4
  %22 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero, label %.lr.ph119.split.preheader218, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert206 = insertelement <2 x double> undef, double %14, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert206, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv187.unr, %23
  %24 = add nsw i64 %offset.idx, 3
  %25 = add i64 %offset.idx, 11
  %26 = getelementptr inbounds double, double* %5, i64 %24
  %27 = getelementptr inbounds double, double* %5, i64 %25
  %28 = getelementptr double, double* %26, i64 -3
  %29 = bitcast double* %28 to <8 x double>*
  %30 = getelementptr double, double* %27, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %29, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.._crit_edge_crit_edge, label %.lr.ph119.split.preheader218

.lr.ph119.split.us.preheader:                     ; preds = %.lr.ph119
  %33 = add i32 %1, -1
  %xtraiter180 = and i32 %1, 3
  %lcmp.mod181 = icmp eq i32 %xtraiter180, 0
  %34 = icmp ult i32 %33, 3
  %wide.trip.count185 = zext i32 %0 to i64
  %wide.trip.count176.3 = zext i32 %1 to i64
  br label %.lr.ph119.split.us

.lr.ph119.split.us:                               ; preds = %._crit_edge.us, %.lr.ph119.split.us.preheader
  %indvars.iv183 = phi i64 [ 0, %.lr.ph119.split.us.preheader ], [ %indvars.iv.next184, %._crit_edge.us ]
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv183
  store double 0.000000e+00, double* %35, align 8
  br i1 %lcmp.mod181, label %.prol.loopexit179, label %.prol.preheader178.preheader

.prol.preheader178.preheader:                     ; preds = %.lr.ph119.split.us
  br label %.prol.preheader178

.prol.preheader178:                               ; preds = %.prol.preheader178.preheader, %.prol.preheader178
  %36 = phi double [ %39, %.prol.preheader178 ], [ 0.000000e+00, %.prol.preheader178.preheader ]
  %indvars.iv174.prol = phi i64 [ %indvars.iv.next175.prol, %.prol.preheader178 ], [ 0, %.prol.preheader178.preheader ]
  %prol.iter182 = phi i32 [ %prol.iter182.sub, %.prol.preheader178 ], [ %xtraiter180, %.prol.preheader178.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv174.prol, i64 %indvars.iv183
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %36
  store double %39, double* %35, align 8
  %indvars.iv.next175.prol = add nuw nsw i64 %indvars.iv174.prol, 1
  %prol.iter182.sub = add i32 %prol.iter182, -1
  %prol.iter182.cmp = icmp eq i32 %prol.iter182.sub, 0
  br i1 %prol.iter182.cmp, label %.prol.loopexit179.loopexit, label %.prol.preheader178, !llvm.loop !6

.prol.loopexit179.loopexit:                       ; preds = %.prol.preheader178
  br label %.prol.loopexit179

.prol.loopexit179:                                ; preds = %.prol.loopexit179.loopexit, %.lr.ph119.split.us
  %40 = phi double [ 0.000000e+00, %.lr.ph119.split.us ], [ %39, %.prol.loopexit179.loopexit ]
  %indvars.iv174.unr = phi i64 [ 0, %.lr.ph119.split.us ], [ %indvars.iv.next175.prol, %.prol.loopexit179.loopexit ]
  br i1 %34, label %._crit_edge.us, label %.lr.ph119.split.us.new.preheader

.lr.ph119.split.us.new.preheader:                 ; preds = %.prol.loopexit179
  br label %.lr.ph119.split.us.new

.lr.ph119.split.us.new:                           ; preds = %.lr.ph119.split.us.new.preheader, %.lr.ph119.split.us.new
  %41 = phi double [ %53, %.lr.ph119.split.us.new ], [ %40, %.lr.ph119.split.us.new.preheader ]
  %indvars.iv174 = phi i64 [ %indvars.iv.next175.3, %.lr.ph119.split.us.new ], [ %indvars.iv174.unr, %.lr.ph119.split.us.new.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv174, i64 %indvars.iv183
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %35, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175, i64 %indvars.iv183
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %35, align 8
  %indvars.iv.next175.1 = add nsw i64 %indvars.iv174, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175.1, i64 %indvars.iv183
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %35, align 8
  %indvars.iv.next175.2 = add nsw i64 %indvars.iv174, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next175.2, i64 %indvars.iv183
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %35, align 8
  %indvars.iv.next175.3 = add nsw i64 %indvars.iv174, 4
  %exitcond177.3 = icmp eq i64 %indvars.iv.next175.3, %wide.trip.count176.3
  br i1 %exitcond177.3, label %._crit_edge.us.loopexit, label %.lr.ph119.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph119.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit179
  %54 = phi double [ %40, %.prol.loopexit179 ], [ %53, %._crit_edge.us.loopexit ]
  %55 = fdiv double %54, %2
  store double %55, double* %35, align 8
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next184, %wide.trip.count185
  br i1 %exitcond186, label %.._crit_edge_crit_edge.loopexit, label %.lr.ph119.split.us

.._crit_edge_crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge.loopexit219:               ; preds = %.lr.ph119.split
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.loopexit219, %.._crit_edge_crit_edge.loopexit, %middle.block
  br i1 true, label %.lr.ph114, label %.._crit_edge_crit_edge.._crit_edge.._crit_edge86_crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge.._crit_edge86_crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge.._crit_edge86_crit_edge

.lr.ph114:                                        ; preds = %.lr.ph119.split.prol.loopexit, %.._crit_edge_crit_edge
  br i1 %9, label %.lr.ph114.split.us.preheader, label %.lr.ph114.split.preheader

.lr.ph114.split.us.preheader:                     ; preds = %.lr.ph114
  %xtraiter162 = and i32 %1, 1
  %lcmp.mod163 = icmp eq i32 %xtraiter162, 0
  %56 = icmp eq i32 %1, 1
  %wide.trip.count166 = zext i32 %0 to i64
  %wide.trip.count158.1 = zext i32 %1 to i64
  br label %.lr.ph114.split.us

.lr.ph114.split.preheader:                        ; preds = %.lr.ph114
  %xtraiter172 = and i32 %0, 1
  %lcmp.mod173 = icmp eq i32 %xtraiter172, 0
  br i1 %lcmp.mod173, label %.lr.ph114.split.prol.loopexit, label %.lr.ph114.split.prol

.lr.ph114.split.prol:                             ; preds = %.lr.ph114.split.preheader
  %57 = fdiv double 0.000000e+00, %2
  store double %57, double* %6, align 8
  %58 = tail call double @sqrt(double %57) #4
  %59 = fcmp ugt double %58, 1.000000e-01
  %60 = select i1 %59, double %58, double 1.000000e+00
  store double %60, double* %6, align 8
  br label %.lr.ph114.split.prol.loopexit

.lr.ph114.split.prol.loopexit:                    ; preds = %.lr.ph114.split.preheader, %.lr.ph114.split.prol
  %indvars.iv168.unr = phi i64 [ 0, %.lr.ph114.split.preheader ], [ 1, %.lr.ph114.split.prol ]
  %61 = icmp eq i32 %0, 1
  br i1 %61, label %._crit_edge.._crit_edge86_crit_edge, label %.lr.ph114.split.preheader197

.lr.ph114.split.preheader197:                     ; preds = %.lr.ph114.split.prol.loopexit
  %62 = fdiv double 0.000000e+00, %2
  %wide.trip.count170.1 = zext i32 %0 to i64
  br label %.lr.ph114.split

.lr.ph114.split.us:                               ; preds = %.lr.ph114.split.us.preheader, %.._crit_edge87_crit_edge.us
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %.._crit_edge87_crit_edge.us ], [ 0, %.lr.ph114.split.us.preheader ]
  %63 = getelementptr inbounds double, double* %6, i64 %indvars.iv164
  store double 0.000000e+00, double* %63, align 8
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv164
  br i1 %lcmp.mod163, label %.prol.loopexit161, label %.prol.preheader160

.prol.preheader160:                               ; preds = %.lr.ph114.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv164
  %66 = load double, double* %65, align 8
  %67 = load double, double* %64, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = fadd double %69, 0.000000e+00
  store double %70, double* %63, align 8
  br label %.prol.loopexit161

.prol.loopexit161:                                ; preds = %.prol.preheader160, %.lr.ph114.split.us
  %71 = phi double [ %70, %.prol.preheader160 ], [ 0.000000e+00, %.lr.ph114.split.us ]
  %indvars.iv156.unr.ph = phi i64 [ 1, %.prol.preheader160 ], [ 0, %.lr.ph114.split.us ]
  br i1 %56, label %.._crit_edge87_crit_edge.us, label %.lr.ph114.split.us.new.preheader

.lr.ph114.split.us.new.preheader:                 ; preds = %.prol.loopexit161
  br label %.lr.ph114.split.us.new

.lr.ph114.split.us.new:                           ; preds = %.lr.ph114.split.us.new.preheader, %.lr.ph114.split.us.new
  %72 = phi double [ %84, %.lr.ph114.split.us.new ], [ %71, %.lr.ph114.split.us.new.preheader ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157.1, %.lr.ph114.split.us.new ], [ %indvars.iv156.unr.ph, %.lr.ph114.split.us.new.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv156, i64 %indvars.iv164
  %74 = load double, double* %73, align 8
  %75 = load double, double* %64, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = fadd double %72, %77
  store double %78, double* %63, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next157, i64 %indvars.iv164
  %80 = load double, double* %79, align 8
  %81 = load double, double* %64, align 8
  %82 = fsub double %80, %81
  %83 = fmul double %82, %82
  %84 = fadd double %78, %83
  store double %84, double* %63, align 8
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %exitcond159.1 = icmp eq i64 %indvars.iv.next157.1, %wide.trip.count158.1
  br i1 %exitcond159.1, label %.._crit_edge87_crit_edge.us.loopexit, label %.lr.ph114.split.us.new

.._crit_edge87_crit_edge.us.loopexit:             ; preds = %.lr.ph114.split.us.new
  br label %.._crit_edge87_crit_edge.us

.._crit_edge87_crit_edge.us:                      ; preds = %.._crit_edge87_crit_edge.us.loopexit, %.prol.loopexit161
  %85 = phi double [ %71, %.prol.loopexit161 ], [ %84, %.._crit_edge87_crit_edge.us.loopexit ]
  %86 = fdiv double %85, %2
  store double %86, double* %63, align 8
  %87 = tail call double @sqrt(double %86) #4
  %88 = fcmp ugt double %87, 1.000000e-01
  %89 = select i1 %88, double %87, double 1.000000e+00
  store double %89, double* %63, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %._crit_edge.._crit_edge86_crit_edge.loopexit, label %.lr.ph114.split.us

.lr.ph119.split:                                  ; preds = %.lr.ph119.split.preheader218, %.lr.ph119.split
  %indvars.iv187 = phi i64 [ %indvars.iv.next188.3, %.lr.ph119.split ], [ %indvars.iv187.ph, %.lr.ph119.split.preheader218 ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv187
  store double %14, double* %90, align 8
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next188
  store double %14, double* %91, align 8
  %indvars.iv.next188.1 = add nsw i64 %indvars.iv187, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next188.1
  store double %14, double* %92, align 8
  %indvars.iv.next188.2 = add nsw i64 %indvars.iv187, 3
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next188.2
  store double %14, double* %93, align 8
  %indvars.iv.next188.3 = add nsw i64 %indvars.iv187, 4
  %exitcond190.3 = icmp eq i64 %indvars.iv.next188.3, %wide.trip.count189.3
  br i1 %exitcond190.3, label %.._crit_edge_crit_edge.loopexit219, label %.lr.ph119.split, !llvm.loop !7

._crit_edge.._crit_edge86_crit_edge.loopexit:     ; preds = %.._crit_edge87_crit_edge.us
  br label %._crit_edge.._crit_edge86_crit_edge

._crit_edge.._crit_edge86_crit_edge.loopexit217:  ; preds = %.lr.ph114.split
  br label %._crit_edge.._crit_edge86_crit_edge

._crit_edge.._crit_edge86_crit_edge:              ; preds = %._crit_edge.._crit_edge86_crit_edge.loopexit217, %._crit_edge.._crit_edge86_crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge.._crit_edge86_crit_edge_crit_edge, %7, %.lr.ph114.split.prol.loopexit
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge86.._crit_edge88_crit_edge.lr.ph, label %._crit_edge86.._crit_edge89_crit_edge

._crit_edge86.._crit_edge88_crit_edge.lr.ph:      ; preds = %._crit_edge.._crit_edge86_crit_edge
  br i1 %8, label %._crit_edge86.._crit_edge88_crit_edge.us.preheader, label %._crit_edge86.._crit_edge89_crit_edge.thread

._crit_edge86.._crit_edge88_crit_edge.us.preheader: ; preds = %._crit_edge86.._crit_edge88_crit_edge.lr.ph
  %wide.trip.count149 = zext i32 %0 to i64
  %wide.trip.count153 = zext i32 %1 to i64
  br label %._crit_edge86.._crit_edge88_crit_edge.us

._crit_edge86.._crit_edge89_crit_edge.thread:     ; preds = %._crit_edge86.._crit_edge88_crit_edge.lr.ph
  %95 = add nsw i32 %0, -1
  br label %._crit_edge89._crit_edge

._crit_edge86.._crit_edge88_crit_edge.us:         ; preds = %._crit_edge86.._crit_edge88_crit_edge.us.preheader, %._crit_edge88._crit_edge.us
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %._crit_edge88._crit_edge.us ], [ 0, %._crit_edge86.._crit_edge88_crit_edge.us.preheader ]
  br label %._crit_edge88.us

._crit_edge88.us:                                 ; preds = %._crit_edge88.us, %._crit_edge86.._crit_edge88_crit_edge.us
  %indvars.iv147 = phi i64 [ 0, %._crit_edge86.._crit_edge88_crit_edge.us ], [ %indvars.iv.next148, %._crit_edge88.us ]
  %96 = getelementptr inbounds double, double* %5, i64 %indvars.iv147
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv151, i64 %indvars.iv147
  %99 = load double, double* %98, align 8
  %100 = fsub double %99, %97
  store double %100, double* %98, align 8
  %101 = tail call double @sqrt(double %2) #4
  %102 = getelementptr inbounds double, double* %6, i64 %indvars.iv147
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = load double, double* %98, align 8
  %106 = fdiv double %105, %104
  store double %106, double* %98, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next148, %wide.trip.count149
  br i1 %exitcond150, label %._crit_edge88._crit_edge.us, label %._crit_edge88.us

._crit_edge88._crit_edge.us:                      ; preds = %._crit_edge88.us
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next152, %wide.trip.count153
  br i1 %exitcond154, label %._crit_edge86.._crit_edge89_crit_edge.loopexit, label %._crit_edge86.._crit_edge88_crit_edge.us

.lr.ph114.split:                                  ; preds = %.lr.ph114.split.preheader197, %.lr.ph114.split
  %indvars.iv168 = phi i64 [ %indvars.iv.next169.1, %.lr.ph114.split ], [ %indvars.iv168.unr, %.lr.ph114.split.preheader197 ]
  %107 = getelementptr inbounds double, double* %6, i64 %indvars.iv168
  store double %62, double* %107, align 8
  %108 = tail call double @sqrt(double %62) #4
  %109 = fcmp ugt double %108, 1.000000e-01
  %110 = select i1 %109, double %108, double 1.000000e+00
  store double %110, double* %107, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %111 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next169
  store double %62, double* %111, align 8
  %112 = tail call double @sqrt(double %62) #4
  %113 = fcmp ugt double %112, 1.000000e-01
  %114 = select i1 %113, double %112, double 1.000000e+00
  store double %114, double* %111, align 8
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %exitcond171.1 = icmp eq i64 %indvars.iv.next169.1, %wide.trip.count170.1
  br i1 %exitcond171.1, label %._crit_edge.._crit_edge86_crit_edge.loopexit217, label %.lr.ph114.split

._crit_edge86.._crit_edge89_crit_edge.loopexit:   ; preds = %._crit_edge88._crit_edge.us
  br label %._crit_edge86.._crit_edge89_crit_edge

._crit_edge86.._crit_edge89_crit_edge:            ; preds = %._crit_edge86.._crit_edge89_crit_edge.loopexit, %._crit_edge.._crit_edge86_crit_edge
  %115 = add nsw i32 %0, -1
  %116 = icmp sgt i32 %0, 1
  br i1 %116, label %.lr.ph99, label %._crit_edge89._crit_edge

.lr.ph99:                                         ; preds = %._crit_edge86.._crit_edge89_crit_edge
  br i1 %94, label %.lr.ph99.split.us.preheader, label %.lr.ph99.split.preheader

.lr.ph99.split.preheader:                         ; preds = %.lr.ph99
  %117 = zext i32 %115 to i64
  %118 = add i32 %0, -2
  %119 = zext i32 %118 to i64
  %120 = sext i32 %0 to i64
  %wide.trip.count138.3 = zext i32 %0 to i64
  br label %.lr.ph99.split

.lr.ph99.split.us.preheader:                      ; preds = %.lr.ph99
  %121 = sext i32 %0 to i64
  %wide.trip.count132 = zext i32 %115 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %122 = icmp eq i32 %1, 1
  %wide.trip.count128 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph99.split.us

.lr.ph99.split.us:                                ; preds = %._crit_edge89.us, %.lr.ph99.split.us.preheader
  %indvars.iv130 = phi i64 [ 0, %.lr.ph99.split.us.preheader ], [ %indvars.iv.next131, %._crit_edge89.us ]
  %indvars.iv124 = phi i64 [ 1, %.lr.ph99.split.us.preheader ], [ %indvars.iv.next125, %._crit_edge89.us ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %123, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %124 = icmp slt i64 %indvars.iv.next131, %121
  br i1 %124, label %.lr.ph.us.us.preheader, label %._crit_edge89.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph99.split.us
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv130
  br label %.lr.ph.us.us

._crit_edge89.us.loopexit:                        ; preds = %._crit_edge92.us.us
  br label %._crit_edge89.us

._crit_edge89.us:                                 ; preds = %._crit_edge89.us.loopexit, %.lr.ph99.split.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next131, %wide.trip.count132
  br i1 %exitcond133, label %._crit_edge89._crit_edge.loopexit, label %.lr.ph99.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge92.us.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge92.us.us ], [ %indvars.iv124, %.lr.ph.us.us.preheader ]
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv130, i64 %indvars.iv126
  store double 0.000000e+00, double* %126, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %127 = load double, double* %125, align 8
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv126
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fadd double %130, 0.000000e+00
  store double %131, double* %126, align 8
  %132 = bitcast double %131 to i64
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %133 = phi i64 [ %132, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %134 = phi double [ %131, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %122, label %._crit_edge92.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge92.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  %135 = bitcast double %151 to i64
  br label %._crit_edge92.us.us

._crit_edge92.us.us:                              ; preds = %._crit_edge92.us.us.loopexit, %.prol.loopexit
  %136 = phi i64 [ %133, %.prol.loopexit ], [ %135, %._crit_edge92.us.us.loopexit ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv126, i64 %indvars.iv130
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond = icmp eq i64 %indvars.iv.next127, %wide.trip.count128
  br i1 %exitcond, label %._crit_edge89.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %139 = phi double [ %151, %.lr.ph.us.us.new ], [ %134, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv130
  %141 = load double, double* %140, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv126
  %143 = load double, double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %139, %144
  store double %145, double* %126, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv130
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv126
  %149 = load double, double* %148, align 8
  %150 = fmul double %147, %149
  %151 = fadd double %145, %150
  store double %151, double* %126, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge92.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph99.split:                                   ; preds = %._crit_edge89, %.lr.ph99.split.preheader
  %indvars.iv143 = phi i64 [ 0, %.lr.ph99.split.preheader ], [ %indvars.iv.next144, %._crit_edge89 ]
  %indvars.iv134 = phi i64 [ 1, %.lr.ph99.split.preheader ], [ %indvars.iv.next135, %._crit_edge89 ]
  %152 = sub i64 %119, %indvars.iv143
  %153 = trunc i64 %152 to i32
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv143
  store double 1.000000e+00, double* %154, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %155 = icmp slt i64 %indvars.iv.next144, %120
  br i1 %155, label %.lr.ph96.split.preheader, label %._crit_edge89

.lr.ph96.split.preheader:                         ; preds = %.lr.ph99.split
  %156 = sub i64 %117, %indvars.iv143
  %157 = trunc i64 %156 to i32
  %xtraiter141 = and i32 %157, 3
  %lcmp.mod142 = icmp eq i32 %xtraiter141, 0
  br i1 %lcmp.mod142, label %.lr.ph96.split.prol.loopexit, label %.lr.ph96.split.prol.preheader

.lr.ph96.split.prol.preheader:                    ; preds = %.lr.ph96.split.preheader
  br label %.lr.ph96.split.prol

.lr.ph96.split.prol:                              ; preds = %.lr.ph96.split.prol.preheader, %.lr.ph96.split.prol
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph96.split.prol ], [ %indvars.iv134, %.lr.ph96.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph96.split.prol ], [ %xtraiter141, %.lr.ph96.split.prol.preheader ]
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv136.prol
  store double 0.000000e+00, double* %158, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv136.prol, i64 %indvars.iv143
  %160 = bitcast double* %159 to i64*
  store i64 0, i64* %160, align 8
  %indvars.iv.next137.prol = add nuw nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph96.split.prol.loopexit.loopexit, label %.lr.ph96.split.prol, !llvm.loop !9

.lr.ph96.split.prol.loopexit.loopexit:            ; preds = %.lr.ph96.split.prol
  br label %.lr.ph96.split.prol.loopexit

.lr.ph96.split.prol.loopexit:                     ; preds = %.lr.ph96.split.prol.loopexit.loopexit, %.lr.ph96.split.preheader
  %indvars.iv136.unr = phi i64 [ %indvars.iv134, %.lr.ph96.split.preheader ], [ %indvars.iv.next137.prol, %.lr.ph96.split.prol.loopexit.loopexit ]
  %161 = icmp ult i32 %153, 3
  br i1 %161, label %._crit_edge89, label %.lr.ph96.split.preheader215

.lr.ph96.split.preheader215:                      ; preds = %.lr.ph96.split.prol.loopexit
  br label %.lr.ph96.split

.lr.ph96.split:                                   ; preds = %.lr.ph96.split.preheader215, %.lr.ph96.split
  %indvars.iv136 = phi i64 [ %indvars.iv.next137.3, %.lr.ph96.split ], [ %indvars.iv136.unr, %.lr.ph96.split.preheader215 ]
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv136
  store double 0.000000e+00, double* %162, align 8
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv136, i64 %indvars.iv143
  %164 = bitcast double* %163 to i64*
  store i64 0, i64* %164, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv.next137
  store double 0.000000e+00, double* %165, align 8
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next137, i64 %indvars.iv143
  %167 = bitcast double* %166 to i64*
  store i64 0, i64* %167, align 8
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv.next137.1
  store double 0.000000e+00, double* %168, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next137.1, i64 %indvars.iv143
  %170 = bitcast double* %169 to i64*
  store i64 0, i64* %170, align 8
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv143, i64 %indvars.iv.next137.2
  store double 0.000000e+00, double* %171, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next137.2, i64 %indvars.iv143
  %173 = bitcast double* %172 to i64*
  store i64 0, i64* %173, align 8
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  %exitcond139.3 = icmp eq i64 %indvars.iv.next137.3, %wide.trip.count138.3
  br i1 %exitcond139.3, label %._crit_edge89.loopexit, label %.lr.ph96.split

._crit_edge89.loopexit:                           ; preds = %.lr.ph96.split
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit, %.lr.ph96.split.prol.loopexit, %.lr.ph99.split
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next144, %117
  br i1 %exitcond146, label %._crit_edge89._crit_edge.loopexit216, label %.lr.ph99.split

._crit_edge89._crit_edge.loopexit:                ; preds = %._crit_edge89.us
  br label %._crit_edge89._crit_edge

._crit_edge89._crit_edge.loopexit216:             ; preds = %._crit_edge89
  br label %._crit_edge89._crit_edge

._crit_edge89._crit_edge:                         ; preds = %._crit_edge89._crit_edge.loopexit216, %._crit_edge89._crit_edge.loopexit, %._crit_edge86.._crit_edge89_crit_edge.thread, %._crit_edge86.._crit_edge89_crit_edge
  %174 = phi i32 [ %95, %._crit_edge86.._crit_edge89_crit_edge.thread ], [ %115, %._crit_edge86.._crit_edge89_crit_edge ], [ %115, %._crit_edge89._crit_edge.loopexit ], [ %115, %._crit_edge89._crit_edge.loopexit216 ]
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %175, i64 %175
  store double 1.000000e+00, double* %176, align 8
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
  br i1 %7, label %.._crit_edge_crit_edge.us.preheader, label %._crit_edge

.._crit_edge_crit_edge.us.preheader:              ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %indvars.iv.next12, %._crit_edge._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv11, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge8.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge8.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge8.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge8.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, %wide.trip.count
  br i1 %exitcond14, label %._crit_edge.loopexit, label %.._crit_edge_crit_edge.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
