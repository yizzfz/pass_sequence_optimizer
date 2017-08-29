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
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next14, %18 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv13
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond15, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*, double*) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph155, label %.preheader127

.lr.ph155:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr113 = ptrtoint double* %5 to i64
  br i1 %9, label %.lr.ph155.split.us.preheader, label %.lr.ph155.split.preheader

.lr.ph155.split.preheader:                        ; preds = %.lr.ph155
  %10 = zext i32 %0 to i64
  %xtraiter255 = and i64 %10, 1
  %lcmp.mod256 = icmp eq i64 %xtraiter255, 0
  br i1 %lcmp.mod256, label %.lr.ph155.split.prol.loopexit, label %.lr.ph155.split.prol

.lr.ph155.split.prol:                             ; preds = %.lr.ph155.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  store double %11, double* %5, align 8
  br label %.lr.ph155.split.prol.loopexit

.lr.ph155.split.prol.loopexit:                    ; preds = %.lr.ph155.split.preheader, %.lr.ph155.split.prol
  %indvars.iv220.unr = phi i64 [ 0, %.lr.ph155.split.preheader ], [ 1, %.lr.ph155.split.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %.lr.ph147, label %.lr.ph155.split.preheader262

.lr.ph155.split.preheader262:                     ; preds = %.lr.ph155.split.prol.loopexit
  %13 = fdiv double 0.000000e+00, %2
  %14 = fdiv double 0.000000e+00, %2
  %15 = add nsw i64 %10, -2
  %16 = sub nsw i64 %15, %indvars.iv220.unr
  %17 = lshr i64 %16, 1
  %18 = and i64 %17, 1
  %lcmp.mod290 = icmp eq i64 %18, 0
  br i1 %lcmp.mod290, label %.lr.ph155.split.prol.preheader, label %.lr.ph155.split.prol.loopexit288

.lr.ph155.split.prol.preheader:                   ; preds = %.lr.ph155.split.preheader262
  br label %.lr.ph155.split.prol291

.lr.ph155.split.prol291:                          ; preds = %.lr.ph155.split.prol.preheader
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv220.unr
  store double 0.000000e+00, double* %19, align 8
  %sunkaddr114.prol = shl nuw nsw i64 %indvars.iv220.unr, 3
  %sunkaddr115.prol = add i64 %sunkaddr113, %sunkaddr114.prol
  %sunkaddr116.prol = inttoptr i64 %sunkaddr115.prol to double*
  store double %13, double* %sunkaddr116.prol, align 8
  %indvars.iv.next221.prol = add nuw nsw i64 %indvars.iv220.unr, 1
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next221.prol
  store double 0.000000e+00, double* %20, align 8
  %sunkaddr114.1.prol = shl nuw nsw i64 %indvars.iv.next221.prol, 3
  %sunkaddr115.1.prol = add i64 %sunkaddr113, %sunkaddr114.1.prol
  %sunkaddr116.1.prol = inttoptr i64 %sunkaddr115.1.prol to double*
  store double %14, double* %sunkaddr116.1.prol, align 8
  %indvars.iv.next221.1.prol = or i64 %indvars.iv220.unr, 2
  br label %.lr.ph155.split.prol.loopexit288

.lr.ph155.split.prol.loopexit288:                 ; preds = %.lr.ph155.split.prol291, %.lr.ph155.split.preheader262
  %indvars.iv220.unr292 = phi i64 [ %indvars.iv220.unr, %.lr.ph155.split.preheader262 ], [ %indvars.iv.next221.1.prol, %.lr.ph155.split.prol291 ]
  %21 = icmp eq i64 %17, 0
  br i1 %21, label %.preheader128.loopexit283, label %.lr.ph155.split.preheader262.new

.lr.ph155.split.preheader262.new:                 ; preds = %.lr.ph155.split.prol.loopexit288
  br label %.lr.ph155.split

.lr.ph155.split.us.preheader:                     ; preds = %.lr.ph155
  %22 = zext i32 %1 to i64
  %23 = add nsw i64 %22, -1
  %24 = zext i32 %0 to i64
  %xtraiter249 = and i64 %22, 3
  %lcmp.mod250 = icmp eq i64 %xtraiter249, 0
  %25 = icmp ult i64 %23, 3
  br label %.lr.ph155.split.us

.lr.ph155.split.us:                               ; preds = %._crit_edge151.us, %.lr.ph155.split.us.preheader
  %indvars.iv216 = phi i64 [ 0, %.lr.ph155.split.us.preheader ], [ %indvars.iv.next217, %._crit_edge151.us ]
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv216
  store double 0.000000e+00, double* %26, align 8
  %sunkaddr110.us = shl nsw i64 %indvars.iv216, 3
  %sunkaddr111.us = add i64 %sunkaddr, %sunkaddr110.us
  %sunkaddr112.us = inttoptr i64 %sunkaddr111.us to double*
  br i1 %lcmp.mod250, label %.prol.loopexit248, label %.prol.preheader247.preheader

.prol.preheader247.preheader:                     ; preds = %.lr.ph155.split.us
  br label %.prol.preheader247

.prol.preheader247:                               ; preds = %.prol.preheader247.preheader, %.prol.preheader247
  %indvars.iv212.prol = phi i64 [ %indvars.iv.next213.prol, %.prol.preheader247 ], [ 0, %.prol.preheader247.preheader ]
  %27 = phi double [ %30, %.prol.preheader247 ], [ 0.000000e+00, %.prol.preheader247.preheader ]
  %prol.iter251 = phi i64 [ %prol.iter251.sub, %.prol.preheader247 ], [ %xtraiter249, %.prol.preheader247.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv212.prol, i64 %indvars.iv216
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  store double %30, double* %sunkaddr112.us, align 8
  %indvars.iv.next213.prol = add nuw nsw i64 %indvars.iv212.prol, 1
  %prol.iter251.sub = add nsw i64 %prol.iter251, -1
  %prol.iter251.cmp = icmp eq i64 %prol.iter251.sub, 0
  br i1 %prol.iter251.cmp, label %.prol.loopexit248.loopexit, label %.prol.preheader247, !llvm.loop !1

.prol.loopexit248.loopexit:                       ; preds = %.prol.preheader247
  br label %.prol.loopexit248

.prol.loopexit248:                                ; preds = %.prol.loopexit248.loopexit, %.lr.ph155.split.us
  %.lcssa225.unr = phi double [ undef, %.lr.ph155.split.us ], [ %30, %.prol.loopexit248.loopexit ]
  %indvars.iv212.unr = phi i64 [ 0, %.lr.ph155.split.us ], [ %xtraiter249, %.prol.loopexit248.loopexit ]
  %.unr252 = phi double [ 0.000000e+00, %.lr.ph155.split.us ], [ %30, %.prol.loopexit248.loopexit ]
  br i1 %25, label %._crit_edge151.us, label %.lr.ph155.split.us.new.preheader

.lr.ph155.split.us.new.preheader:                 ; preds = %.prol.loopexit248
  br label %.lr.ph155.split.us.new

.lr.ph155.split.us.new:                           ; preds = %.lr.ph155.split.us.new.preheader, %.lr.ph155.split.us.new
  %indvars.iv212 = phi i64 [ %indvars.iv.next213.3, %.lr.ph155.split.us.new ], [ %indvars.iv212.unr, %.lr.ph155.split.us.new.preheader ]
  %31 = phi double [ %43, %.lr.ph155.split.us.new ], [ %.unr252, %.lr.ph155.split.us.new.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv212, i64 %indvars.iv216
  %33 = load double, double* %32, align 8
  %34 = fadd double %31, %33
  store double %34, double* %sunkaddr112.us, align 8
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next213, i64 %indvars.iv216
  %36 = load double, double* %35, align 8
  %37 = fadd double %34, %36
  store double %37, double* %sunkaddr112.us, align 8
  %indvars.iv.next213.1 = add nsw i64 %indvars.iv212, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next213.1, i64 %indvars.iv216
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  store double %40, double* %sunkaddr112.us, align 8
  %indvars.iv.next213.2 = add nsw i64 %indvars.iv212, 3
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next213.2, i64 %indvars.iv216
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  store double %43, double* %sunkaddr112.us, align 8
  %indvars.iv.next213.3 = add nuw nsw i64 %indvars.iv212, 4
  %exitcond246.3 = icmp eq i64 %indvars.iv.next213.3, %22
  br i1 %exitcond246.3, label %._crit_edge151.us.loopexit, label %.lr.ph155.split.us.new

._crit_edge151.us.loopexit:                       ; preds = %.lr.ph155.split.us.new
  br label %._crit_edge151.us

._crit_edge151.us:                                ; preds = %._crit_edge151.us.loopexit, %.prol.loopexit248
  %.lcssa225 = phi double [ %.lcssa225.unr, %.prol.loopexit248 ], [ %43, %._crit_edge151.us.loopexit ]
  %44 = fdiv double %.lcssa225, %2
  %sunkaddr114.us = shl nsw i64 %indvars.iv216, 3
  %sunkaddr115.us = add i64 %sunkaddr113, %sunkaddr114.us
  %sunkaddr116.us = inttoptr i64 %sunkaddr115.us to double*
  store double %44, double* %sunkaddr116.us, align 8
  %indvars.iv.next217 = add nuw nsw i64 %indvars.iv216, 1
  %exitcond253 = icmp eq i64 %indvars.iv.next217, %24
  br i1 %exitcond253, label %.preheader128.loopexit, label %.lr.ph155.split.us

.preheader128.loopexit:                           ; preds = %._crit_edge151.us
  br label %.preheader128

.preheader128.loopexit283.unr-lcssa:              ; preds = %.lr.ph155.split
  br label %.preheader128.loopexit283

.preheader128.loopexit283:                        ; preds = %.lr.ph155.split.prol.loopexit288, %.preheader128.loopexit283.unr-lcssa
  br label %.preheader128

.preheader128:                                    ; preds = %.preheader128.loopexit283, %.preheader128.loopexit
  %45 = icmp sgt i32 %0, 0
  br i1 %45, label %.lr.ph147, label %.preheader127

.lr.ph147:                                        ; preds = %.lr.ph155.split.prol.loopexit, %.preheader128
  %46 = icmp sgt i32 %1, 0
  %sunkaddr117 = ptrtoint double* %6 to i64
  %sunkaddr121 = ptrtoint double* %6 to i64
  br i1 %46, label %.lr.ph147.split.us.preheader, label %.lr.ph147.split.preheader

.lr.ph147.split.preheader:                        ; preds = %.lr.ph147
  %47 = zext i32 %0 to i64
  %xtraiter244 = and i64 %47, 1
  %lcmp.mod245 = icmp eq i64 %xtraiter244, 0
  br i1 %lcmp.mod245, label %.lr.ph147.split.prol.loopexit, label %.lr.ph147.split.prol

.lr.ph147.split.prol:                             ; preds = %.lr.ph147.split.preheader
  %48 = fdiv double 0.000000e+00, %2
  store double %48, double* %6, align 8
  %49 = tail call double @sqrt(double %48) #4
  %50 = fcmp ugt double %49, 1.000000e-01
  %51 = select i1 %50, double %49, double 1.000000e+00
  store double %51, double* %6, align 8
  br label %.lr.ph147.split.prol.loopexit

.lr.ph147.split.prol.loopexit:                    ; preds = %.lr.ph147.split.preheader, %.lr.ph147.split.prol
  %indvars.iv208.unr = phi i64 [ 0, %.lr.ph147.split.preheader ], [ 1, %.lr.ph147.split.prol ]
  %52 = icmp eq i32 %0, 1
  br i1 %52, label %.preheader127, label %.lr.ph147.split.preheader260

.lr.ph147.split.preheader260:                     ; preds = %.lr.ph147.split.prol.loopexit
  %53 = fdiv double 0.000000e+00, %2
  %54 = fdiv double 0.000000e+00, %2
  br label %.lr.ph147.split

.lr.ph147.split.us.preheader:                     ; preds = %.lr.ph147
  %55 = zext i32 %1 to i64
  %56 = zext i32 %0 to i64
  %xtraiter239 = and i64 %55, 1
  %lcmp.mod240 = icmp eq i64 %xtraiter239, 0
  %57 = icmp eq i32 %1, 1
  br label %.lr.ph147.split.us

.lr.ph147.split.us:                               ; preds = %._crit_edge144.us, %.lr.ph147.split.us.preheader
  %indvars.iv204 = phi i64 [ 0, %.lr.ph147.split.us.preheader ], [ %indvars.iv.next205, %._crit_edge144.us ]
  %58 = getelementptr inbounds double, double* %6, i64 %indvars.iv204
  store double 0.000000e+00, double* %58, align 8
  %59 = getelementptr inbounds double, double* %5, i64 %indvars.iv204
  %sunkaddr118.us = shl nsw i64 %indvars.iv204, 3
  %sunkaddr119.us = add i64 %sunkaddr117, %sunkaddr118.us
  %sunkaddr120.us = inttoptr i64 %sunkaddr119.us to double*
  br i1 %lcmp.mod240, label %.prol.loopexit238, label %.prol.preheader237

.prol.preheader237:                               ; preds = %.lr.ph147.split.us
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv204
  %61 = load double, double* %60, align 8
  %62 = load double, double* %59, align 8
  %63 = fsub double %61, %62
  %64 = fmul double %63, %63
  %65 = fadd double %64, 0.000000e+00
  store double %65, double* %sunkaddr120.us, align 8
  br label %.prol.loopexit238

.prol.loopexit238:                                ; preds = %.prol.preheader237, %.lr.ph147.split.us
  %.lcssa224.unr.ph = phi double [ %65, %.prol.preheader237 ], [ undef, %.lr.ph147.split.us ]
  %indvars.iv200.unr.ph = phi i64 [ 1, %.prol.preheader237 ], [ 0, %.lr.ph147.split.us ]
  %.unr241.ph = phi double [ %65, %.prol.preheader237 ], [ 0.000000e+00, %.lr.ph147.split.us ]
  br i1 %57, label %._crit_edge144.us, label %.lr.ph147.split.us.new.preheader

.lr.ph147.split.us.new.preheader:                 ; preds = %.prol.loopexit238
  br label %.lr.ph147.split.us.new

.lr.ph147.split.us.new:                           ; preds = %.lr.ph147.split.us.new.preheader, %.lr.ph147.split.us.new
  %indvars.iv200 = phi i64 [ %indvars.iv.next201.1, %.lr.ph147.split.us.new ], [ %indvars.iv200.unr.ph, %.lr.ph147.split.us.new.preheader ]
  %66 = phi double [ %78, %.lr.ph147.split.us.new ], [ %.unr241.ph, %.lr.ph147.split.us.new.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv200, i64 %indvars.iv204
  %68 = load double, double* %67, align 8
  %69 = load double, double* %59, align 8
  %70 = fsub double %68, %69
  %71 = fmul double %70, %70
  %72 = fadd double %66, %71
  store double %72, double* %sunkaddr120.us, align 8
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next201, i64 %indvars.iv204
  %74 = load double, double* %73, align 8
  %75 = load double, double* %59, align 8
  %76 = fsub double %74, %75
  %77 = fmul double %76, %76
  %78 = fadd double %72, %77
  store double %78, double* %sunkaddr120.us, align 8
  %indvars.iv.next201.1 = add nuw nsw i64 %indvars.iv200, 2
  %exitcond236.1 = icmp eq i64 %indvars.iv.next201.1, %55
  br i1 %exitcond236.1, label %._crit_edge144.us.loopexit, label %.lr.ph147.split.us.new

._crit_edge144.us.loopexit:                       ; preds = %.lr.ph147.split.us.new
  br label %._crit_edge144.us

._crit_edge144.us:                                ; preds = %._crit_edge144.us.loopexit, %.prol.loopexit238
  %.lcssa224 = phi double [ %.lcssa224.unr.ph, %.prol.loopexit238 ], [ %78, %._crit_edge144.us.loopexit ]
  %79 = fdiv double %.lcssa224, %2
  %sunkaddr122.us = shl nsw i64 %indvars.iv204, 3
  %sunkaddr123.us = add i64 %sunkaddr121, %sunkaddr122.us
  %sunkaddr124.us = inttoptr i64 %sunkaddr123.us to double*
  store double %79, double* %sunkaddr124.us, align 8
  %80 = tail call double @sqrt(double %79) #4
  %81 = fcmp ugt double %80, 1.000000e-01
  %82 = select i1 %81, double %80, double 1.000000e+00
  store double %82, double* %sunkaddr124.us, align 8
  %indvars.iv.next205 = add nuw nsw i64 %indvars.iv204, 1
  %exitcond242 = icmp eq i64 %indvars.iv.next205, %56
  br i1 %exitcond242, label %.preheader127.loopexit, label %.lr.ph147.split.us

.lr.ph155.split:                                  ; preds = %.lr.ph155.split, %.lr.ph155.split.preheader262.new
  %indvars.iv220 = phi i64 [ %indvars.iv220.unr292, %.lr.ph155.split.preheader262.new ], [ %indvars.iv.next221.1.1, %.lr.ph155.split ]
  %83 = getelementptr inbounds double, double* %5, i64 %indvars.iv220
  store double 0.000000e+00, double* %83, align 8
  %sunkaddr114 = shl nsw i64 %indvars.iv220, 3
  %sunkaddr115 = add i64 %sunkaddr113, %sunkaddr114
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to double*
  store double %13, double* %sunkaddr116, align 8
  %indvars.iv.next221 = add nuw nsw i64 %indvars.iv220, 1
  %84 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next221
  store double 0.000000e+00, double* %84, align 8
  %sunkaddr114.1 = shl nsw i64 %indvars.iv.next221, 3
  %sunkaddr115.1 = add i64 %sunkaddr113, %sunkaddr114.1
  %sunkaddr116.1 = inttoptr i64 %sunkaddr115.1 to double*
  store double %14, double* %sunkaddr116.1, align 8
  %indvars.iv.next221.1 = add nuw nsw i64 %indvars.iv220, 2
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next221.1
  store double 0.000000e+00, double* %85, align 8
  %sunkaddr114.1293 = shl nsw i64 %indvars.iv.next221.1, 3
  %sunkaddr115.1294 = add i64 %sunkaddr113, %sunkaddr114.1293
  %sunkaddr116.1295 = inttoptr i64 %sunkaddr115.1294 to double*
  store double %13, double* %sunkaddr116.1295, align 8
  %indvars.iv.next221.1296 = add nsw i64 %indvars.iv220, 3
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next221.1296
  store double 0.000000e+00, double* %86, align 8
  %sunkaddr114.1.1 = shl nsw i64 %indvars.iv.next221.1296, 3
  %sunkaddr115.1.1 = add i64 %sunkaddr113, %sunkaddr114.1.1
  %sunkaddr116.1.1 = inttoptr i64 %sunkaddr115.1.1 to double*
  store double %14, double* %sunkaddr116.1.1, align 8
  %indvars.iv.next221.1.1 = add nsw i64 %indvars.iv220, 4
  %exitcond254.1.1 = icmp eq i64 %indvars.iv.next221.1.1, %10
  br i1 %exitcond254.1.1, label %.preheader128.loopexit283.unr-lcssa, label %.lr.ph155.split

.preheader127.loopexit:                           ; preds = %._crit_edge144.us
  br label %.preheader127

.preheader127.loopexit282:                        ; preds = %.lr.ph147.split
  br label %.preheader127

.preheader127:                                    ; preds = %.preheader127.loopexit282, %.preheader127.loopexit, %7, %.lr.ph147.split.prol.loopexit, %.preheader128
  %87 = icmp sgt i32 %1, 0
  br i1 %87, label %.preheader126.lr.ph, label %.preheader125

.preheader126.lr.ph:                              ; preds = %.preheader127
  %88 = icmp sgt i32 %0, 0
  br i1 %88, label %.preheader126.us.preheader, label %.preheader125.thread

.preheader125.thread:                             ; preds = %.preheader126.lr.ph
  %89 = add nsw i32 %0, -1
  br label %._crit_edge135

.preheader126.us.preheader:                       ; preds = %.preheader126.lr.ph
  %90 = zext i32 %0 to i64
  %91 = zext i32 %1 to i64
  br label %.preheader126.us

.preheader126.us:                                 ; preds = %._crit_edge139.us, %.preheader126.us.preheader
  %indvars.iv195 = phi i64 [ 0, %.preheader126.us.preheader ], [ %indvars.iv.next196, %._crit_edge139.us ]
  br label %92

; <label>:92:                                     ; preds = %92, %.preheader126.us
  %indvars.iv191 = phi i64 [ %indvars.iv.next192, %92 ], [ 0, %.preheader126.us ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv191
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv195, i64 %indvars.iv191
  %96 = load double, double* %95, align 8
  %97 = fsub double %96, %94
  store double %97, double* %95, align 8
  %98 = tail call double @sqrt(double %2) #4
  %99 = getelementptr inbounds double, double* %6, i64 %indvars.iv191
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = load double, double* %95, align 8
  %103 = fdiv double %102, %101
  store double %103, double* %95, align 8
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %exitcond234 = icmp eq i64 %indvars.iv.next192, %90
  br i1 %exitcond234, label %._crit_edge139.us, label %92

._crit_edge139.us:                                ; preds = %92
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond235 = icmp eq i64 %indvars.iv.next196, %91
  br i1 %exitcond235, label %.preheader125.loopexit, label %.preheader126.us

.lr.ph147.split:                                  ; preds = %.lr.ph147.split.preheader260, %.lr.ph147.split
  %indvars.iv208 = phi i64 [ %indvars.iv.next209.1, %.lr.ph147.split ], [ %indvars.iv208.unr, %.lr.ph147.split.preheader260 ]
  %104 = getelementptr inbounds double, double* %6, i64 %indvars.iv208
  store double 0.000000e+00, double* %104, align 8
  %sunkaddr122 = shl nsw i64 %indvars.iv208, 3
  %sunkaddr123 = add i64 %sunkaddr121, %sunkaddr122
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to double*
  store double %53, double* %sunkaddr124, align 8
  %105 = tail call double @sqrt(double %53) #4
  %106 = fcmp ugt double %105, 1.000000e-01
  %107 = select i1 %106, double %105, double 1.000000e+00
  store double %107, double* %sunkaddr124, align 8
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %108 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next209
  store double 0.000000e+00, double* %108, align 8
  %sunkaddr122.1 = shl nsw i64 %indvars.iv.next209, 3
  %sunkaddr123.1 = add i64 %sunkaddr121, %sunkaddr122.1
  %sunkaddr124.1 = inttoptr i64 %sunkaddr123.1 to double*
  store double %54, double* %sunkaddr124.1, align 8
  %109 = tail call double @sqrt(double %54) #4
  %110 = fcmp ugt double %109, 1.000000e-01
  %111 = select i1 %110, double %109, double 1.000000e+00
  store double %111, double* %sunkaddr124.1, align 8
  %indvars.iv.next209.1 = add nsw i64 %indvars.iv208, 2
  %exitcond243.1 = icmp eq i64 %indvars.iv.next209.1, %47
  br i1 %exitcond243.1, label %.preheader127.loopexit282, label %.lr.ph147.split

.preheader125.loopexit:                           ; preds = %._crit_edge139.us
  br label %.preheader125

.preheader125:                                    ; preds = %.preheader125.loopexit, %.preheader127
  %112 = add nsw i32 %0, -1
  %113 = icmp sgt i32 %0, 1
  br i1 %113, label %.preheader.lr.ph, label %._crit_edge135

.preheader.lr.ph:                                 ; preds = %.preheader125
  %114 = icmp sgt i32 %1, 0
  %115 = sext i32 %0 to i64
  br i1 %114, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %116 = zext i32 %0 to i64
  %117 = add nuw nsw i64 %116, 3
  %118 = add nsw i64 %116, -2
  %119 = zext i32 %112 to i64
  %120 = trunc i32 %0 to i2
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %121 = zext i32 %1 to i64
  %122 = zext i32 %0 to i64
  %123 = zext i32 %112 to i64
  %xtraiter = and i64 %121, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %124 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv177 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next178, %._crit_edge.us-lcssa.us.us ]
  %indvars.iv171 = phi i64 [ 1, %.preheader.us.preheader ], [ %indvars.iv.next172, %._crit_edge.us-lcssa.us.us ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv177, i64 %indvars.iv177
  store double 1.000000e+00, double* %125, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %126 = icmp slt i64 %indvars.iv.next178, %115
  br i1 %126, label %.lr.ph.us.us.preheader, label %._crit_edge.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv177
  br label %.lr.ph.us.us

._crit_edge.us-lcssa.us.us.loopexit:              ; preds = %.loopexit.us.us
  br label %._crit_edge.us-lcssa.us.us

._crit_edge.us-lcssa.us.us:                       ; preds = %._crit_edge.us-lcssa.us.us.loopexit, %.preheader.us
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond228 = icmp eq i64 %indvars.iv.next178, %123
  br i1 %exitcond228, label %._crit_edge135.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %.loopexit.us.us
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %.loopexit.us.us ], [ %indvars.iv171, %.lr.ph.us.us.preheader ]
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv177, i64 %indvars.iv173
  store double 0.000000e+00, double* %128, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %129 = load double, double* %127, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv173
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = fadd double %132, 0.000000e+00
  store double %133, double* %128, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %.lcssa.unr.ph = phi double [ %133, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %133, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %124, label %.loopexit.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

.loopexit.us.us.loopexit:                         ; preds = %.lr.ph.us.us.new
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %147, %.loopexit.us.us.loopexit ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv173, i64 %indvars.iv177
  store double %.lcssa, double* %134, align 8
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond = icmp eq i64 %indvars.iv.next174, %122
  br i1 %exitcond, label %._crit_edge.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %135 = phi double [ %147, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv177
  %137 = load double, double* %136, align 8
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv173
  %139 = load double, double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fadd double %135, %140
  store double %141, double* %128, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv177
  %143 = load double, double* %142, align 8
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv173
  %145 = load double, double* %144, align 8
  %146 = fmul double %143, %145
  %147 = fadd double %141, %146
  store double %147, double* %128, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond226.1 = icmp eq i64 %indvars.iv.next.1, %121
  br i1 %exitcond226.1, label %.loopexit.us.us.loopexit, label %.lr.ph.us.us.new

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv278.in = phi i2 [ %indvars.iv278, %._crit_edge ], [ %120, %.preheader.preheader ]
  %indvars.iv276 = phi i64 [ %indvars.iv.next277, %._crit_edge ], [ 1, %.preheader.preheader ]
  %indvars.iv187 = phi i64 [ %indvars.iv.next188, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv278 = add i2 %indvars.iv278.in, -1
  %148 = zext i2 %indvars.iv278 to i64
  %149 = add i64 %indvars.iv276, %148
  %150 = sub i64 %118, %indvars.iv187
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv187
  store double 1.000000e+00, double* %151, align 8
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %152 = icmp slt i64 %indvars.iv.next188, %115
  br i1 %152, label %.lr.ph133.split.preheader, label %._crit_edge

.lr.ph133.split.preheader:                        ; preds = %.preheader
  %153 = sub i64 %117, %indvars.iv187
  %xtraiter231 = and i64 %153, 3
  %lcmp.mod232 = icmp eq i64 %xtraiter231, 0
  br i1 %lcmp.mod232, label %.lr.ph133.split.prol.loopexit, label %.lr.ph133.split.prol.preheader

.lr.ph133.split.prol.preheader:                   ; preds = %.lr.ph133.split.preheader
  br label %.lr.ph133.split.prol

.lr.ph133.split.prol:                             ; preds = %.lr.ph133.split.prol.preheader, %.lr.ph133.split.prol
  %indvars.iv183.prol = phi i64 [ %indvars.iv.next184.prol, %.lr.ph133.split.prol ], [ %indvars.iv276, %.lr.ph133.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph133.split.prol ], [ %xtraiter231, %.lr.ph133.split.prol.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv183.prol
  store double 0.000000e+00, double* %154, align 8
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv183.prol, i64 %indvars.iv187
  store double 0.000000e+00, double* %155, align 8
  %indvars.iv.next184.prol = add nuw nsw i64 %indvars.iv183.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph133.split.prol.loopexit.loopexit, label %.lr.ph133.split.prol, !llvm.loop !3

.lr.ph133.split.prol.loopexit.loopexit:           ; preds = %.lr.ph133.split.prol
  br label %.lr.ph133.split.prol.loopexit

.lr.ph133.split.prol.loopexit:                    ; preds = %.lr.ph133.split.prol.loopexit.loopexit, %.lr.ph133.split.preheader
  %indvars.iv183.unr = phi i64 [ %indvars.iv276, %.lr.ph133.split.preheader ], [ %149, %.lr.ph133.split.prol.loopexit.loopexit ]
  %156 = icmp ult i64 %150, 3
  br i1 %156, label %._crit_edge, label %.lr.ph133.split.preheader280

.lr.ph133.split.preheader280:                     ; preds = %.lr.ph133.split.prol.loopexit
  br label %.lr.ph133.split

.lr.ph133.split:                                  ; preds = %.lr.ph133.split.preheader280, %.lr.ph133.split
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.3, %.lr.ph133.split ], [ %indvars.iv183.unr, %.lr.ph133.split.preheader280 ]
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv183
  store double 0.000000e+00, double* %157, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv183, i64 %indvars.iv187
  store double 0.000000e+00, double* %158, align 8
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv.next184
  store double 0.000000e+00, double* %159, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next184, i64 %indvars.iv187
  store double 0.000000e+00, double* %160, align 8
  %indvars.iv.next184.1 = add nsw i64 %indvars.iv183, 2
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv.next184.1
  store double 0.000000e+00, double* %161, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next184.1, i64 %indvars.iv187
  store double 0.000000e+00, double* %162, align 8
  %indvars.iv.next184.2 = add nsw i64 %indvars.iv183, 3
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv.next184.2
  store double 0.000000e+00, double* %163, align 8
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next184.2, i64 %indvars.iv187
  store double 0.000000e+00, double* %164, align 8
  %indvars.iv.next184.3 = add nsw i64 %indvars.iv183, 4
  %exitcond229.3 = icmp eq i64 %indvars.iv.next184.3, %116
  br i1 %exitcond229.3, label %._crit_edge.loopexit, label %.lr.ph133.split

._crit_edge.loopexit:                             ; preds = %.lr.ph133.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph133.split.prol.loopexit, %.preheader
  %indvars.iv.next277 = add nuw i64 %indvars.iv276, 1
  %exitcond233 = icmp eq i64 %indvars.iv.next188, %119
  br i1 %exitcond233, label %._crit_edge135.loopexit281, label %.preheader

._crit_edge135.loopexit:                          ; preds = %._crit_edge.us-lcssa.us.us
  br label %._crit_edge135

._crit_edge135.loopexit281:                       ; preds = %._crit_edge
  br label %._crit_edge135

._crit_edge135:                                   ; preds = %._crit_edge135.loopexit281, %._crit_edge135.loopexit, %.preheader125.thread, %.preheader125
  %165 = phi i32 [ %89, %.preheader125.thread ], [ %112, %.preheader125 ], [ %112, %._crit_edge135.loopexit ], [ %112, %._crit_edge135.loopexit281 ]
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %166, i64 %166
  store double 1.000000e+00, double* %167, align 8
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
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %8
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.preheader.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond20, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %10
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!3 = distinct !{!3, !2}
